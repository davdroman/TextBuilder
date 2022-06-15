import SwiftUI

/// A custom attribute that constructs combined text views.
///
/// You can use ``TextBuilder`` as an attribute for text-producing properties
/// or function parameters, allowing them to provide combined text views. For example,
/// the following `loremIpsum` property will create a single styled text view with each
/// text separated using eggplant emoji.
///
///     struct EggplantSeparator: TextBuilderSeparator {
///         static var separator: String { " 🍆 " }
///     }
///
///     @TextBuilder<EggplantSeparator>
///     var loremIpsum: Text {
///         Text("Lorem").underline().foregroundColor(.blue)
///         Text("ipsum dolor")
///         Text("sit").bold()
///         Text("amet, consectetur")
///     }
///
#if compiler(>=5.7)
@resultBuilder
public struct TextBuilder<Separator: TextBuilderSeparator> {
    public static func buildPartialBlock(first: Text) -> Text {
        first
    }

    public static func buildPartialBlock(accumulated: Text, next: Text) -> Text {
        if next.isNone {
            return accumulated
        } else if Separator.separator.isEmpty {
            return accumulated + next
        } else {
            return accumulated + Text(Separator.separator) + next
        }
    }

    public static func buildArray(_ components: [Text]) -> Text {
        components.joined(separator: Text(Separator.separator))
    }

    public static func buildEither(first component: Text) -> Text {
        component
    }

    public static func buildEither(second component: Text) -> Text {
        component
    }

    public static func buildExpression(_ string: some StringProtocol) -> Text {
        Text(string)
    }

    public static func buildExpression(_ component: Text) -> Text {
        component
    }

    public static func buildLimitedAvailability(_ component: Text) -> Text {
        component
    }

    public static func buildOptional(_ component: Text?) -> Text {
        component ?? Text.none
    }
}
#else
@resultBuilder
public struct TextBuilder<Separator: TextBuilderSeparator> {
    public static func buildArray(_ texts: [[Text]]) -> [Text] {
        texts.flatMap { $0 }
    }

    public static func buildBlock(_ texts: [Text]...) -> [Text] {
        texts.flatMap { $0 }
    }

    public static func buildEither(first texts: [Text]) -> [Text] {
        texts
    }

    public static func buildEither(second texts: [Text]) -> [Text] {
        texts
    }

    public static func buildExpression<S: StringProtocol>(_ string: S) -> [Text] {
        [Text(string)]
    }

    public static func buildExpression(_ text: Text) -> [Text] {
        [text]
    }

    public static func buildLimitedAvailability(_ texts: [Text]) -> [Text] {
        texts
    }

    public static func buildOptional(_ texts: [Text]?) -> [Text] {
        texts ?? []
    }

    public static func buildFinalResult(_ texts: [Text]) -> Text {
        texts.joined(separator: Text(Separator.separator))
    }
}
#endif
