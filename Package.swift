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
        .target(name: "TextBuilder"),
        .testTarget(
            name: "TextBuilderTests",
            dependencies: [
                .target(name: "TextBuilder"),
                .product(name: "SnapshotTesting", package: "SnapshotTesting"),
            ],
            resources: [
                .copy("__Snapshots__"),
            ]
        ),
    ]
)

package.dependencies = [
    .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.8.2"),
]
