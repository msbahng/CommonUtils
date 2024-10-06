// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .enableExperimentalFeature("StrictConcurrency"),
    .define("DEBUG_AVAILABLE", .when(configuration: .debug))
]

let package = Package(
    name: "CommonUtils",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CommonUtils",
            targets: ["CommonUtils"]),
        .library(
            name: "SwiftUiUtils",
            targets: ["SwiftUiUtils"]),
        .library(
            name: "CodeScanner",
            targets: ["CodeScanner"]),
        .library(
            name: "Logger",
            targets: ["Logger"]),
    ],
    dependencies: [
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CommonUtils",
            dependencies: ["Logger"],
            swiftSettings: swiftSettings),
        .target(
            name: "SwiftUiUtils",
            dependencies: ["CommonUtils"],
            swiftSettings: swiftSettings),
        .target(
            name: "CodeScanner",
            dependencies: [],
            swiftSettings: swiftSettings),
        .target(
            name: "Logger",
            dependencies: [],
            swiftSettings: swiftSettings),
        .testTarget(
            name: "CommonUtilsTests",
            dependencies: ["CommonUtils"],
            swiftSettings: swiftSettings),
    ]
)
