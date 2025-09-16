// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "TextBuilder",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_15),
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
            .product(name: "Benchmark", package: "swift-benchmark"),
            .target(name: "TextBuilder"),
        ]),
    ]
)

package.dependencies = [
    .package(url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
    .package(url: "https://github.com/davdroman/swift-builders", from: "0.10.0"),
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "1.0.0"),
]
