import CustomDump
import SwiftUI
import Testing
import TextBuilder

@Suite
struct TextBuilderTests {
	@Test func defaultTextBuilder() {
		@TextBuilder
		func sut() -> Text {
			Text("Lorem").underline().foregroundColor(.blue)
			Text("ipsum dolor")
			Text("sit").bold()
			Text("amet, consectetur")
		}

		expectNoDifference(
			sut(),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text("ipsum dolor") +
			Text("sit").bold() +
			Text("amet, consectetur")
		)
	}

	@Test func spacedTextBuilder() {
		@TextBuilder(separator: " ")
		func sut() -> Text {
			Text("Lorem").underline().foregroundColor(.blue)
			Text("ipsum dolor")
			Text("sit").bold()
			Text("amet, consectetur")
		}

		expectNoDifference(
			sut(),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text(verbatim: " ") +
			Text("ipsum dolor") +
			Text(verbatim: " ") +
			Text("sit").bold() +
			Text(verbatim: " ") +
			Text("amet, consectetur")
		)
	}

	@Test func multilineTextBuilder() {
		@TextBuilder(separator: "\n")
		func sut() -> Text {
			Text("Lorem").underline().foregroundColor(.blue)
			Text("ipsum dolor")
			Text("sit").bold()
			Text("amet, consectetur")
		}

		expectNoDifference(
			sut(),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text(verbatim: "\n") +
			Text("ipsum dolor") +
			Text(verbatim: "\n") +
			Text("sit").bold() +
			Text(verbatim: "\n") +
			Text("amet, consectetur")
		)
	}

	@Test func customTextBuilder() {
		@TextBuilder(separator: " 👏 ")
		func sut() -> Text {
			Text("Lorem").underline().foregroundColor(.blue)
			Text("ipsum dolor")
			Text("sit").bold()
			Text("amet, consectetur")
		}

		expectNoDifference(
			sut(),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text(verbatim: " 👏 ") +
			Text("ipsum dolor") +
			Text(verbatim: " 👏 ") +
			Text("sit").bold() +
			Text(verbatim: " 👏 ") +
			Text("amet, consectetur")
		)
	}

	@Test func complexTextBuilder() {
		@TextBuilder(separator: " ")
		func sut() -> Text {
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

		expectNoDifference(
			sut(),
			Text(verbatim: "Lorem").underline().foregroundColor(.blue) +
			Text(verbatim: " ") +
			Text(verbatim: "sit").bold() +
			Text(verbatim: " ") +
			Text(verbatim: "amet, consectetur") +
			Text(verbatim: " ") +
			Text(verbatim: "1") +
			Text(verbatim: " ") +
			Text(verbatim: "2") +
			Text(verbatim: " ") +
			Text(verbatim: "3")
		)
	}
}
