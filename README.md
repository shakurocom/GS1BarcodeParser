
![Shakuro GS1BarcodeParser](Resources/title_image.png)
<br><br>
# GS1BarcodeParser
![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![License MIT](https://img.shields.io/badge/license-MIT-green.svg)

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

A `GS1BarcodeParser` provides parsing of GS1 Barcodes.
Library also provides general purpose validator for barcode's content.

## Requirements

- iOS 11.0+
- Xcode 11.0+
- Swift 5.0+

## Installation

### CocoaPods

To integrate GS1BarcodeParser into your Xcode project with CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Shakuro.GS1BarcodeParser'
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use CocoaPods, you can integrate Shakuro.GS1BarcodeParser simply by copying it to your project.

## Usage

### Parser

    let barcodeParser = GS1BarcodeParser()
    barcodeParser.validation = .none // .soft, .hard
    var barcodeElements: [GS1Barcode.Element] = []

    let barcode: String = "8017123456789012345678\u{1D}8018123456789012345678\u{1D}80191234567890"
    do {
        barcodeElements = try barcodeParser.parse(string: barcode).elements
    } catch let error {
        // handle error
    }

Have a look at the [GS1BarcodeParser_Example](https://github.com/shakurocom/GS1BarcodeParser/tree/master/GS1BarcodeParser_Example)

## License

Shakuro.GS1BarcodeParser is released under the MIT license. [See LICENSE](https://github.com/shakurocom/GS1BarcodeParser/blob/master/LICENSE.md) for details.

## Give it a try and reach us


Explore our expertise in <a href="https://shakuro.com/services/native-mobile-development/?utm_source=github&utm_medium=repository&utm_campaign=parser">Native Mobile Development</a> and <a href="https://shakuro.com/services/ios-dev/?utm_source=github&utm_medium=repository&utm_campaign=parser">iOS Development</a>.</p>

If you need professional assistance with your mobile or web project, feel free to <a href="https://shakuro.com/get-in-touch/?utm_source=github&utm_medium=repository&utm_campaign=parser">contact our team</a>

