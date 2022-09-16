//
// Copyright (c) 2022 Shakuro (https://shakuro.com/)
//

import GS1BarcodeParser_Framework
import UIKit

class ExampleGS1BarcodeParserViewController: UIViewController {

    enum Constant {
        static let exampleBarcodeCellID: String = "barcodeExampleTableViewCell"
        static let barcodeElementCellID: String = "barcodeElementTableViewCell"
    }

    @IBOutlet private var barcodeExamplesTableView: UITableView!
    @IBOutlet private var barcodeElementsTableView: UITableView!
    @IBOutlet private var barcodeInputField: UITextField!
    @IBOutlet private var parseBarcodeButton: UIButton!

    private let barcodeParser = GS1BarcodeParser()

    private let barcodeExamples: [String] = [
        "00123456789012345678\u{1D}0112345678901234\u{1D}0212345678901234",
        "13112233\u{1D}15112233\u{1D}16112233",
        "250123def\u{1D}251abcdef\u{1D}2531234567890123abc456",
        "3410123456\u{1D}3420123456\u{1D}3430123456",
        "8017123456789012345678\u{1D}8018123456789012345678\u{1D}80191234567890"
    ]
    private var barcodeElements: [GS1Barcode.Element] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("GS1Barcode", comment: "")
        parseBarcodeButton.backgroundColor = UIColor.systemBlue
        parseBarcodeButton.setTitleColor(UIColor.white, for: .normal)
        parseBarcodeButton.layer.masksToBounds = true
        parseBarcodeButton.layer.cornerRadius = 8.0
    }

    @IBAction private func parseButtonPressed(_ sender: Any) {
        guard let text = barcodeInputField.text else {
            return
        }
        barcodeElements = (try? barcodeParser.parse(string: text))?.elements ?? []
        barcodeElementsTableView.reloadData()
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ExampleGS1BarcodeParserViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == barcodeExamplesTableView {
            return barcodeExamples.count
        } else {
            return barcodeElements.count
        }

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView === barcodeExamplesTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.exampleBarcodeCellID, for: indexPath)
            cell.textLabel?.text = barcodeExamples[indexPath.row]
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.barcodeElementCellID, for: indexPath) as? BarcodeElementTableViewCell else {
                return UITableViewCell()
            }
            cell.setup(barcodeElement: barcodeElements[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableView === barcodeExamplesTableView ? NSLocalizedString("Barcode examples", comment: "") : NSLocalizedString("Barcode elements", comment: "")
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView === barcodeExamplesTableView {
            tableView.deselectRow(at: indexPath, animated: true)
            barcodeInputField.text = barcodeExamples[indexPath.row]
        }
    }

}
