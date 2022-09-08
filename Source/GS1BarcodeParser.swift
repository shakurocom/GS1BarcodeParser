//
// 2022
//

import Foundation

public extension GS1BarcodeParser {

    enum Error: Swift.Error, Equatable {

        /// Parsed string do not contain any known Application Identifiers (AI)
        case noApplicationIdentifiersFound

        /// Element do not pass validation.
        /// - parameter text: text of the element.
        case invalidElement(text: String)

        /// Element has unknown AI.
        /// - parameter text: text of the element.
        case unknownElement(text: String)

        /// Barcode contains more than one element with same AI
        case dublicateElement(applicationIdentifier: String)

    }

}

public extension GS1BarcodeParser {

    enum Validation {

        /// Validation is disabled.
        case none

        /// Invalid elements are marked as invalid.
        /// Unknown elements are allowed.
        /// Dublicate elements (after first) will be marked as invalid.
        case soft

        /// Invalid elements produce `GS1BarcodeParser.Error.invalidElement` error.
        /// Unknown elements produce `GS1BarcodeParser.Error.unknownElement` error.
        /// Dublicate elements produce `GS1BarcodeParser.Error.dublicateElement` error.
        case hard

    }

}

public extension GS1BarcodeParser {

    struct ElementDescription {

        /// Application Identifier (AI).
        /// For AI with indicated number of decimal places in last digit (example '310n') - only first 3 characters should be set here.
        public let applicationIdentifier: String

        /// Length of the predefined-length AI.
        /// if `nil` - AI is considered to be of any length.
        public let length: Int?

        /// Validation rule.
        /// if `true` & `GS1BarcodeParser.validateElements`
        public let isNumericOnly: Bool

        /// Last digit contains additional information?
        /// If yes - AI should be defined without last character.
        public let lastDigit: GS1BarcodeParser.ElementDescription.LastDigit

    }

}

public extension GS1BarcodeParser.ElementDescription {

    enum LastDigit {

        /// Last digit of AI do not contain additional information
        case none

        /// Last digit indicates number of decimal places in the value of parsed element.
        /// Validation of this last character will be performed only if `GS1BarcodeParser.validateElements` is set to `true`.
        case decimalPlaces

        /// Last digit indicates iteration of the same AI in the barcode.
        /// Validation of this last character will be performed only if `GS1BarcodeParser.validateElements` is set to `true`.
        case sequenceNumber

    }

}

/// Parser for GS1 standard.
///
/// Master specifications: https://www.gs1.org/docs/barcodes/GS1_General_Specifications.pdf (Release 22.0, Ratified, Jan 2022)
/// Important bits: p149-155, p502, p504
public class GS1BarcodeParser {

    /// Enables validation of parsed elements.
    /// If disabled - all elements will be marked as valid.
    public var validation: GS1BarcodeParser.Validation = .none

    /// Characters allowed to be in barcode by GS1 standard (see page 502 figure 7.11-1).
    /// Conforms to ISO/IEC 646 Table 1.
    public let disallowedCharactersAny = CharacterSet(
        charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!\"%&'()*+,-./_:;<=>?").inverted

    /// Characters allowed in numeric-only `Barcode.Element`s.
    public let disallowedCharacresNumeric = CharacterSet(charactersIn: "0123456789").inverted

    /// Separator character. (described in specification section 7.8.4).
    /// Default value is `\u{1D}`.
    /// Another common value (according to specification) is `\u{25}`.
    /// Adjust this value if your scanner configured to produce different separator character.
    public var separator: String = "\u{1D}"

    /// Default value is 
    public var elementDescriptions: [GS1BarcodeParser.ElementDescription] = GS1BarcodeParser.defaultElementDescriptions()

    // MARK: - Public

    public func parse(string fullString: String) throws -> GS1Barcode {
        guard !fullString.isEmpty else {
            throw GS1BarcodeParser.Error.noApplicationIdentifiersFound
        }
        var elements: [GS1Barcode.Element] = []
        var notParsedString: Substring = fullString[fullString.startIndex..<fullString.endIndex]
        while !notParsedString.isEmpty {
            // remove separator if present
            // it can be there from previous element or possibly come as a first character in full string
            if notParsedString.starts(with: separator) {
                notParsedString = notParsedString.dropFirst(separator.count)
                continue
            }
            // find first matching AI
            if let foundDescription = elementDescriptions.first(where: { notParsedString.starts(with: $0.applicationIdentifier) }) {
                // decimal places digit is part of resulting AI
                var aiLength = foundDescription.applicationIdentifier.count
                if foundDescription.lastDigit != .none {
                    aiLength += 1
                }
                let applicationIdentifier: Substring = notParsedString.prefix(aiLength)
                // advance past AI
                notParsedString = notParsedString.dropFirst(applicationIdentifier.count)
                // get value
                let value: Substring
                if let valueLength = foundDescription.length {
                    // up to specified length or end of string
                    value = notParsedString.prefix(valueLength)
                } else {
                    // up to next separator character or end of string
                    if let foundRange = notParsedString.range(of: separator, options: [.literal]) {
                        value = notParsedString.prefix(upTo: foundRange.lowerBound)
                    } else {
                        value = notParsedString
                    }
                }
                let newElement = try element(existingElements: elements,
                                             applicationIdentifier: String(applicationIdentifier),
                                             value: String(value),
                                             length: foundDescription.length,
                                             lastDigit: foundDescription.lastDigit,
                                             isNumericOnly: foundDescription.isNumericOnly)
                // save element
                elements.append(newElement)
                // advance past value
                notParsedString = notParsedString.dropFirst(value.count)
                continue
            } else {
                // this is considered unknown AI
                let elementSubstring: Substring
                // find end of the element: seperator or end of string
                if let foundRange = notParsedString.range(of: separator, options: [.literal]) {
                    elementSubstring = notParsedString.prefix(upTo: foundRange.lowerBound)
                } else {
                    elementSubstring = notParsedString
                }
                let elementText = String(elementSubstring)
                let newElement = try element(existingElements: elements,
                                             applicationIdentifier: "",
                                             value: elementText,
                                             length: nil,
                                             lastDigit: .none,
                                             isNumericOnly: false)
                // save element
                elements.append(newElement)
                // advance not parsed part
                notParsedString = notParsedString.dropFirst(elementSubstring.count)
                continue
            }
        }
        // there should be at least one known AI even with disabled validation
        guard elements.contains(where: { !$0.applicationIdentifier.isEmpty }) else {
            throw GS1BarcodeParser.Error.noApplicationIdentifiersFound
        }
        // done
        return GS1Barcode(rawString: fullString, elements: elements)
    }

    // MARK: - Private

    /// Apply validation if needed and create element.
    private func element(existingElements: [GS1Barcode.Element],
                         applicationIdentifier: String,
                         value: String,
                         length: Int?,
                         lastDigit: GS1BarcodeParser.ElementDescription.LastDigit,
                         isNumericOnly: Bool) throws -> GS1Barcode.Element {
        if validation == .hard && applicationIdentifier.isEmpty {
            throw GS1BarcodeParser.Error.unknownElement(text: applicationIdentifier + value)
        }
        var isValid: Bool = true
        var decimalValueMultiplier: Decimal = 1.0
        var sequenceNumber: Int = -1
        if lastDigit != .none {
            if !applicationIdentifier.isEmpty {
                let lastCharacter = applicationIdentifier.suffix(from: applicationIdentifier.index(before: applicationIdentifier.endIndex))
                if let lastCharacterInt = Int(lastCharacter) {
                    switch lastDigit {
                    case .none:
                        break
                    case .decimalPlaces:
                        decimalValueMultiplier = pow(0.1, lastCharacterInt)
                    case .sequenceNumber:
                        sequenceNumber = lastCharacterInt
                    }
                } else if validation != .none {
                    isValid = false
                }
            }
        }
        if validation != .none {
            let disallowedCharacters = isNumericOnly ? disallowedCharacresNumeric : disallowedCharactersAny
            if applicationIdentifier.isEmpty {
                isValid = false
            } else if value.rangeOfCharacter(from: disallowedCharacters) != nil {
                isValid = false
            } else if let actualLength = length, value.count < actualLength {
                isValid = false
            } else if existingElements.contains(where: { $0.applicationIdentifier == applicationIdentifier }) {
                isValid = false
                if validation == .hard {
                    throw GS1BarcodeParser.Error.dublicateElement(applicationIdentifier: applicationIdentifier)
                }
            }
        }
        if validation == .hard && !isValid {
            throw GS1BarcodeParser.Error.invalidElement(text: applicationIdentifier + value)
        }
        return GS1Barcode.Element(applicationIdentifier: applicationIdentifier,
                                  value: value,
                                  decimalValueMultiplier: decimalValueMultiplier,
                                  sequenceNumber: sequenceNumber,
                                  isValid: isValid)
    }

}
