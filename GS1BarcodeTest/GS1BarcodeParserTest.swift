//
//
//

@testable import GS1Barcode_Framework
import XCTest

final class GS1BarcodeParserTest: XCTestCase {

    func testGS1BarcodeParserAllApplicationIdentifiersHard1() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            let result1 = try parser.parse(string: "00123456789012345678\u{1D}0112345678901234\u{1D}0212345678901234")
            XCTAssertEqual(result1.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.sscc.rawValue, value: "123456789012345678", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gtin.rawValue, value: "12345678901234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.content.rawValue, value: "12345678901234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result2 = try parser.parse(string: "10abcdef\u{1D}11112233\u{1D}12112233")
            XCTAssertEqual(result2.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.batchLot.rawValue, value: "abcdef", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodDate.rawValue, value: "112233", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.dueDate.rawValue, value: "112233", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result3 = try parser.parse(string: "13112233\u{1D}15112233\u{1D}16112233")
            XCTAssertEqual(result3.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.packDate.rawValue, value: "112233", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.bestBeforeOrBestByDate.rawValue, value: "112233", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.sellByDate.rawValue, value: "112233", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result4 = try parser.parse(string: "17112233\u{1D}2012\u{1D}21abCD")
            XCTAssertEqual(result4.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.useByOrExpiryDate.rawValue, value: "112233", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.variant.rawValue, value: "12", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.serial.rawValue, value: "abCD", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result5 = try parser.parse(string: "22abcdefghi\u{1D}235abcdef\u{1D}240abc456")
            XCTAssertEqual(result5.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.cpv.rawValue, value: "abcdefghi", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.tpx.rawValue, value: "abcdef", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.additionalId.rawValue, value: "abc456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result6 = try parser.parse(string: "241abcd5678\u{1D}2421234\u{1D}243abc45f")
            XCTAssertEqual(result6.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.custPartNo.rawValue, value: "abcd5678", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.mtoVariant.rawValue, value: "1234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.pcn.rawValue, value: "abc45f", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result7 = try parser.parse(string: "250123def\u{1D}251abcdef\u{1D}2531234567890123abc456")
            XCTAssertEqual(result7.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.secondarySerial.rawValue, value: "123def", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.refToSource.rawValue, value: "abcdef", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gdti.rawValue, value: "1234567890123abc456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result8 = try parser.parse(string: "254fghj\u{1D}2551234567890123123\u{1D}30005")
            XCTAssertEqual(result8.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.glnExtensioncomponent.rawValue, value: "fghj", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gcn.rawValue, value: "1234567890123123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.varCount.rawValue, value: "005", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result9 = try parser.parse(string: "3101001234\u{1D}3112123456\u{1D}3123234567")
            XCTAssertEqual(result9.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netWeightKG.rawValue + "1", value: "001234", decimalValueMultiplier: 0.1, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.lengthM.rawValue + "2", value: "123456", decimalValueMultiplier: 0.01, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.widthM.rawValue + "3", value: "234567", decimalValueMultiplier: 0.001, sequenceNumber: -1, isValid: true))
            let result0 = try parser.parse(string: "3134345678\u{1D}3145646464\u{1D}3156636363")
            XCTAssertEqual(result0.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.heightM.rawValue + "4", value: "345678", decimalValueMultiplier: 0.0001, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.areaM2.rawValue + "5", value: "646464", decimalValueMultiplier: 0.00001, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netValumeL.rawValue + "6", value: "636363", decimalValueMultiplier: 0.000001, sequenceNumber: -1, isValid: true))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
            return
        }
    }

    func testGS1BarcodeParserAllApplicationIdentifiersHard2() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            let result1 = try parser.parse(string: "3160112233\u{1D}3201112233\u{1D}3210112233")
            XCTAssertEqual(result1.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netValumeM3.rawValue + "0", value: "112233", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netWeightLB.rawValue + "1", value: "112233", decimalValueMultiplier: 0.1, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.lengthI.rawValue + "0", value: "112233", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result2 = try parser.parse(string: "3221123456\u{1D}3230123456\u{1D}3240123456")
            XCTAssertEqual(result2.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.lengthF.rawValue + "1", value: "123456", decimalValueMultiplier: 0.1, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.lengthY.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.widthI.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result3 = try parser.parse(string: "3250123456\u{1D}3260123456\u{1D}3270123456")
            XCTAssertEqual(result3.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.widthF.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.widthY.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.heightI.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result4 = try parser.parse(string: "3270123456\u{1D}3280123456\u{1D}3290123456")
            XCTAssertEqual(result4.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.heightI.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.heightF.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.heightY.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result5 = try parser.parse(string: "3300123456\u{1D}3310123456\u{1D}3320123456")
            XCTAssertEqual(result5.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.grossWightKG.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.lengthMlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.widthMlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result6 = try parser.parse(string: "3330123456\u{1D}3340123456\u{1D}3350123456")
            XCTAssertEqual(result6.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.heightMlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.areaM2log.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.volumeLlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result7 = try parser.parse(string: "3360123456\u{1D}3370123456\u{1D}3400123456")
            XCTAssertEqual(result7.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.volumeM3log.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.kgPerM2.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.grossWeigthLB.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result8 = try parser.parse(string: "3410123456\u{1D}3420123456\u{1D}3430123456")
            XCTAssertEqual(result8.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.lengthIlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.lengthFlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.lengthYlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result9 = try parser.parse(string: "3440123456\u{1D}3450123456\u{1D}3460123456")
            XCTAssertEqual(result9.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.widthIlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.widthFlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.widthYlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result0 = try parser.parse(string: "3470123456\u{1D}3480123456\u{1D}3490123456")
            XCTAssertEqual(result0.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.heightIlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.heightFlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.heightYlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
            return
        }
    }

    func testGS1BarcodeParserAllApplicationIdentifiersHard3() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            let result1 = try parser.parse(string: "3500123456\u{1D}3510123456\u{1D}3520123456")
            XCTAssertEqual(result1.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.areaI2.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.areaF2.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.areaY2.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result2 = try parser.parse(string: "3530123456\u{1D}3540123456\u{1D}3550123456")
            XCTAssertEqual(result2.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.areaI2log.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.areaF2log.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.areaY2log.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result3 = try parser.parse(string: "3560123456\u{1D}3570123456\u{1D}3600123456")
            XCTAssertEqual(result3.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netWeigthT.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netWeigthOZ.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netValumeQ.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result4 = try parser.parse(string: "3610123456\u{1D}3620123456\u{1D}3630123456")
            XCTAssertEqual(result4.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netValumeG.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.volumeQlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.volumeGlog.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result5 = try parser.parse(string: "3640123456\u{1D}3650123456\u{1D}3660123456")
            XCTAssertEqual(result5.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.volumeI3.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.volumeF3.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.volumeY3.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result6 = try parser.parse(string: "3670123456\u{1D}3680123456\u{1D}3690123456")
            XCTAssertEqual(result6.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.volumeI3log.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.volumeF3log.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.volumeY3log.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result7 = try parser.parse(string: "3701234\u{1D}390012345678\u{1D}3910123123456789012345")
            XCTAssertEqual(result7.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.count.rawValue, value: "01234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.amount.rawValue + "0", value: "12345678", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.amountCurrency.rawValue + "0", value: "123123456789012345", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result8 = try parser.parse(string: "3920123456789\u{1D}3930123123456789012345\u{1D}39401234")
            XCTAssertEqual(result8.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.price.rawValue + "0", value: "123456789", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.priceCurrency.rawValue + "0", value: "123123456789012345", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prcntOff.rawValue + "0", value: "1234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result9 = try parser.parse(string: "3950123456\u{1D}400abcdef\u{1D}401abcd")
            XCTAssertEqual(result9.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.priceUOM.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.orderNumber.rawValue, value: "abcdef", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.ginc.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result0 = try parser.parse(string: "40212345678901234567\u{1D}403abcde\u{1D}4101234567890123")
            XCTAssertEqual(result0.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gsin.rawValue, value: "12345678901234567", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.route.rawValue, value: "abcde", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToLocGlobal.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
            return
        }
    }

    func testGS1BarcodeParserAllApplicationIdentifiersHard4() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            let result1 = try parser.parse(string: "4111234567890123\u{1D}4121234567890123\u{1D}4131234567890123")
            XCTAssertEqual(result1.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.billTo.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.purchaseFrom.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipForLoc.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result2 = try parser.parse(string: "4141234567890123\u{1D}4151234567890123\u{1D}4161234567890123")
            XCTAssertEqual(result2.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.locNo.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.payTo.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodServLoc.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result3 = try parser.parse(string: "4171234567890123\u{1D}420abcdefg\u{1D}421123abcd")
            XCTAssertEqual(result3.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.party.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToPost.rawValue, value: "abcdefg", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToPostCountry.rawValue, value: "123abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result4 = try parser.parse(string: "422123\u{1D}423123123456789012\u{1D}424123")
            XCTAssertEqual(result4.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.origin.rawValue, value: "123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.countryInitialProcess.rawValue, value: "123123456789012", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.countryProcess.rawValue, value: "123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result5 = try parser.parse(string: "425123123456789012\u{1D}426123\u{1D}427abc")
            XCTAssertEqual(result5.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.countryDisassembly.rawValue, value: "123123456789012", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.countryFullProcess.rawValue, value: "123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.originSubdivision.rawValue, value: "abc", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result6 = try parser.parse(string: "4300abcd\u{1D}4301abcd\u{1D}4302abcd")
            XCTAssertEqual(result6.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToComp.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToName.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToAdd1.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result7 = try parser.parse(string: "4303abcd\u{1D}4304abcd\u{1D}4305abcd")
            XCTAssertEqual(result7.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToAdd2.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToSub.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToLoc.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result8 = try parser.parse(string: "4306abcd\u{1D}4307ab\u{1D}4308abcdefg")
            XCTAssertEqual(result8.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToReg.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToCountry.rawValue, value: "ab", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.shipToPhone.rawValue, value: "abcdefg", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result9 = try parser.parse(string: "4310abcd\u{1D}4311abcd\u{1D}4312abcd")
            XCTAssertEqual(result9.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToComp.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToName.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToAdd1.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result0 = try parser.parse(string: "4313abcd\u{1D}4314abcd\u{1D}4315abcd")
            XCTAssertEqual(result0.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToAdd2.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToSub.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToLoc.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
            return
        }
    }

    func testGS1BarcodeParserAllApplicationIdentifiersHard5() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            let result1 = try parser.parse(string: "4316abcd\u{1D}4317ab\u{1D}4318abcd")
            XCTAssertEqual(result1.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToReg.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToCountry.rawValue, value: "ab", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToPost.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result2 = try parser.parse(string: "4319abcd\u{1D}4320abcd\u{1D}43211")
            XCTAssertEqual(result2.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToPhone.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.srvDescription.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.dangerousGoods.rawValue, value: "1", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result3 = try parser.parse(string: "43221\u{1D}43231\u{1D}43241234567890")
            XCTAssertEqual(result3.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.authLeav.rawValue, value: "1", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.sigRequired.rawValue, value: "1", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.nbefDelDT.rawValue, value: "1234567890", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result4 = try parser.parse(string: "43251234567890\u{1D}4326123456\u{1D}70011234567890123")
            XCTAssertEqual(result4.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.naftDelDT.rawValue, value: "1234567890", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.relDate.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.nsn.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result5 = try parser.parse(string: "7002abcd\u{1D}70031234567890\u{1D}70041234")
            XCTAssertEqual(result5.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.meatCut.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.expiryTime.rawValue, value: "1234567890", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.activePotency.rawValue, value: "1234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result6 = try parser.parse(string: "7005abcd\u{1D}7006123456\u{1D}70071234567")
            XCTAssertEqual(result6.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.catchArea.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.firstFreezedate.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.harvestDate.rawValue, value: "1234567", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result7 = try parser.parse(string: "7008abc\u{1D}7009abcd\u{1D}7010ab")
            XCTAssertEqual(result7.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.aquaticSpecies.rawValue, value: "abc", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.fishingGearType.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodMethod.rawValue, value: "ab", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result8 = try parser.parse(string: "7020abcd\u{1D}7021abcd\u{1D}7022abcd")
            XCTAssertEqual(result8.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.refurbLot.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.funcStat.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.revStat.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result9 = try parser.parse(string: "7023abcd\u{1D}7031123abcd\u{1D}70401abc")
            XCTAssertEqual(result9.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.giaiAssembly.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.processor.rawValue + "1", value: "123abcd", decimalValueMultiplier: 1.0, sequenceNumber: 1, isValid: true))
            XCTAssertEqual(result9.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.uicExt.rawValue, value: "1abc", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result0 = try parser.parse(string: "710abcd\u{1D}711abcd\u{1D}712abcd")
            XCTAssertEqual(result0.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.nhrnPZN.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.nhrnCIP.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.nhrnCN.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
            return
        }
    }

    func testGS1BarcodeParserAllApplicationIdentifiersHard6() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            let result1 = try parser.parse(string: "713abcd\u{1D}714abcd\u{1D}715abcd")
            XCTAssertEqual(result1.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.nhrnDRN.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.nhrnAIM.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.nhrnNDC.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result2 = try parser.parse(string: "7232ababcdefgh\u{1D}7240abcd\u{1D}800112345678901234")
            XCTAssertEqual(result2.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.cert.rawValue + "2", value: "ababcdefgh", decimalValueMultiplier: 1.0, sequenceNumber: 2, isValid: true))
            XCTAssertEqual(result2.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.protocolID.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.dimensions.rawValue, value: "12345678901234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result3 = try parser.parse(string: "8002abcd\u{1D}800312345678901234abcd\u{1D}8004abcd")
            XCTAssertEqual(result3.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.cmtNo.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.grai.rawValue, value: "12345678901234abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result3.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.giai.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result4 = try parser.parse(string: "8005123456\u{1D}8006123456789012341212\u{1D}8007abcd")
            XCTAssertEqual(result4.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.pricePerUnit.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.itip.rawValue, value: "123456789012341212", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result4.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.iban.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result5 = try parser.parse(string: "8008123456781234\u{1D}8009abcd1234\u{1D}8010abcd")
            XCTAssertEqual(result5.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodDateTime.rawValue, value: "123456781234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.optsen.rawValue, value: "abcd1234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result5.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.cpid.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result6 = try parser.parse(string: "8011123456789012\u{1D}8012abcd\u{1D}8013abcd")
            XCTAssertEqual(result6.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.cpidSerial.rawValue, value: "123456789012", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.version.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result6.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gmn.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result7 = try parser.parse(string: "8017123456789012345678\u{1D}8018123456789012345678\u{1D}80191234567890")
            XCTAssertEqual(result7.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gsrnProvider.rawValue, value: "123456789012345678", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gsrnRecipient.rawValue, value: "123456789012345678", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result7.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.srin.rawValue, value: "1234567890", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result8 = try parser.parse(string: "8020abcd\u{1D}8026123456789012341212\u{1D}8110abcd")
            XCTAssertEqual(result8.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.refNo.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.itipContent.rawValue, value: "123456789012341212", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result8.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.couponCodeNA.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result9 = try parser.parse(string: "81111234\u{1D}8112abcd\u{1D}8200abcd")
            XCTAssertEqual(result9.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.points.rawValue, value: "1234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.positiveOffer.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result9.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.productURL.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result0 = try parser.parse(string: "90abcd\u{1D}91abcd\u{1D}92abcd")
            XCTAssertEqual(result0.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.internalPartner.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.internalCompany1.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result0.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.internalCompany2.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
            return
        }
    }

    func testGS1BarcodeParserAllApplicationIdentifiersHard7() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            let result1 = try parser.parse(string: "93abcd\u{1D}94abcd\u{1D}95abcd")
            XCTAssertEqual(result1.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.internalCompany3.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.internalCompany4.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result1.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.internalCompany5.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result2 = try parser.parse(string: "96abcd\u{1D}97abcd\u{1D}98abcd")
            XCTAssertEqual(result2.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.internalCompany6.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.internalCompany7.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result2.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.internalCompany8.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            let result3 = try parser.parse(string: "99abcd\u{1D}")
            XCTAssertEqual(result3.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.internalCompany9.rawValue, value: "abcd", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
            return
        }
    }

    func testGS1BarcodeParserValidationHard() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            // invalid AI (01) - length is lower than specified
            _ = try parser.parse(string: "11123456011234567890123")
            XCTAssert(false, "unexpected no error")
        } catch let error as GS1BarcodeParser.Error {
            XCTAssertEqual(error, GS1BarcodeParser.Error.invalidElement(text: "011234567890123"))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            // invalid AI (01) - contains non-digit character
            _ = try parser.parse(string: "1112345601a2345678901234")
            XCTAssert(false, "unexpected no error")
        } catch let error as GS1BarcodeParser.Error {
            XCTAssertEqual(error, GS1BarcodeParser.Error.invalidElement(text: "01a2345678901234"))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            // invalid AI (21) - contains disallowed character ~
            _ = try parser.parse(string: "1112345621a23~45678901234")
            XCTAssert(false, "unexpected no error")
        } catch let error as GS1BarcodeParser.Error {
            XCTAssertEqual(error, GS1BarcodeParser.Error.invalidElement(text: "21a23~45678901234"))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            // unknown AI (03)
            _ = try parser.parse(string: "11123456031234567890123")
            XCTAssert(false, "unexpected no error")
        } catch let error as GS1BarcodeParser.Error {
            XCTAssertEqual(error, GS1BarcodeParser.Error.unknownElement(text: "031234567890123"))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            // dublicate AI (11)
            _ = try parser.parse(string: "11123456011234567890123411123456")
            XCTAssert(false, "unexpected no error")
        } catch let error as GS1BarcodeParser.Error {
            XCTAssertEqual(error, GS1BarcodeParser.Error.dublicateElement(applicationIdentifier: "11"))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
    }

    func testGS1BarcodeParserValidationSoft() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .soft
            let result = try parser.parse(string: "11123456\u{1D}11123456\u{1D}21a23~45678901234\u{1D}031234567890123\u{1D}1512345a\u{1D}011234567890123")
            XCTAssertEqual(result.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodDate.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // dublicate AI (11)
            XCTAssertEqual(result.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodDate.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: false))
            // invalid AI (21) - contains disallowed character ~
            XCTAssertEqual(result.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.serial.rawValue, value: "a23~45678901234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: false))
            // unknown AI (03)
            XCTAssertEqual(result.elements[3], GS1Barcode.Element(applicationIdentifier: "", value: "031234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: false))
            // invalid AI (15) - contains non-digit character
            XCTAssertEqual(result.elements[4], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.bestBeforeOrBestByDate.rawValue, value: "12345a", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: false))
            // invalid AI (01) - length is lower than specified
            XCTAssertEqual(result.elements[5], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gtin.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: false))
            XCTAssertEqual(result.elements.count, 6)
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
    }

    func testGS1BarcodeParserValidationNone() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .none
            let result = try parser.parse(string: "11123456\u{1D}11123456\u{1D}21a23~45678901234\u{1D}031234567890123\u{1D}1512345a\u{1D}011234567890123")
            XCTAssertEqual(result.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodDate.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // dublicate AI (11)
            XCTAssertEqual(result.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodDate.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // invalid AI (21) - contains disallowed character ~
            XCTAssertEqual(result.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.serial.rawValue, value: "a23~45678901234", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // unknown AI (03)
            XCTAssertEqual(result.elements[3], GS1Barcode.Element(applicationIdentifier: "", value: "031234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // invalid AI (15) - contains non-digit character
            XCTAssertEqual(result.elements[4], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.bestBeforeOrBestByDate.rawValue, value: "12345a", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // invalid AI (01) - length is lower than specified
            XCTAssertEqual(result.elements[5], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gtin.rawValue, value: "1234567890123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result.elements.count, 6)
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
    }

    func testGS1BarcodeParserEmptyBarcode() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .none
            _ = try parser.parse(string: "")
            XCTAssert(false, "unexpected no error")
        } catch let error as GS1BarcodeParser.Error {
            XCTAssertEqual(error, GS1BarcodeParser.Error.noApplicationIdentifiersFound)
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .none
            _ = try parser.parse(string: "03123456789") // all unkonwn AI should lead to same error
            XCTAssert(false, "unexpected no error")
        } catch let error as GS1BarcodeParser.Error {
            XCTAssertEqual(error, GS1BarcodeParser.Error.noApplicationIdentifiersFound)
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
    }

    func testGS1BarcodeParserAllowedCharacters() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            let result = try parser.parse(string: "2550123456789012312\u{1D}4314ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!\"%&'()*+,-./_:;<=>?")
            XCTAssertEqual(result.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gcn.rawValue, value: "0123456789012312", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            XCTAssertEqual(result.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToSub.rawValue, value: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!\"%&'()*+,-./_:;<=>?", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
    }

    func testGS1BarcodeParserVariableLength() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            let result = try parser.parse(string: "25501234567890123123\u{1D}4314abcde12345")
            // AI with non-predefined length - terminated by separator
            XCTAssertEqual(result.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.gcn.rawValue, value: "01234567890123123", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // AI with non-predefined length - terminated by end of string
            XCTAssertEqual(result.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.rtnToSub.rawValue, value: "abcde12345", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
    }

    func testGS1BarcodeParserDecimalDigit() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .soft
            let result = try parser.parse(string: "11123456\u{1D}3100123456\u{1D}3105123456\u{1D}3109123456\u{1D}3109123456")
            // no digit
            XCTAssertEqual(result.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodDate.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // 0
            XCTAssertEqual(result.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netWeightKG.rawValue + "0", value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // 5
            XCTAssertEqual(result.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netWeightKG.rawValue + "5", value: "123456", decimalValueMultiplier: 0.00001, sequenceNumber: -1, isValid: true))
            // 9
            XCTAssertEqual(result.elements[3], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netWeightKG.rawValue + "9", value: "123456", decimalValueMultiplier: 0.000000001, sequenceNumber: -1, isValid: true))
            // 9 (dublicate)
            XCTAssertEqual(result.elements[4], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.netWeightKG.rawValue + "9", value: "123456", decimalValueMultiplier: 0.000000001, sequenceNumber: -1, isValid: false))
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
    }

    func testGS1BarcodeParserSequenceNumber() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .soft
            let result = try parser.parse(string: "11123456\u{1D}7030123abc\u{1D}7035123abc\u{1D}7039123abc\u{1D}7039123abc")
            // no sequence number
            XCTAssertEqual(result.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodDate.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // 0
            XCTAssertEqual(result.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.processor.rawValue + "0", value: "123abc", decimalValueMultiplier: 1.0, sequenceNumber: 0, isValid: true))
            // 5
            XCTAssertEqual(result.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.processor.rawValue + "5", value: "123abc", decimalValueMultiplier: 1.0, sequenceNumber: 5, isValid: true))
            // 9
            XCTAssertEqual(result.elements[3], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.processor.rawValue + "9", value: "123abc", decimalValueMultiplier: 1.0, sequenceNumber: 9, isValid: true))
            // 9 (dublicate)
            XCTAssertEqual(result.elements[4], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.processor.rawValue + "9", value: "123abc", decimalValueMultiplier: 1.0, sequenceNumber: 9, isValid: false))
            XCTAssertEqual(result.elements.count, 5)
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
    }

    func testGS1BarcodeParserSeparators() {
        do {
            let parser = GS1BarcodeParser()
            parser.validation = .hard
            let result = try parser.parse(string: "\u{1D}\u{1D}1112345615123456\u{1D}\u{1D}\u{1D}7030123abc\u{1D}7035123abc\u{1D}\u{1D}\u{1D}")
            // many separators in the beginning
            XCTAssertEqual(result.elements[0], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.prodDate.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // no separators between elements pf predefined length
            XCTAssertEqual(result.elements[1], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.bestBeforeOrBestByDate.rawValue, value: "123456", decimalValueMultiplier: 1.0, sequenceNumber: -1, isValid: true))
            // single separator
            XCTAssertEqual(result.elements[2], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.processor.rawValue + "0", value: "123abc", decimalValueMultiplier: 1.0, sequenceNumber: 0, isValid: true))
            // many separators between elements
            XCTAssertEqual(result.elements[3], GS1Barcode.Element(applicationIdentifier: GS1Barcode.Element.ApplicationIdentifier.processor.rawValue + "5", value: "123abc", decimalValueMultiplier: 1.0, sequenceNumber: 5, isValid: true))
            // many separators at the end
            XCTAssertEqual(result.elements.count, 4)
        } catch let error {
            XCTAssert(false, "unexpected error: \(error)")
        }
    }

}

// swiftlint:enable line_length
