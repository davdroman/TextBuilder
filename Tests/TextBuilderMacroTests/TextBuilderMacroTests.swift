import MacroTesting
import Testing
import TextBuilderMacro

@Suite(
	.macros(
		["TextBuilder": TextBuilderMacro.self],
		indentationWidth: .tab,
		record: .missing
	)
)
struct TextBuilderMacroTests {
	@Test func computedVarWithoutSeparator() throws {
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
				Text(separator: "") {
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
			}
			"""
		}
	}

	@Test func computedVarWithLiteralSeparator() throws {
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
					for i in 1...3 {
						String(i)
					}
				}
			}
			"""
		}
	}

	@Test func computedVarWithNonLiteralSeparator() throws {
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
					for i in 1...3 {
						String(i)
					}
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
				Text(separator: "") {
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
					for i in 1...3 {
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
					for i in 1...3 {
						String(i)
					}
				}
			}
			"""
		}
	}
}
