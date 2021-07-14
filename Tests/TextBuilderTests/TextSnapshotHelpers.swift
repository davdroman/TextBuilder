import SwiftUI
import SnapshotTesting

//let isRecording = true

func assertTextSnapshot(_ text: Text, file: StaticString = #file, testName: String = #function, line: UInt = #line) {
    let view = text
        .environment(\.colorScheme, .light)
        .environment(\.sizeCategory, .large)
        .fixedSize()
        .background(Color.white)

    #if os(macOS)
    // TODO: `image` snapshot tests on macOS
    // https://github.com/pointfreeco/swift-snapshot-testing/pull/477
    let nsView = NSHostingView(rootView: view)
    assertSnapshot(
        matching: nsView,
        as: .dump,
        named: "macOS",
        record: isRecording,
        file: file,
        testName: testName,
        line: line
    )
    #elseif os(iOS)
    assertSnapshot(
        matching: view,
        as: .image,
        named: "iOS",
        record: isRecording,
        file: file,
        testName: testName,
        line: line
    )
    #endif
}
