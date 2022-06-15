// swift-tools-version:5.4
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
            .product(name: "CustomDump", package: "swift-custom-dump"),
            .target(name: "TextBuilder"),
        ]),

        .executableTarget(name: "Benchmarks", dependencies: [
            .product(name: "Benchmark", package: "Benchmark"),
            .target(name: "TextBuilder"),
        ]),
    ]
)

package.dependencies = [
    .package(name: "Benchmark", url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
    .package(name: "swift-builders", url: "https://github.com/davdroman/swift-builders", from: "0.1.0"),
    .package(name: "swift-custom-dump", url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.5.0"),
]
