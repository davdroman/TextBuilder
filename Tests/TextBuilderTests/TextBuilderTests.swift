import CustomDump
import SwiftUI
import Testing
import TextBuilder

@Suite
struct TextBuilderTests {
	@Test func basicTextBuilder() {
		expectNoDifference(
			basicTextBuilderText(),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text("ipsum dolor") +
			Text("sit").bold() +
			Text("amet, consectetur")
		)
	}

	@Test func spacedTextBuilder() {
		expectNoDifference(
			spacedTextBuilderText(),
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
		expectNoDifference(
			multilineTextBuilderText(),
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
		expectNoDifference(
			customTextBuilderText(),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text(verbatim: " 🍆 ") +
			Text("ipsum dolor") +
			Text(verbatim: " 🍆 ") +
			Text("sit").bold() +
			Text(verbatim: " 🍆 ") +
			Text("amet, consectetur")
		)
	}

	@Test func complexTextBuilder() {
		expectNoDifference(
			complexTextBuilderText(),
			Text(verbatim: "Lorem").underline().foregroundColor(.blue) +
			Text(verbatim: " ") +
			Text(verbatim: "sit").bold() +
			Text(verbatim: " ") +
			Text(verbatim: "amet, consectetur") +
			Text(verbatim: " ") +
			(
				Text(verbatim: "1") +
				Text(verbatim: " ") +
				Text(verbatim: "2") +
				Text(verbatim: " ") +
				Text(verbatim: "3")
			)
		)
	}
}

private extension TextBuilderTests {
	@TextBuilder
	func basicTextBuilderText() -> Text {
		Text("Lorem").underline().foregroundColor(.blue)
		Text("ipsum dolor")
		Text("sit").bold()
		Text("amet, consectetur")
	}

	@TextBuilderWithSpaces
	func spacedTextBuilderText() -> Text {
		Text("Lorem").underline().foregroundColor(.blue)
		Text("ipsum dolor")
		Text("sit").bold()
		Text("amet, consectetur")
	}

	@TextBuilderWithNewlines
	func multilineTextBuilderText() -> Text {
		Text("Lorem").underline().foregroundColor(.blue)
		Text("ipsum dolor")
		Text("sit").bold()
		Text("amet, consectetur")
	}

	struct EmojiSeparator: TextBuilderSeparator {
		static var separator: String? { " 🍆 " }
	}

	@TextBuilderWith<EmojiSeparator>
	func customTextBuilderText() -> Text {
		Text("Lorem").underline().foregroundColor(.blue)
		Text("ipsum dolor")
		Text("sit").bold()
		Text("amet, consectetur")
	}

	@TextBuilderWithSpaces
	func complexTextBuilderText() -> Text {
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
