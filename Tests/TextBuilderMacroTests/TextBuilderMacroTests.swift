#if canImport(TextBuilderMacro)
import MacroTesting
import Testing
@testable import TextBuilderMacro

@Suite(
	.macros(
		[TextBuilderMacro.self],
		indentationWidth: .tab,
		record: .missing
	)
)
struct TextBuilderMacroTests {
	@Test(
		.disabled(
			"""
			Body Macros aren't compatible with computed properties yet.

			See: https://github.com/swiftlang/swift/issues/75715
			"""
		)
	)
	func computedVarWithoutImplementation() throws {
		assertMacro {
			"""
			@TextBuilder
			var text: Text
			"""
		} expansion: {
			"""
			var text: Text {
				Text(separator: nil) {
				}
			}
			"""
		}
	}

	@Test(
		.disabled(
			"""
			Body Macros aren't compatible with computed properties yet.

			See: https://github.com/swiftlang/swift/issues/75715
			"""
		)
	)
	func computedVarWithoutSeparator() throws {
		assertMacro {
			"""
			@TextBuilder
			var text: Text {
				"Lorem".text.underline().foregroundColor(.blue)
				if false {
					"ipsum dolor"
				}
				if false {
					"sit"
				} else {
					"sit".text.bold()
				}
				if let string = "amet, consectetur" as String? {
					string
				}
				for i in 1...3 {
					String(i)
				}
			}
			"""
		} expansion: {
			"""
			var text: Text {
				Text(separator: nil) {
					"Lorem".text.underline().foregroundColor(.blue)
					if false {
						"ipsum dolor"
					}
					if false {
						"sit"
					} else {
						"sit".text.bold()
					}
					if let string = "amet, consectetur" as String? {
						string
					}
					for i in 1 ... 3 {
						String(i)
					}
				}
			}
			"""
		}
	}

	@Test(
		.disabled(
			"""
			Body Macros aren't compatible with computed properties yet.

			See: https://github.com/swiftlang/swift/issues/75715
			"""
		)
	)
	func computedVarWithLiteralSeparator() throws {
		assertMacro {
			"""
			@TextBuilder(separator: " ")
			var text: Text {
				"Lorem".text.underline().foregroundColor(.blue)
				if false {
					"ipsum dolor"
				}
				if false {
					"sit"
				} else {
					"sit".text.bold()
				}
				if let string = "amet, consectetur" as String? {
					string
				}
				for i in 1...3 {
					String(i)
				}
			}
			"""
		} expansion: {
			"""
			var text: Text {
				Text(separator: " ") {
					"Lorem".text.underline().foregroundColor(.blue)
					if false {
						"ipsum dolor"
					}
					if false {
						"sit"
					} else {
						"sit".text.bold()
					}
					if let string = "amet, consectetur" as String? {
						string
					}
					for i in 1 ... 3 {
						String(i)
					}
				}
			}
			"""
		}
	}

	@Test(
		.disabled(
			"""
			Body Macros aren't compatible with computed properties yet.

			See: https://github.com/swiftlang/swift/issues/75715
			"""
		)
	)
	func computedVarWithNonLiteralSeparator() throws {
		assertMacro {
			"""
			let separator = " "
			@TextBuilder(separator: separator)
			var text: Text {
				"Lorem".text.underline().foregroundColor(.blue)
				if false {
					"ipsum dolor"
				}
				if false {
					"sit"
				} else {
					"sit".text.bold()
				}
				if let string = "amet, consectetur" as String? {
					string
				}
				for i in 1...3 {
					String(i)
				}
			}
			"""
		} expansion: {
			"""
			let separator = " "
			var text: Text {
				Text(separator: separator) {
					"Lorem".text.underline().foregroundColor(.blue)
					if false {
						"ipsum dolor"
					}
					if false {
						"sit"
					} else {
						"sit".text.bold()
					}
					if let string = "amet, consectetur" as String? {
						string
					}
					for i in 1 ... 3 {
						String(i)
					}
				}
			}
			"""
		}
	}

	@Test func functionWithoutImplementation() throws {
		assertMacro {
			"""
			@TextBuilder
			func text() -> Text
			"""
		} expansion: {
			"""
			func text() -> Text {
				Text(separator: nil) {
				}
			}
			"""
		}
	}

	@Test func functionWithoutSeparator() throws {
		assertMacro {
			"""
			@TextBuilder
			func text() -> Text {
				"Lorem".text.underline().foregroundColor(.blue)
				if false {
					"ipsum dolor"
				}
				if false {
					"sit"
				} else {
					"sit".text.bold()
				}
				if let string = "amet, consectetur" as String? {
					string
				}
				for i in 1...3 {
					String(i)
				}
			}
			"""
		} expansion: {
			"""
			func text() -> Text {
				Text(separator: nil) {
					"Lorem".text.underline().foregroundColor(.blue)
					if false {
						"ipsum dolor"
					}
					if false {
						"sit"
					} else {
						"sit".text.bold()
					}
					if let string = "amet, consectetur" as String? {
						string
					}
					for i in 1 ... 3 {
						String(i)
					}
				}
			}
			"""
		}
	}

	@Test func functionWithLiteralSeparator() throws {
		assertMacro {
			"""
			@TextBuilder(separator: " ")
			func text() -> Text {
				"Lorem".text.underline().foregroundColor(.blue)
				if false {
					"ipsum dolor"
				}
				if false {
					"sit"
				} else {
					"sit".text.bold()
				}
				if let string = "amet, consectetur" as String? {
					string
				}
				for i in 1...3 {
					String(i)
				}
			}
			"""
		} expansion: {
			"""
			func text() -> Text {
				Text(separator: " ") {
					"Lorem".text.underline().foregroundColor(.blue)
					if false {
						"ipsum dolor"
					}
					if false {
						"sit"
					} else {
						"sit".text.bold()
					}
					if let string = "amet, consectetur" as String? {
						string
					}
					for i in 1 ... 3 {
						String(i)
					}
				}
			}
			"""
		}
	}

	@Test func functionWithNonLiteralSeparator() throws {
		assertMacro {
			"""
			let separator = " "
			@TextBuilder(separator: separator)
			func text() -> Text {
				"Lorem".text.underline().foregroundColor(.blue)
				if false {
					"ipsum dolor"
				}
				if false {
					"sit"
				} else {
					"sit".text.bold()
				}
				if let string = "amet, consectetur" as String? {
					string
				}
				for i in 1...3 {
					String(i)
				}
			}
			"""
		} expansion: {
			"""
			let separator = " "
			func text() -> Text {
				Text(separator: separator) {
					"Lorem".text.underline().foregroundColor(.blue)
					if false {
						"ipsum dolor"
					}
					if false {
						"sit"
					} else {
						"sit".text.bold()
					}
					if let string = "amet, consectetur" as String? {
						string
					}
					for i in 1 ... 3 {
						String(i)
					}
				}
			}
			"""
		}
	}
}
#endif
