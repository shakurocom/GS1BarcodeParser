//
//
//

import Foundation

public struct GS1Barcode {

    /// Raw barcode text.
    public let rawString: String
    /// GS1 data elements.
    public let elements: [GS1Barcode.Element]

    /// More human-readable representation of barcode:
    /// Example: `(AI) data (AI) data`
    public func humanReadable() -> String {
        return elements.map({ "(" + $0.applicationIdentifier + ") " + $0.value }).joined(separator: " ")
    }

}

public extension GS1Barcode {

    struct Element: Equatable {

        /// Application Identifier (AI).
        /// For AI with indicated number of decimal places in last digit (example '310n') - all characters will be set here.
        /// For AI with sequence number in last digit (example '723s') - all characters will be set here.
        /// Will be set to empty string if AI is unknown.
        /// Unknown elements are considered to be of any length - so, they will parsed until end of text or next separator character.
        public let applicationIdentifier: String

        /// Value of the element.
        public let value: String

        /// If AI contains indicator of decimal places (in last character) and last character is digit - this property will be set.
        /// Otherwise - `1.0`.
        /// Example:
        ///     - AI (10) - no indicator - value will be `1.0`
        ///     - AI (3103) - has indicator (3) - value will be `0.001`
        public let decimalValueMultiplier: Decimal

        /// Sequence number of the AI. Example: AI (723s).
        /// For AI without sequence number applicable - will be set to -1.
        public let sequenceNumber: Int

        /// If `GS1BarcodeParser.validation` is `none` - validation will be skipped and this field will be set to `true`.
        public let isValid: Bool

    }

}
