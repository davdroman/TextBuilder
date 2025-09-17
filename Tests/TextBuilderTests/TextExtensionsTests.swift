import Builders
import CustomDump
import SwiftUI
import Testing
import TextBuilder

@Suite struct TextExtensionsTests {
	@Test func joined_noSeparator() {
		expectNoDifference(
			textArray.joined(),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text("ipsum dolor") +
			Text("sit").bold() +
			Text("amet, consectetur")
		)
	}

	@Test func joined_spaceSeparator() {
		expectNoDifference(
			textArray.joined(separator: Text(" ")),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text(" ") +
			Text("ipsum dolor") +
			Text(" ") +
			Text("sit").bold() +
			Text(" ") +
			Text("amet, consectetur")
		)
	}

	@Test func joined_formattedSeparator() {
		expectNoDifference(
			textArray.joined(separator: Text(" ** ").italic().foregroundColor(.green)),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text(" ** ").italic().foregroundColor(.green) +
			Text("ipsum dolor") +
			Text(" ** ").italic().foregroundColor(.green) +
			Text("sit").bold() +
			Text(" ** ").italic().foregroundColor(.green) +
			Text("amet, consectetur")
		)
	}

	@Test func init_noSeparator() {
		expectNoDifference(
			Text(content: textArrayBuilderText),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text("ipsum dolor") +
			Text("sit").bold() +
			Text("amet, consectetur")
		)
		expectNoDifference(
			Text(separator: nil, content: textArrayBuilderText),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text("ipsum dolor") +
			Text("sit").bold() +
			Text("amet, consectetur")
		)
	}

	@Test func init_blankSeparator() {
		expectNoDifference(
			Text(separator: Text(""), content: textArrayBuilderText),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text("") +
			Text("ipsum dolor") +
			Text("") +
			Text("sit").bold() +
			Text("") +
			Text("amet, consectetur")
		)
		expectNoDifference(
			Text(separator: "", content: textArrayBuilderText),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text(verbatim: "") +
			Text("ipsum dolor") +
			Text(verbatim: "") +
			Text("sit").bold() +
			Text(verbatim: "") +
			Text("amet, consectetur")
		)
	}

	@Test func init_spaceSeparator() {
		expectNoDifference(
			Text(separator: Text(" "), content: textArrayBuilderText),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text(" ") +
			Text("ipsum dolor") +
			Text(" ") +
			Text("sit").bold() +
			Text(" ") +
			Text("amet, consectetur")
		)
		expectNoDifference(
			Text(separator: " ", content: textArrayBuilderText),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text(verbatim: " ") +
			Text("ipsum dolor") +
			Text(verbatim: " ") +
			Text("sit").bold() +
			Text(verbatim: " ") +
			Text("amet, consectetur")
		)
	}

	@Test func init_newlineSeparator() {
		expectNoDifference(
			Text(separator: Text("\n"), content: textArrayBuilderText),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text("\n") +
			Text("ipsum dolor") +
			Text("\n") +
			Text("sit").bold() +
			Text("\n") +
			Text("amet, consectetur")
		)
		expectNoDifference(
			Text(separator: "\n", content: textArrayBuilderText),
			Text("Lorem").underline().foregroundColor(.blue) +
			Text(verbatim: "\n") +
			Text("ipsum dolor") +
			Text(verbatim: "\n") +
			Text("sit").bold() +
			Text(verbatim: "\n") +
			Text("amet, consectetur")
		)
	}
}

private extension TextExtensionsTests {
	var textArray: [Text] {
		[
			Text("Lorem").underline().foregroundColor(.blue),
			Text("ipsum dolor"),
			Text("sit").bold(),
			Text("amet, consectetur")
		]
	}

	@ArrayBuilder<Text>
	func textArrayBuilderText() -> [Text] {
		Text("Lorem").underline().foregroundColor(.blue)
		Text("ipsum dolor")
		Text("sit").bold()
		Text("amet, consectetur")
	}
}
