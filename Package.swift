// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "EcommpaySDK",
    defaultLocalization: "en",
    platforms: [
        .iOS("15.6")
    ],
    products: [
        .library(
            name: "EcommpaySDK",
            targets: ["EcommpaySDK"]
        )
    ],
    targets: [
        .target(
            name: "EcommpaySDK",
            dependencies: ["mobileSDK_UI", "MsdkCore"],
            path: "mobileSDK.Facade/mobileSDK.Facade",
            resources: [
                .process("Resources")
            ]
        ),
        .target(
            name: "mobileSDK_UI",
            dependencies: ["MsdkCore"],
            path: "mobileSDK.UI/mobileSDK.UI",
            resources: [
                .process("../../mobileSDK.Facade/mobileSDK.Facade/Resources")
            ]
        ),
        .binaryTarget(
            name: "MsdkCore",
            path: "MSDKCore/MsdkCore.xcframework"
        )
    ]
)