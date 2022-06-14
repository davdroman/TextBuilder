import SnapshotTesting
import SwiftUI

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
    #else
    #if os(iOS)
    let os = "iOS"
    #elseif os(tvOS)
    let os = "tvOS"
    #endif
    assertSnapshot(
        matching: view,
        as: .image,
        named: os,
        record: isRecording,
        file: file,
        testName: testName,
        line: line
    )
    #endif
}
