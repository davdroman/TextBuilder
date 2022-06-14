import CustomDump
import SwiftUI
import TextBuilder
import XCTest

final class TextExtensionsTests: XCTestCase {
    func testJoined_noSeparator() {
        XCTAssertNoDifference(
            textArray.joined(),
            Text("Lorem").underline().foregroundColor(.blue) +
            Text("ipsum dolor") +
            Text("sit").bold() +
            Text("amet, consectetur")
        )
    }

    func testJoined_spaceSeparator() {
        XCTAssertNoDifference(
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

    func testJoined_formattedSeparator() {
        XCTAssertNoDifference(
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

    func testInit_noSeparator() {
        XCTAssertNoDifference(
            Text(content: textArrayBuilderText),
            Text("Lorem").underline().foregroundColor(.blue) +
            Text("ipsum dolor") +
            Text("sit").bold() +
            Text("amet, consectetur")
        )
        XCTAssertNoDifference(
            Text(separator: Text(""), content: textArrayBuilderText),
            Text("Lorem").underline().foregroundColor(.blue) +
            Text("ipsum dolor") +
            Text("sit").bold() +
            Text("amet, consectetur")
        )
        XCTAssertNoDifference(
            Text(separator: "", content: textArrayBuilderText),
            Text("Lorem").underline().foregroundColor(.blue) +
            Text("ipsum dolor") +
            Text("sit").bold() +
            Text("amet, consectetur")
        )
    }

    func testInit_spaceSeparator() {
        XCTAssertNoDifference(
            Text(separator: Text(" "), content: textArrayBuilderText),
            Text("Lorem").underline().foregroundColor(.blue) +
            Text(" ") +
            Text("ipsum dolor") +
            Text(" ") +
            Text("sit").bold() +
            Text(" ") +
            Text("amet, consectetur")
        )
        XCTAssertNoDifference(
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

    func testInit_newlineSeparator() {
        XCTAssertNoDifference(
            Text(separator: Text("\n"), content: textArrayBuilderText),
            Text("Lorem").underline().foregroundColor(.blue) +
            Text("\n") +
            Text("ipsum dolor") +
            Text("\n") +
            Text("sit").bold() +
            Text("\n") +
            Text("amet, consectetur")
        )
        XCTAssertNoDifference(
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

    @TextArrayBuilder
    func textArrayBuilderText() -> [Text] {
        Text("Lorem").underline().foregroundColor(.blue)
        Text("ipsum dolor")
        Text("sit").bold()
        Text("amet, consectetur")
    }
}
