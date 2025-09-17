// swift-tools-version:6.0

import CompilerPluginSupport
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
			"TextBuilderMacro",
		]),
		.testTarget(name: "TextBuilderTests", dependencies: [
			.product(name: "CustomDump", package: "swift-custom-dump"),
			.target(name: "TextBuilder"),
		]),

		.macro(name: "TextBuilderMacro", dependencies: [
			.product(name: "SwiftSyntax", package: "swift-syntax"),
			.product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
			.product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
		]),
		.testTarget(name: "TextBuilderMacroTests", dependencies: [
			"TextBuilderMacro",
			.product(name: "MacroTesting", package: "swift-macro-testing"),
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

	.package(url: "https://github.com/pointfreeco/swift-macro-testing", from: "0.6.0"),
	.package(url: "https://github.com/swiftlang/swift-syntax.git", "509.0.0"..<"603.0.0"),
]

for target in package.targets {
	target.swiftSettings = target.swiftSettings ?? []
	target.swiftSettings? += [
		.enableUpcomingFeature("ExistentialAny"),
		.enableUpcomingFeature("InternalImportsByDefault"),
	]
}
