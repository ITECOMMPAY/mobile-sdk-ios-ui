[![Build Status](https://github.com/ITETOEDTO/mobile-sdk-ios-ui/actions/workflows/master_push_pr.yml/badge.svg)]()

# Etoedto SDK UI for iOS

SDK for iOS is a software development kit for fast integration of the Etoedto payment solutions right in your mobile app for iOS. With SDK for iOS, you can quickly build and offer your customers a fast checkout experience from in your iOS app. In this section you will find information about using SDK for iOS as well as Swift and Objective-C code samples.

## General information about SDK for iOS

### What can I do with SDK for iOS?

SDK UI for iOS allows you to perform purchases by using payment cards and alternative payment methods. You may perform one-step and two-step purchases and COF purchases using payment cards, as well as card verification.

### What's inside?

SDK for iOS contains the library which is used for developing applications and running them on Apple devices, and code samples in Swift and Objective-C.

### Payment workflow

After you integrate an SDK for iOS library into your iOS app, checkout payment is processed as follows:

1. Your client app creates an instance of payment object with all the necessary checkout details.
2. On the basis of the payment object parameters, the back end part of you app generates the signature for checkout request.
3. You call a special method of the payment object to have the client app initiate a checkout request and send it to the Etoedto payment platform.
4. The Etoedto payment platform processes the checkout request and performs the payment.
5. The payment platform sends the payment processing results to the client app.
6. The payment platform sends a callback with the payment processing results to the callback URL you specified.

## Adding library in your project

### Importing library in Swift

Listed below are the instructions on how to import a Etoedto library into your Swift project.

1. Copy the `etoedtoSDK.xcframework` file in the project folder of you iOS app.
2. Add the library into your project:
   1. Open the target of your project.
   2. Select General > Embedded Binaries.
   3. Click +.
   4. Click Add Other.
   5. Select the `etoedtoSDK.xcframework` file and click Add.
3. Add key NSCameraUsageDescription with value `permission is needed in order to scan card` to the Info.plist file.
4. If your iOS app does not use user location information, add the NSLocationWhenInUseUsageDescription key with the `fraud prevention` value in the Info.plist file.

   The Etoedto libraries code does not request user location, if the request is not initiated by the host app, but App Store requires that the NSLocationWhenInUseUsageDescription key value is not empty.

   If your iOS app requests user location information, you can skip this step.

5. If the iOS app does not have permission to save data on the mobile device, add Privacy - Photo Library Usage Description and Privacy - Photo Library Additions Usage Description keys with values to the Info.plist file. The values specified are shown to the customer in the permission request message.

### Importing library in Objective-C

Listed below are the instructions on how to import a Etoedto library into your Objective-C project.

1. Copy the `etoedtoSDK.xcframework` file in the project folder of you iOS app.
2. Add the library into your project:
   1. Open the target of your project.
   2. Select General > Embedded Binaries.
   3. Click +.
   4. Click Add Other.
   5. Select the `etoedtoSDK.xcframework` file and click Add.
   6. Select Build Settings.
   7. Set Always embed swift embedded libraries to Yes.
3. Add key NSCameraUsageDescription with value `permission is needed in order to scan card` to the Info.plist file.
4. If your iOS app does not use user location information, add the NSLocationWhenInUseUsageDescription key with the `fraud prevention` value in the Info.plist file.

   The Etoedto libraries code does not request user location, if the request is not initiated by the host app, but App Store requires that the NSLocationWhenInUseUsageDescription key value is not empty.

   If your iOS app requests user location information, you can skip this step.

5. If the iOS app does not have permission to save data on the mobile device, add Privacy - Photo Library Usage Description and Privacy - Photo Library Additions Usage Description keys with values to the Info.plist file. The values specified are shown to the customer in the permission request message.

### Importing library via Swift Package Manager

Listed below are the instructions on how to import a Etoedto library via Swift Package Manager.

#### Using Xcode

1. In Xcode, select File > Add Package Dependencies.
2. Enter the repository URL: `https://github.com/ITETOEDTO/mobile-sdk-ios-ui.git`
3. Select the version rule (recommend "Up to Next Major Version").
4. Click Add Package.
5. Select the EtoedtoSDK library and add it to your target.

#### Using Package.swift

Add the following to your Package.swift file:

```swift
dependencies: [
    .package(url: "https://github.com/ITETOEDTO/mobile-sdk-ios-ui.git", from: "3.10.0")
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "EtoedtoSDK", package: "mobile-sdk-ios-ui")
        ]
    )
]
```

#### Required Info.plist entries

1. Add key NSCameraUsageDescription with value `permission is needed in order to scan card` to the Info.plist file.
2. If your iOS app does not use user location information, add the NSLocationWhenInUseUsageDescription key with the `fraud prevention` value in the Info.plist file.

   The Etoedto libraries code does not request user location, if the request is not initiated by the host app, but App Store requires that the NSLocationWhenInUseUsageDescription key value is not empty.

   If your iOS app requests user location information, you can skip this step.

3. If the iOS app does not have permission to save data on the mobile device, add Privacy - Photo Library Usage Description and Privacy - Photo Library Additions Usage Description keys with values to the Info.plist file. The values specified are shown to the customer in the permission request message.

## Opening payment form

This section contains samples of payment form invocation code in Swift and Objective-C. To open payment form, do the following:

1. Import the library:

- Swift

  ```swift
  import etoedtoSDK
  ```

- Objective-C

  ```objc
  #import <EtoedtoSDK/EtoedtoSDK.h>
  ```

2. Declare the reference to instance of `Etoedto` class in you app (for example, inside the `viewDidLoad` method):

- Swift

  ```swift
  let etoedto = Etoedto()
  ```

- Objective-C

  ```objc
  Etoedto *etoedto = [[Etoedto alloc] init];
  ```

3. Create an object named `PaymentOptions` with all the required parameters and any number of optional parameters, for example:

- Swift

  ```swift
  let paymentOptions = PaymentOptions(
      projectID: 10,
      paymentID: "internal_payment_id_1",
      paymentAmount: 1999,
      paymentCurrency: "USD",
      paymentDescription: "T-shirt with dog print",
      customerID: "10",
      regionCode: "US"
  )
  ```

- Objective-C

  ```objc
  PaymentOptions *paymentOptions = [[PaymentOptions alloc]
      initWithProjectID:10
      paymentID:@"internal_payment_id_1"
      paymentAmount:1999
      paymentCurrency:@"USD"
      paymentDescription:@"T-shirt with dog print"
      customerID:@"10"
      regionCode:@"US"
  ];
  ```

Here are the required parameters:

- projectID — project (merchant) ID Etoedto assigned you
- paymentID — payment ID, must be unique within the project
- paymentAmount — payment amount in minor currency units
- paymentCurrency — payment currency code according to ISO-4217 alpha-3

Here are the optional parameters:

- recurrentInfo — object with the details of COF purchase
- paymentDescription — payment description (this parameter is available not only to the merchant, but also to the customer; if paymentDescription is specified in the request, it is visible to the customer in the payment form (in the dialog box containing information about the payment); if this parameter is not specified in the request, it is not visible to the customer)
- customerID — customer ID
- regionCode — customer country
- action — action type (Sale (by default), Auth, Tokenize, or Verify;
- token — card token
- forcePaymentMethod — the identifier of the payment method which is opened to the customer without an option for the customer to select another payment method. The list of codes is provided in the [IDs of payment methods supported on Payment Page](en_PP__Paramaters_ForcePaymentMethod.html) section
- hideSavedWallets — hiding or displaying saved payment instruments in the payment form. Possible values:
  - `true` — saved payment instruments are hidden, they are not displayed in the payment form
  - `false` — saved payment instruments are displayed in the payment form
- hideScanningCards — hiding or displaying button to start card scanning flow

4. Pack all the payment parameters into a string for signing:

   ```swift
   paymentOptions.getParamsForSignature
   ```

5. Send the string to your back end.
6. Have your back end generate the signature on the basis of the string and your secret key.
7. Add signature in your `PaymentOptions` object:

- Swift

  ```swift
  paymentOptions.setSignature(value: signature)
  ```

- Objective-C

  ```objc
  [paymentOptions setSignature:signature];
  ```

8. Open the payment form by using the following code:

- Swift

  ```swift
  etoedto.presentPayment(at: self, paymentOptions: paymentOptions) { (result) in
  print("Etoedto SDK finished with status \(result.status.rawValue)")
  ...
  }
  ```

- Objective-C

  ```objc
  [etoedto presentPaymentAt:self paymentOptions:paymentOptions
      completionHandler:^(PaymentResult *result) {
      NSLog(@"Etoedto SDK finished with status %ld", (long)result.status);
      ...
  }];
  ```

Before opening the payment form, the library check for any errors and opens the payment form only if no errors occur. Otherwise, the payment form is not opened and the presentPayment method returns the error code.

## Response processing

To receive and process response with the payment processing results you need to add the following code:

- Swift

```swift
etoedto.presentPayment(at: self, paymentOptions: paymentOptions) { (result) in
   print("Etoedto SDK finished with status \(result.status.rawValue)")
   if let error = result.error { // if error encountered
      print("ErrorCode: \(error.code) message: \(error.message)")
   }
}
```

- Objective-C

```objc
[self.etoedto presentPaymentAt:self paymentOptions:paymentOptions
    completionHandler:^(PaymentResult *result) {
        NSLog(@"Etoedto SDK finished with status %ld", (long)result.status);
        if(result.error != NULL) { // if error encountered
            NSLog(@"Error code: %@ %@", result.error.codeString, result.error.message);
        }
}];
```

The result code is returned in the PaymentResult.status parameter.

The following enumeration lists possible response codes returned in the PaymentResult.status parameter.

```swift
@objc public enum PaymentStatus: Int {
    case Success = 0 // Checkout successfully completed.
    case Decline = 100 // Operation was declined, for example because of insufficient funds.
    case Cancelled = 200 // Operation was cancelled by the customer.
    case Error = 500 // An internal error occurred. You may need to contact technical support.
}
```

Configuration Generator
-----------------------

The project includes a Python script `gen_config.py` that provides two main functionalities: configuration file generation and project-wide renaming operations.

### Generating Configuration Files

The configuration generator creates Swift configuration files for different API endpoints.

#### Using Configuration Files

1. **Create a sample configuration file:**
   ```bash
   python3 gen_config.py --create-sample-config
   ```
   
   This creates a `config.json` file with the following structure:
   ```json
   {
     "api_host": "https://sdk.api.example.com",
     "socket_host": "https://paymentpage.api.example.com",
   }
   ```
   
   Then edit `config.json` accordingly with specific config values.

2. **Generate configuration from file:**
   ```bash
   python3 gen_config.py --config config.json
   ```
   
   This generates Swift configuration files in the `mobileSDK.Facade/mobileSDK.Facade/Sources/Generated` directory:
   - `AppConfig.swift` - Main configuration with API endpoints
   - `ConfigIndex.swift` - Unified access point for all configurations

3. **Custom output directory:**
   ```bash
   python3 gen_config.py --config config.json --output-dir custom/path
   ```

### Project Renaming

The script can rename all occurrences of the original project name throughout the codebase, including file names, folder names, and content within files.

#### Using Rename Configuration

1. **Create a sample rename configuration:**
   ```bash
   python3 gen_config.py --create-sample-rename-config
   ```
   
   This creates a `rename_config.json` file with comprehensive renaming options:
   ```json
   {
     "merchant_name": "YourBrandName",
     "project_root": ".",
     "exclude_dirs": [".git", ".build", "node_modules", ".idea", ".vscode"],
     "exclude_files": [".DS_Store", ".gitignore", "rename_config.json"],
     "file_extensions": [".swift", ".h", ".m", ".json", ".plist", ".md"],
     "files_without_extension": ["Podfile", "Fastfile"],
	 "dry_run": true,
     "case_sensitive": false
   }
   ```

2. **Test changes with dry run** (modify `dry_run: true` in config):
   ```bash
   python3 gen_config.py --rename-config rename_config.json
   ```

2. **Run actual changes** (modify `dry_run: false` in config):
   ```bash
   python3 gen_config.py --rename-config rename_config.json
   ```

#### Rename Configuration Options

- **merchant_name**: The new name to replace "etoedto" throughout the project
- **project_root**: Root directory for the renaming operation (default: current directory)
- **exclude_dirs**: Directories to ignore during renaming
- **exclude_files**: Specific files to exclude from processing
- **file_extensions**: File types to process for content renaming
- **files_without_extension**: Specific files without extensions to process
- **dry_run**: Test mode without making actual changes
- **case_sensitive**: 
  - `false` (recommended): Preserves original case patterns and matches case-insensitively
  - `true`: Performs exact case matching only

#### What Gets Renamed

The script performs intelligent renaming across multiple case variants:
- **Original**: etoedto → YourBrand
- **PascalCase**: Etoedto → YourBrand  
- **camelCase**: etoedto → yourBrand
- **UPPERCASE**: ETOEDTO → YOURBRAND
- **lowercase**: etoedto → yourbrand
- **snake_case**: etoedto → your_brand
- **kebab-case**: etoedto → your-brand

Examples of transformations:
- `etoedtoSDK` → `YourBrandSDK`
- `EtoedtoManager` → `YourBrandManager`
- `ETOEDTO_API_KEY` → `YOURBRAND_API_KEY`
- `etoedtoSDK.framework` → `YourBrandSDK.framework`

The script processes:
1. **File and folder names** containing the original name
2. **Content within files** (code, documentation, configuration files)
3. **Various file types** including Swift, Objective-C, JSON, Plist, Markdown, and build files

#### Safety Features

- Excludes version control directories (`.git`) and build artifacts
- Preserves original case patterns when `case_sensitive: false`
- Provides detailed operation summary with statistics
- Handles binary files safely by skipping them
- Processes files in order to avoid path conflicts during renaming
