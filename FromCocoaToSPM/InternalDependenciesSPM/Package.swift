// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InteralDependencies",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "ProductsFeature", targets: ["ProductsFeature"]),
        .library(name: "SettingsFeature", targets: ["SettingsFeature"]),
        .library(name: "UIComponents", targets: ["UIComponents"])
    ],
    dependencies: [],
    targets: [
        // AppFeature
        .target(name: "AppFeature",
                dependencies: [
                    "ProductsFeature",
                    "SettingsFeature"
                ]),
        
        // ProductsFeature
        .target(name: "ProductsFeature",
                dependencies: ["UIComponents"]),
        
        // SettingsFeature
        .target(name: "SettingsFeature",
                dependencies: ["UIComponents"]),
        
        // UIComponents
        .target(name: "UIComponents"),
    ]
)
