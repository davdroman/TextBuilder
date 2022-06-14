import SnapshotTesting
import SwiftUI
import TextBuilder
import XCTest

final class TextExtensionsTests: XCTestCase {
    func testJoined_noSeparator() {
        assertTextSnapshot(
            textArray.joined()
        )
    }

    func testJoined_spaceSeparator() {
        assertTextSnapshot(
            textArray.joined(separator: Text(" "))
        )
    }

    func testJoined_formattedSeparator() {
        assertTextSnapshot(
            textArray.joined(separator: Text(" ** ").italic().foregroundColor(.green))
        )
    }

    func testInit_noSeparator() {
        assertTextSnapshot(
            Text(content: textArrayBuilderText)
        )
        assertTextSnapshot(
            Text(separator: Text(""), content: textArrayBuilderText)
        )
        assertTextSnapshot(
            Text(separator: "", content: textArrayBuilderText)
        )
    }

    func testInit_spaceSeparator() {
        assertTextSnapshot(
            Text(separator: Text(" "), content: textArrayBuilderText)
        )
        assertTextSnapshot(
            Text(separator: " ", content: textArrayBuilderText)
        )
    }

    func testInit_newlineSeparator() {
        assertTextSnapshot(
            Text(separator: Text("\n"), content: textArrayBuilderText)
        )
        assertTextSnapshot(
            Text(separator: "\n", content: textArrayBuilderText)
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

    @TextArrayBuilder
    func textArrayBuilderText() -> [Text] {
        Text("Lorem").underline().foregroundColor(.blue)
        Text("ipsum dolor")
        Text("sit").bold()
        Text("amet, consectetur")
    }
}
