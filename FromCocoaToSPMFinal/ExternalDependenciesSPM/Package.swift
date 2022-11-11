// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExteralDependencies",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "Dependencies", targets: ["Dependencies"])
    ],
    dependencies: [
        .package(url: "https://github.com/braze-inc/braze-ios-sdk.git", exact: "4.5.1"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.6.1"),
        .package(url: "https://github.com/amplitude/Amplitude-iOS.git", exact: "8.14.0")
    ],
    targets: [
        // Dependencies
        .target(name: "Dependencies",
                dependencies: [
                    .product(name: "Amplitude", package: "Amplitude-iOS"),
                    .product(name: "Alamofire", package: "Alamofire"),
                    .product(name: "AppboyKit", package: "braze-ios-sdk")
                ])
    ]
)

