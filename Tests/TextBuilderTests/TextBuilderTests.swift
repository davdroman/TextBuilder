import BuildersTestSupport
import CustomDump
import SwiftUI
import TextBuilder
import XCTest

final class TextBuilderTests: XCTestCase {
    func testBasicTextBuilder() {
        XCTAssertNoDifference(
            basicTextBuilderText(),
            Text("Lorem").underline().foregroundColor(.blue) +
            Text("ipsum dolor") +
            Text("sit").bold() +
            Text("amet, consectetur")
        )
    }

    func testSpacedTextBuilder() {
        XCTAssertNoDifference(
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

    func testMultilineTextBuilder() {
        XCTAssertNoDifference(
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

    func testCustomTextBuilder() {
        XCTAssertNoDifference(
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

    func testComplexTextBuilder() {
        XCTAssertNoDifference(
            complexTextBuilderText(),
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

private extension TextBuilderTests {
    @BasicTextBuilder
    func basicTextBuilderText() -> Text {
        Text("Lorem").underline().foregroundColor(.blue)
        Text("ipsum dolor")
        Text("sit").bold()
        Text("amet, consectetur")
    }

    @SpacedTextBuilder
    func spacedTextBuilderText() -> Text {
        Text("Lorem").underline().foregroundColor(.blue)
        Text("ipsum dolor")
        Text("sit").bold()
        Text("amet, consectetur")
    }

    @MultilineTextBuilder
    func multilineTextBuilderText() -> Text {
        Text("Lorem").underline().foregroundColor(.blue)
        Text("ipsum dolor")
        Text("sit").bold()
        Text("amet, consectetur")
    }

    struct EmojiSeparator: TextBuilderSeparator {
        static var separator: String { " 🍆 " }
    }

    @TextBuilder<EmojiSeparator>
    func customTextBuilderText() -> Text {
        Text("Lorem").underline().foregroundColor(.blue)
        Text("ipsum dolor")
        Text("sit").bold()
        Text("amet, consectetur")
    }

    @SpacedTextBuilder
    func complexTextBuilderText() -> Text {
        "Lorem".text.underline().foregroundColor(.blue)
        if `false` {
            "ipsum dolor"
        }
        if `false` {
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
