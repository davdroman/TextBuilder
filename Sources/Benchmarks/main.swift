import Benchmark
import BuildersTestSupport
import SwiftUI
import TextBuilder

benchmark("Result Builder") {
    @TextBuilderWithSpaces
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
    _ = complexTextBuilderText()
}

benchmark("Initializer") {
    _ = Text(separator: " ") {
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

Benchmark.main()
