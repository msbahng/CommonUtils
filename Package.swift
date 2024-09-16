// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]),
        .target(
            name: "SwiftUiUtils",
            dependencies: ["CommonUtils"],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]),
        .target(
            name: "CodeScanner",
            dependencies: [],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]),
        .target(
            name: "Logger",
            dependencies: [],
            swiftSettings: [
                .define("DEBUG_AVAILABLE", .when(configuration: .debug)),
                .enableExperimentalFeature("StrictConcurrency")
            ]),
        .testTarget(
            name: "CommonUtilsTests",
            dependencies: ["CommonUtils"],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]),
    ]
)
