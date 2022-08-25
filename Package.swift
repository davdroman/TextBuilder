// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TextBuilder",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(name: "TextBuilder", targets: ["TextBuilder"]),
    ],
    targets: [
        .target(name: "TextBuilder", dependencies: [
            .product(name: "Builders", package: "swift-builders"),
        ]),
        .testTarget(name: "TextBuilderTests", dependencies: [
            .product(name: "BuildersTestSupport", package: "swift-builders"),
            .product(name: "CustomDump", package: "swift-custom-dump"),
            .target(name: "TextBuilder"),
        ]),

        .executableTarget(name: "Benchmarks", dependencies: [
            .product(name: "Benchmark", package: "swift-benchmark"),
            .product(name: "BuildersTestSupport", package: "swift-builders"),
            .target(name: "TextBuilder"),
        ]),
    ]
)

package.dependencies = [
    .package(url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
    .package(url: "https://github.com/davdroman/swift-builders", from: "0.2.0"),
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.5.0"),
]
