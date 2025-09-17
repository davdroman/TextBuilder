public import SwiftUI

/// A body macro that lets you build a single `SwiftUI.Text` from multiple parts using a builder-style closure. Write
/// `Text` fragments and string-like values across multiple lines, and they will be concatenated into one `Text`,
/// optionally inserting a separator between items.
///
/// ## Behavior
/// - Empty bodies produce `Text(verbatim: "")`.
/// - You can mix `Text` values and string-like values (e.g., string literals, `String`, results of `String(i)`, etc.).
///   These string values are treated as verbatim text.
/// - Control flow is supported: `if`/`else`, `if let`, and `for` loops can conditionally emit or repeat parts.
/// - Modifiers applied to individual segments (e.g., `.bold()`, `.underline()`, `.foregroundColor(_:)`) are preserved
///   for those segments.
/// - When a separator is provided, it is inserted between emitted segments, not before the first or after the last one.
///
/// ## Example
/// ```swift
/// @TextBuilder(separator: " ")
/// func message() -> Text {
///     Text("Hello").bold()
///     "world, the year is"
///     String(2025)
/// }
/// ```
///
/// ## Notes
/// - The expansion relies on the ``Text.init(separator:default:content:)-(Text?,_,_)`` builder-style API that is
///   included as part of this package, which performs concatenation and separator insertion.
/// - Apply `@TextBuilder` to functions that return `Text`.
/// - Applying `@TextBuilder` to computed properties that return `Text` is currently unsupported due to limitations in
///   Swift. See https://github.com/swiftlang/swift/issues/75715 for details.
@attached(body)
public macro TextBuilder(separator: Text? = nil) = #externalMacro(
	module: "TextBuilderMacro",
	type: "TextBuilderMacro"
)

/// Convenience overload that accepts any `StringProtocol` as the separator, which is treated as verbatim text
/// (equivalent to `Text(verbatim: separator)`).
@attached(body)
public macro TextBuilder<Separator: StringProtocol>(separator: Separator) = #externalMacro(
	module: "TextBuilderMacro",
	type: "TextBuilderMacro"
)

