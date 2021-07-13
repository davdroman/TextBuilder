import SwiftUI
import SnapshotTesting

//let isRecording = true

func assertTextSnapshot(_ text: Text, file: StaticString = #file, testName: String = #function, line: UInt = #line) {
    let view = text
        .environment(\.colorScheme, .light)
        .environment(\.sizeCategory, .large)
        .fixedSize()
        .background(Color.white)

    #if os(macOS) && arch(arm64)
    let nsView = NSHostingView(rootView: view)
    assertSnapshot(
        matching: nsView,
        as: .image(size: nsView.fittingSize),
        named: "macOS-arm64",
        record: isRecording,
        file: file,
        testName: testName,
        line: line
    )
    #elseif os(macOS) && arch(x86_64)
    let nsView = NSHostingView(rootView: view)
    assertSnapshot(
        matching: nsView,
        as: .image(size: nsView.fittingSize),
        named: "macOS-x86_64",
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
