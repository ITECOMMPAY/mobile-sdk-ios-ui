// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "EtoedtoSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS("15.6")
    ],
    products: [
        .library(
            name: "EtoedtoSDK",
            targets: ["EtoedtoSDK"]
        )
    ],
    targets: [
        .target(
            name: "EtoedtoSDK",
            dependencies: ["mobileSDK_UI", "MsdkCore"],
            path: "mobileSDK.Facade/mobileSDK.Facade",
            exclude: ["Resources/Overrides.strings", "Resources/de.lproj", "Resources/en.lproj", "Resources/es.lproj", "Resources/fr.lproj", "Resources/hu.lproj", "Resources/it.lproj"],
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "mobileSDK_UI",
            dependencies: ["MsdkCore"],
            path: "mobileSDK.UI/mobileSDK.UI"
        ),
        .binaryTarget(
            name: "MsdkCore",
            path: "MSDKCore/MsdkCore.xcframework"
        )
    ]
)
