// Playground generated with 🏟 Arena (https://github.com/finestructure/arena)
// ℹ️ If running the playground fails with an error "no such module ..."
//    go to Product -> Build to re-trigger building the SPM package.
// ℹ️ Please restart Xcode if autocomplete is not working.

import SwiftUI
import TextBuilder
import PlaygroundSupport

struct DemoView: View {
    @State var name: String?

    var body: some View {
        VStack(spacing: 20) {
            welcomeText.font(.title)
            descriptionText
            someClickableText
            footnote
        }
        .multilineTextAlignment(.center)
        .padding()
        .background(Color(.windowBackgroundColor))
    }

    @SpacedTextBuilder
    var welcomeText: Text {
        if let name = name, !name.isEmpty {
            "Welcome,"
            name.text.bold()
        } else {
            "Welcome"
        }
    }

    @BasicTextBuilder
    var descriptionText: Text {
        "This is a demo of "
        "TextBuilder".text.italic()
        "."
    }

    var someClickableText: Text {
        Text(separator: " ") {
            "This paragraph is implemented"
            "without".text.underline()
            "a builder to showcase the"
            "Text.init(separator:content:)".text.font(.system(.body, design: .monospaced)).foregroundColor(.gray)
            "initializer provided by this library."
        }
    }

    var footnote: some View {
        Text {
            "Made by "
            "@davdroman".text.bold()
        }
        .underline()
        .font(.system(.caption))
        .foregroundColor(.blue)
        .pointable()
        .onTapGesture { NSWorkspace.shared.open(URL(string: "https://github.com/davdroman/TextBuilder")!) }
    }
}

extension View {
    func pointable() -> some View {
        onHover { inside in
            if inside {
                NSCursor.pointingHand.push()
            } else {
                NSCursor.pop()
            }
        }
    }
}

let view = NSHostingController(rootView: DemoView(name: NSFullUserName()))
view.view.frame.size.width = 340
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = view