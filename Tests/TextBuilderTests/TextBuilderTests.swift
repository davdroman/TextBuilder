import XCTest
import SwiftUI
import TextBuilder
import SnapshotTesting

final class TextBuilderTests: XCTestCase {
    func testBasicTextBuilder() {
        assertTextSnapshot(basicTextBuilderText())
    }

    func testSpacedTextBuilder() {
        assertTextSnapshot(spacedTextBuilderText())
    }

    func testMultilineTextBuilder() {
        assertTextSnapshot(multilineTextBuilderText())
    }

    func testCustomTextBuilder() {
        assertTextSnapshot(customTextBuilderText())
    }

    func testComplexTextBuilder() {
        assertTextSnapshot(complexTextBuilderText())
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

    // Used to avoid triggering compiler warnings due to
    // obviously inaccessible codepaths.
    var `false`: Bool { false }
}
