// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TextBuilder",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "TextBuilder", targets: ["TextBuilder"]),
    ],
    dependencies: [
//        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.8.2"), // dev
//        .package(name: "Rocket", url: "https://github.com/shibapm/Rocket", from: "0.1.0"), // dev
    ],
    targets: [
        .target(name: "TextBuilder"),
//        .testTarget(name: "TextBuilderTests", dependencies: ["TextBuilder", "SnapshotTesting"], resources: [ .copy("__Snapshots__") ]), // dev
    ]
)
