//
// Copyright (c) 2022 Shakuro (https://shakuro.com/)
//

import GS1BarcodeParser_Framework
import UIKit

class BarcodeElementTableViewCell: UITableViewCell {

    @IBOutlet private var applicationIdentifierLabel: UILabel!
    @IBOutlet private var valueLabel: UILabel!
    @IBOutlet private var decimalValueMultiplierLabel: UILabel!
    @IBOutlet private var sequenceNumberLabel: UILabel!
    @IBOutlet private var isValidLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(barcodeElement: GS1Barcode.Element?) {
        guard let actualElement = barcodeElement else {
            applicationIdentifierLabel.text = ""
            valueLabel.text = ""
            decimalValueMultiplierLabel.text = ""
            sequenceNumberLabel.text = ""
            isValidLabel.text = ""
            return
        }
        applicationIdentifierLabel.text = "Application Identifier: \(actualElement.applicationIdentifier)"
        valueLabel.text = "Value: \(actualElement.value)"
        decimalValueMultiplierLabel.text = "Decimal Value Multiplier: \(actualElement.decimalValueMultiplier)"
        sequenceNumberLabel.text = "Sequence Number: \(actualElement.sequenceNumber)"
        isValidLabel.text = "Is Valid: \(actualElement.isValid)"
    }

}
