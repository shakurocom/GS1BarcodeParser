//
//
//

import Foundation

public extension GS1Barcode.Element {

    /// Definition from https://www.gs1.org/docs/barcodes/GS1_General_Specifications.pdf#page=150 Figure 3.2-1. GS1 Application Identifiers.
    /// For AIs containing number of decimal places digit - only static prefix is defined.
    /// For AIs with sequence number - only static prefix is defined.
    enum ApplicationIdentifier: String {
        /// Identification of a logistic unit (SSCC): AI (00)
        /// N2+N18
        case sscc = "00"
        /// Identification of a trade item (GTIN): AI (01)
        /// N2+N14
        case gtin = "01"
        /// Identification of trade items contained in a logistic unit: AI (02)
        /// N2+N14
        case content = "02"
        /// Batch or lot number: AI (10)
        /// N2+X..20 (FNC1)
        case batchLot = "10"
        /// Production date: AI (11)
        /// N2+N6
        case prodDate = "11"
        /// Due date for amount on payment slip: AI (12)
        /// N2+N6
        case dueDate = "12"
        /// Packaging date: AI (13)
        ///  N2+N6
        case packDate = "13"
        /// Best before date: AI (15)
        /// N2+N6
        case bestBeforeOrBestByDate = "15"
        /// Sell by date: AI (16)
        /// N2+N6
        case sellByDate = "16"
        /// Expiration date: AI (17)
        /// N2+N6
        case useByOrExpiryDate = "17"
        /// Internal product variant: AI (20)
        /// N2+N2
        case variant = "20"
        /// Serial number: AI (21)
        ///  N2+X..20 (FNC1)
        case serial = "21"
        /// Consumer product variant: AI (22)
        /// N2+X..20 (FNC1)
        case cpv = "22"
        /// Third Party Controlled, Serialised Extension of Global Trade Item Number (GTIN) (TPX): AI (235)
        /// N3+X..28 (FNC1)
        case tpx = "235"
        /// Additional product identification assigned by the manufacturer: AI (240)
        /// N3+X..30 (FNC1)
        case  additionalId = "240"
        /// Customer part number: AI (241)
        /// N3+X..30 (FNC1)
        case custPartNo = "241"
        /// Made-to-Order variation number: AI (242)
        /// N3+N..6 (FNC1)
        case mtoVariant = "242"
        /// Packaging component number: AI (243)
        /// N3+X..20 (FNC1)
        case pcn = "243"
        /// Secondary serial number: AI (250)
        /// N3+X..30 (FNC1)
        case secondarySerial = "250"
        /// Reference to source entity: AI (251)
        /// N3+X..30 (FNC1)
        case refToSource = "251"
        /// Global Document Type Identifier (GDTI): AI (253)
        /// N3+N13+X..17 (FNC1)
        case gdti = "253"
        /// Global Location Number (GLN) extension component: AI (254)
        /// N3+X..20 (FNC1)
        case glnExtensioncomponent = "254"
        /// Global Coupon Number (GCN): AI (255)
        /// N3+N13+N..12 (FNC1)
        case gcn = "255"
        /// Variable count of items: AI (30)
        /// N2+N..8 (FNC1)
        case varCount = "30"
        /// Net weight, kilograms (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case netWeightKG = "310"
        /// Length or first dimension, metres (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case lengthM = "311"
        /// Width, diameter, or second dimension, metres (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case widthM = "312"
        /// Depth, thickness, height, or third dimension, metres (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case heightM = "313"
        /// Area, square metres (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case areaM2 = "314"
        /// Net volume, litres (variable measure trade item)
        ///  N4+N6
        ///  - warning: fourth digit indicates number of decimal places
        case netValumeL = "315"
        /// Net volume, cubic metres (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case netValumeM3 = "316"
        /// Net weight, pounds (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case netWeightLB = "320"
        /// Length or first dimension, inches (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case lengthI = "321"
        /// Length or first dimension, feet (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case lengthF = "322"
        /// Length or first dimension, yards (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case lengthY = "323"
        /// Width, diameter, or second dimension, inches (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case widthI = "324"
        /// Width, diameter, or second dimension, feet (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case widthF = "325"
        /// Width, diameter, or second dimension, yards (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case widthY = "326"
        /// Depth, thickness, height, or third dimension, inches (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case heightI = "327"
        ///  Depth, thickness, height, or third dimension, feet (variable measure trade item)
        ///  N4+N6
        ///  - warning: fourth digit indicates number of decimal places
        case heightF = "328"
        ///  Depth, thickness, height, or third dimension, yards (variable measure trade item)
        ///  N4+N6
        ///  - warning: fourth digit indicates number of decimal places
        case heightY = "329"
        /// Logistic weight, kilograms
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case grossWightKG = "330"
        /// Length or first dimension, metres
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case lengthMlog = "331"
        /// Width, diameter, or second dimension, metres
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case widthMlog = "332"
        /// Depth, thickness, height, or third dimension, metres
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case heightMlog = "333"
        /// Area, square metres
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case areaM2log = "334"
        /// Logistic volume, litres
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case volumeLlog = "335"
        /// Logistic volume, cubic metres
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case volumeM3log = "336"
        /// Kilograms per square metre
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case kgPerM2 = "337"
        /// Logistic weight, pounds
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case grossWeigthLB = "340"
        /// Length or first dimension, inches
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case lengthIlog = "341"
        /// Length or first dimension, feet
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case lengthFlog = "342"
        /// Length or first dimension, yards
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case lengthYlog = "343"
        /// Width, diameter, or second dimension, inches
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case widthIlog = "344"
        /// Width, diameter, or second dimension, feet
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case widthFlog = "345"
        /// Width, diameter, or second dimension, yard
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case widthYlog = "346"
        /// Depth, thickness, height, or third dimension, inches
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case heightIlog = "347"
        /// Depth, thickness, height, or third dimension, feet
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case heightFlog = "348"
        /// Depth, thickness, height, or third dimension, yards
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case heightYlog = "349"
        /// Area, square inches (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case areaI2 = "350"
        /// Area, square feet (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case areaF2 = "351"
        /// Area, square yards (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case areaY2 = "352"
        /// Area, square inches
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case areaI2log = "353"
        /// Area, square feet
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case areaF2log = "354"
        /// Area, square yards
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case areaY2log = "355"
        /// Net weight, troy ounces (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case netWeigthT = "356"
        /// Net weight (or volume), ounces (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case netWeigthOZ = "357"
        /// Net volume, quarts (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case netValumeQ = "360"
        /// Net volume, gallons U.S. (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case netValumeG = "361"
        /// Logistic volume, quarts
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case volumeQlog = "362"
        /// Logistic volume, gallons U.S.
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case volumeGlog = "363"
        /// Net volume, cubic inches (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case volumeI3 = "364"
        /// Net volume, cubic feet (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case volumeF3 = "365"
        /// Net volume, cubic yards (variable measure trade item)
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case volumeY3 = "366"
        /// Logistic volume, cubic inches
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case volumeI3log = "367"
        /// Logistic volume, cubic feet
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case volumeF3log = "368"
        /// Logistic volume, cubic yards
        /// N4+N6
        /// - warning: fourth digit indicates number of decimal places
        case volumeY3log = "369"
        /// Count of trade items or trade item pieces contained in a logistic unit: AI (37)
        /// N2+N..8 (FNC1)
        case count = "37"
        /// Amount payable or coupon value - Single monetary area: AI (390n)
        /// N4+N..15 (FNC1)
        /// - warning: fourth digit indicates number of decimal places
        case amount = "390"
        /// Amount payable and ISO currency code: AI (391n)
        /// N4+N3+N..15 (FNC1)
        /// - warning: fourth digit indicates number of decimal places
        case amountCurrency = "391"
        /// Amount payable for a variable measure trade item – Single monetary area: AI (392n)
        /// N4+N..15 (FNC1)
        /// - warning: fourth digit indicates number of decimal places
        case price = "392"
        /// Amount payable for a variable measure trade item and ISO currency code: AI (393n)
        /// N4+N3+N..15 (FNC1)
        /// - warning: fourth digit indicates number of decimal places
        case priceCurrency = "393"
        /// Percentage discount of a coupon: AI (394n)
        /// N4+N4 (FNC1)
        /// - warning: fourth digit indicates number of decimal places
        case prcntOff = "394"
        /// Amount payable per unit of measure single monetary area (variable measure trade item): AI (395n)
        /// N4+N6 (FNC1)
        /// - warning: fourth digit indicates number of decimal places
        case priceUOM = "395"
        /// Customer’s purchase order number: AI (400)
        /// N3+X..30 (FNC1)
        case orderNumber = "400"
        /// Global Identification Number for Consignment (GINC): AI (401)
        /// N3+X..30 (FNC1)
        case ginc = "401"
        /// Global Shipment Identification Number (GSIN): AI (402)
        /// N3+N17 (FNC1)
        case gsin = "402"
        /// Routing code: AI (403)
        /// N3+X..30 (FNC1)
        case route = "403"
        /// Ship to - Deliver to Global Location Number (GLN): AI (410)
        /// N3+N13
        case shipToLocGlobal = "410"
        /// Bill to - Invoice to Global Location Number (GLN): AI (411)
        /// N3+N13
        case billTo = "411"
        /// Purchased from Global Location Number (GLN): AI (412)
        /// N3+N13
        case purchaseFrom = "412"
        /// Ship for - Deliver for - Forward to Global Location Number (GLN): AI (413)
        /// N3+N13
        case shipForLoc = "413"
        /// Identification of a physical location - Global Location Number (GLN): AI (414)
        /// N3+N13
        case locNo = "414"
        /// Global Location Number (GLN) of the invoicing party: AI (415)
        /// N3+N13
        case payTo = "415"
        /// Global Location Number (GLN) of the production or service location: AI (416)
        /// N3+N13
        case prodServLoc = "416"
        /// Party Global Location Number (GLN): AI (417)
        /// N3+N13
        case party = "417"
        /// Ship-to / Deliver-to postal code within a single postal authority: AI (420)
        /// N3+X..20 (FNC1)
        case shipToPost = "420"
        /// Ship-to / Deliver-to postal code with three-digit ISO country code: AI (421)
        /// N3+N3+X..9 (FNC1)
        case shipToPostCountry = "421"
        /// Country of origin of a trade item: AI (422)
        /// N3+N3 (FNC1)
        case origin = "422"
        /// Country of initial processing: AI (423)
        /// N3+N3+N..12 (FNC1)
        case countryInitialProcess = "423"
        /// Country of processing: AI (424)
        /// N3+N3 (FNC1)
        case countryProcess = "424"
        /// Country of disassembly: AI (425)
        /// N3+N3+N..12 (FNC1)
        case countryDisassembly = "425"
        /// Country covering full process chain: AI (426)
        /// N3+N3 (FNC1)
        case countryFullProcess = "426"
        /// Country subdivision of origin code for a trade item: AI (427)
        /// N3+X..3 (FNC1)
        case originSubdivision = "427"
        /// Ship-to / Deliver-to Company name: AI (4300)
        /// N4+X..35 (FNC1)
        case shipToComp = "4300"
        /// Ship-to / Deliver-to contact name: AI (4301)
        /// N4+X..35 (FNC1)
        case shipToName = "4301"
        /// Ship-to / Deliver-to address line 1: AI (4302)
        /// N4+X..70 (FNC1)
        case shipToAdd1 = "4302"
        /// Ship-to / Deliver-to address line 2: AI (4303)
        /// N4+X..70 (FNC1)
        case shipToAdd2 = "4303"
        /// Ship-to / Deliver-to suburb: AI (4304)
        /// N4+X..70 (FNC1)
        case shipToSub = "4304"
        /// Ship-to / Deliver-to locality: AI (4305)
        /// N4+X..70 (FNC1)
        case shipToLoc = "4305"
        /// Ship-to / Deliver-to region: AI (4306)
        /// N4+X..70 (FNC1)
        case shipToReg = "4306"
        /// Ship-to / Deliver-to country code: AI (4307)
        /// N4+X2 (FNC1)
        case shipToCountry = "4307"
        /// Ship-to / Deliver-to telephone number: AI (4308)
        /// N4+X..30 (FNC1)
        case shipToPhone = "4308"
        /// Return-to company name: AI (4310)
        /// N4+X..35 (FNC1)
        case rtnToComp = "4310"
        /// Return-to contact name: AI (4311)
        /// N4+X..35 (FNC1)
        case rtnToName = "4311"
        /// Return-to address line 1: AI (4312)
        /// N4+X..70 (FNC1)
        case rtnToAdd1 = "4312"
        /// Return-to address line 2: AI (4313)
        /// N4+X..70 (FNC1)
        case rtnToAdd2 = "4313"
        /// Return-to suburb: AI (4314)
        /// N4+X..70 (FNC1)
        case rtnToSub = "4314"
        /// Return-to locality: AI (4315)
        /// N4+X..70 (FNC1)
        case rtnToLoc = "4315"
        /// Return-to region: AI (4316)
        ///  N4+X..70 (FNC1)
        case rtnToReg = "4316"
        /// Return-to country code: AI (4317)
        /// N4+X2 (FNC1)
        case rtnToCountry = "4317"
        /// Return-to postal code: AI (4318)
        /// N4+X..20 (FNC1)
        case rtnToPost = "4318"
        /// Return-to telephone number: AI (4319)
        /// N4+X..30 (FNC1)
        case rtnToPhone = "4319"
        /// Service code description: AI (4320)
        /// N4+X..35 (FNC1)
        case srvDescription = "4320"
        /// Dangerous goods flag: AI (4321)
        /// N4+N1 (FNC1)
        case dangerousGoods = "4321"
        /// Authority to leave flag: AI (4322)
        /// N4+N1 (FNC1)
        case authLeav = "4322"
        /// Signature required flag: AI (4323)
        /// N4+N1 (FNC1)
        case sigRequired = "4323"
        /// Not before delivery date/time: AI (4324)
        /// N4+N10 (FNC1)
        case nbefDelDT = "4324"
        /// Not after delivery date/time: AI (4325)
        /// N4+N10 (FNC1)
        case naftDelDT = "4325"
        /// Release date: AI (4326)
        /// N4+N6 (FNC1)
        case relDate = "4326"
        /// NATO Stock Number (NSN): AI (7001)
        /// N4+N13 (FNC1)
        case nsn = "7001"
        /// UN/ECE meat carcasses and cuts classification: AI (7002)
        /// N4+X..30 (FNC1)
        case meatCut = "7002"
        /// Expiration date and time: AI (7003)
        /// N4+N10 (FNC1)
        case expiryTime = "7003"
        /// Active potency: AI (7004)
        /// N4+N..4 (FNC1)
        case activePotency = "7004"
        /// Catch area: AI (7005)
        /// N4+X..12 (FNC1)
        case catchArea = "7005"
        /// First freeze date: AI (7006)
        /// N4+N6 (FNC1)
        case firstFreezedate = "7006"
        /// Harvest date: AI (7007)
        /// N4+N6..12 (FNC1)
        case harvestDate = "7007"
        /// Species for fishery purposes: AI (7008)
        /// N4+X..3 (FNC1)
        case aquaticSpecies = "7008"
        /// Fishing gear type: AI (7009)
        /// N4+X..10 (FNC1)
        case fishingGearType = "7009"
        /// Production method: AI (7010)
        /// N4+X..2 (FNC1)
        case prodMethod = "7010"
        /// Refurbishment lot ID: AI (7020)
        /// N4+X..20 (FNC1)
        case refurbLot = "7020"
        /// Functional status: AI (7021)
        /// N4+X..20 (FNC1)
        case funcStat = "7021"
        /// Revision status: AI (7022)
        /// N4+X..20 (FNC1)
        case revStat = "7022"
        /// Global Individual Asset Identifier of an assembly: AI (7023)
        /// N4+X..30 (FNC1)
        case giaiAssembly = "7023"
        /// Number of processor with three-digit ISO country code: AI (703s)
        /// N4+N3+X..27 (FNC1)
        /// - warning: last (fourth) digit contains sequence number - allows for multiple occurences of the AI
        case processor = "703"
        /// GS1 UIC with Extension 1 and Importer index: AI (7040)
        /// N4+N1+X3 (FNC1)
        case uicExt = "7040"
        /// National Healthcare Reimbursement Number (NHRN) – Germany PZN: AI (710)
        /// N3+X..20 (FNC1)
        case nhrnPZN = "710"
        /// National Healthcare Reimbursement Number (NHRN) – France CIP: AI (711)
        /// N3+X..20 (FNC1)
        case nhrnCIP = "711"
        /// National Healthcare Reimbursement Number (NHRN) – Spain CN: AI (712)
        /// N3+X..20 (FNC1)
        case nhrnCN = "712"
        /// National Healthcare Reimbursement Number (NHRN) – Brasil DRN: AI (713)
        /// N3+X..20 (FNC1)
        case nhrnDRN = "713"
        /// National Healthcare Reimbursement Number (NHRN) – Portugal AIM: AI (714)
        /// N3+X..20 (FNC1)
        case nhrnAIM = "714"
        /// National Healthcare Reimbursement Number (NHRN) – United States of America NDC: AI (715)
        /// N3+X..20 (FNC1)
        case nhrnNDC = "715"
        /// Certification reference: AI (723s)
        /// N4+X2+X..28 (FNC1)
        /// - warning: last (fourth) digit contains sequence number - allows for multiple occurences of the AI
        case cert = "723"
        /// Protocol ID: AI (7240)
        /// N4+X..20 (FNC1)
        case protocolID = "7240"
        /// Roll products - width, length, core diameter, direction, splices: AI (8001)
        /// N4+N14 (FNC1)
        case dimensions = "8001"
        /// Cellular mobile telephone identifier: AI (8002)
        /// N4+X..20 (FNC1)
        case cmtNo = "8002"
        /// Global Returnable Asset Identifier (GRAI): AI (8003)
        /// N4+N14+X..16 (FNC1)
        case grai = "8003"
        /// Global Individual Asset Identifier (GIAI): AI (8004)
        /// N4+X..30 (FNC1)
        case giai = "8004"
        /// Price per unit of measure: AI (8005)
        /// N4+N6 (FNC1)
        case pricePerUnit = "8005"
        /// Identification of an individual trade item (ITIP) piece: AI (8006)
        /// N4+N14+N2+N2 (FNC1)
        case itip = "8006"
        /// International Bank Account Number (IBAN): AI (8007)
        /// N4+X..34 (FNC1)
        case iban = "8007"
        /// Date and time of production: AI (8008)
        /// N4+N8+N..4 (FNC1)
        case prodDateTime = "8008"
        /// Optically readable sensor indicator: AI (8009)
        /// N4+X..50 (FNC1)
        case optsen = "8009"
        /// Component/Part Identifier (CPID): AI (8010)
        /// N4+X..30 (FNC1)
        case cpid = "8010"
        /// Component/Part Identifier serial number: AI (8011)
        /// N4+N..12 (FNC1)
        case cpidSerial = "8011"
        /// Software version: AI (8012)
        /// N4+X..20 (FNC1)
        case version = "8012"
        /// Global Model Number (GMN): AI (8013)
        /// N4+X..25 (FNC1)
        case gmn = "8013"
        /// Global Service Relation Number (GSRN) to identify the relationship between
        /// an organisation offering services and the provider of services: AI (8017)
        /// N4+N18 (FNC1)
        case gsrnProvider = "8017"
        /// Global Service Relation Number (GSRN) to identify the relationship between
        /// an organisation offering services and the recipient of services: AI (8018)
        /// N4+N18 (FNC1)
        case gsrnRecipient = "8018"
        /// Service Relation Instance Number (SRIN): AI (8019)
        /// N4+N..10 (FNC1)
        case srin = "8019"
        /// Payment slip reference number: AI (8020)
        /// N4+X..25 (FNC1)
        case refNo = "8020"
        /// Identification of pieces of a trade item (ITIP) contained in a logistic unit: AI (8026)
        /// N4+N14+N2+N2 (FNC1)
        case itipContent = "8026"
        /// Coupon code identification for use in North America: AI (8110)
        /// N4+X..70 (FNC1)
        case couponCodeNA = "8110"
        /// Loyalty points of a coupon: AI (8111)
        /// N4+N4 (FNC1)
        case points = "8111"
        /// Positive offer file coupon code identification for use in North America: (AI 8112)
        /// N4+X..70 (FNC1)
        case positiveOffer = "8112"
        /// Extended packaging URL: AI (8200)
        /// N4+X..70 (FNC1)
        case productURL = "8200"
        /// Information mutually agreed between trading partners: AI (90)
        /// N2+X..30 (FNC1)
        case internalPartner = "90"
        /// Company internal information: AIs (91 - 99)
        /// N2+X..90 (FNC1)
        case internalCompany1 = "91"
        /// Company internal information: AIs (91 - 99)
        /// N2+X..90 (FNC1)
        case internalCompany2 = "92"
        /// Company internal information: AIs (91 - 99)
        /// N2+X..90 (FNC1)
        case internalCompany3 = "93"
        /// Company internal information: AIs (91 - 99)
        /// N2+X..90 (FNC1)
        case internalCompany4 = "94"
        /// Company internal information: AIs (91 - 99)
        /// N2+X..90 (FNC1)
        case internalCompany5 = "95"
        /// Company internal information: AIs (91 - 99)
        /// N2+X..90 (FNC1)
        case internalCompany6 = "96"
        /// Company internal information: AIs (91 - 99)
        /// N2+X..90 (FNC1)
        case internalCompany7 = "97"
        /// Company internal information: AIs (91 - 99)
        /// N2+X..90 (FNC1)
        case internalCompany8 = "98"
        /// Company internal information: AIs (91 - 99)
        /// N2+X..90 (FNC1)
        case internalCompany9 = "99"
    }

}
