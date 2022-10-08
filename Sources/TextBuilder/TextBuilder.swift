import SwiftUI

/// A custom attribute that constructs combined text views.
///
/// You can use ``TextBuilder`` as an attribute for text-producing properties
/// or function parameters, allowing them to provide combined text views. For example,
/// the following `loremIpsum` property will create a single styled text view with each
/// text separated using eggplant emoji.
///
///     struct EggplantSeparator: TextBuilderSeparator {
///         static var separator: String? { " 🍆 " }
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
public struct TextBuilderWith<Separator: TextBuilderSeparator> {
    @inlinable
    public static func buildPartialBlock(first: Text?) -> Text? {
        first
    }

    @inlinable
    public static func buildPartialBlock(accumulated: Text?, next: Text?) -> Text? {
        guard let next else {
            return accumulated
        }
        guard let accumulated else {
            return next
        }
        guard let separator = Separator.separator else {
            return accumulated + next
        }
        return accumulated + Text(separator) + next
    }

    public static func buildArray(_ components: [Text?]) -> Text? {
        components.lazy.compactMap { $0 }.joined(separator: Separator.separator.map(Text.init))
    }

    @inlinable
    public static func buildEither(first component: Text?) -> Text? {
        component
    }

    @inlinable
    public static func buildEither(second component: Text?) -> Text? {
        component
    }

    @inlinable
    public static func buildExpression(_ string: some StringProtocol) -> Text? {
        Text(string)
    }

    @inlinable
    public static func buildExpression(_ component: Text?) -> Text? {
        component
    }

    @inlinable
    public static func buildLimitedAvailability(_ component: Text?) -> Text? {
        component
    }

    @inlinable
    public static func buildOptional(_ component: Text??) -> Text? {
        component ?? nil
    }

    @inlinable
    public static func buildFinalResult(_ component: Text?) -> Text {
        component ?? .empty
    }
}
#else
@resultBuilder
public struct TextBuilderWith<Separator: TextBuilderSeparator> {
    @inlinable
    public static func buildArray(_ texts: [[Text]]) -> [Text] {
        texts.flatMap { $0 }
    }

    @inlinable
    public static func buildBlock(_ texts: [Text]...) -> [Text] {
        texts.flatMap { $0 }
    }

    @inlinable
    public static func buildEither(first texts: [Text]) -> [Text] {
        texts
    }

    @inlinable
    public static func buildEither(second texts: [Text]) -> [Text] {
        texts
    }

    @inlinable
    public static func buildExpression<S: StringProtocol>(_ string: S) -> [Text] {
        [Text(string)]
    }

    @inlinable
    public static func buildExpression(_ text: Text?) -> [Text] {
        if let text = text {
            return [text]
        } else {
            return []
        }
    }

    @inlinable
    public static func buildLimitedAvailability(_ texts: [Text]) -> [Text] {
        texts
    }

    @inlinable
    public static func buildOptional(_ texts: [Text]?) -> [Text] {
        texts ?? []
    }

    public static func buildFinalResult(_ texts: [Text]) -> Text {
        texts.joined(separator: Separator.separator.map(Text.init)) ?? .empty
    }
}
#endif
