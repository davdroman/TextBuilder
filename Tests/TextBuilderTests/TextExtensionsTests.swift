import XCTest
import SwiftUI
import TextBuilder
import SnapshotTesting

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
            Text(content: basicTextBuilderText)
        )
        assertTextSnapshot(
            Text(separator: Text(""), content: basicTextBuilderText)
        )
        assertTextSnapshot(
            Text(separator: "", content: basicTextBuilderText)
        )
    }

    func testInit_spaceSeparator() {
        assertTextSnapshot(
            Text(separator: Text(" "), content: basicTextBuilderText)
        )
        assertTextSnapshot(
            Text(separator: " ", content: basicTextBuilderText)
        )
    }

    func testInit_newlineSeparator() {
        assertTextSnapshot(
            Text(separator: Text("\n"), content: basicTextBuilderText)
        )
        assertTextSnapshot(
            Text(separator: "\n", content: basicTextBuilderText)
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

    @BasicTextBuilder
    func basicTextBuilderText() -> [Text] {
        Text("Lorem").underline().foregroundColor(.blue)
        Text("ipsum dolor")
        Text("sit").bold()
        Text("amet, consectetur")
    }
}
