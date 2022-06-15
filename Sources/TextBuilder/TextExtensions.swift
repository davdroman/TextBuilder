import Builders
import SwiftUI

extension StringProtocol {
    public var text: Text { Text(self) }
}

extension Text {
    static var none: Text {
        Text(_EmptyTextMarker())
    }

    var isNone: Bool {
        self == .none
    }

    var isEmpty: Bool {
        self == Text(verbatim: "") || self == Text("")
    }
}

extension Sequence where Element == Text {
    /// Returns a new `Text` by concatenating the elements of the sequence,
    ///
    /// The following example shows how an array of `Text` views can be joined to a
    /// single `Text` view with comma-separated string:
    ///
    ///     let cast = [Text("Vivien"), Text("Marlon"), Text("Kim")]
    ///     let list = cast.joined(separator: Text(", "))
    ///     // Gives Text("Vivien, Marlon, Kim")
    ///
    /// - Parameter separator: A `Text` view to insert between each of the elements
    ///   in this sequence. By default there is no separator.
    /// - Returns: A single, concatenated `Text` view.
    public func joined(separator: Text = Text(verbatim: "")) -> Text {
        reduce(Text.none) { accumulated, next in
            if accumulated.isNone {
                return next
            } else if separator.isEmpty {
                return accumulated + next
            } else {
                return accumulated + separator + next
            }
        }
    }
}

public typealias TextArrayBuilder = ArrayBuilder<Text>

extension TextArrayBuilder {
    public static func buildExpression<S: StringProtocol>(_ expression: S) -> [Text] {
        [Text(expression)]
    }
}

extension Text {
    /// Creates a  combined text view based on the given `content` by inserting
    /// `separator` text views between each received text component.
    ///
    /// - Parameters:
    ///   - separator: The text to use as a separator between received text components.
    ///     By default there is no separator.
    ///   - content: A text array builder that creates text components.
    public init(separator: Text = Text(verbatim: ""), @TextArrayBuilder content: () -> [Text]) {
        self = content().joined(separator: separator)
    }

    /// Creates a  combined text view based on the given `content` by inserting
    /// `separator` string between each received text component.
    ///
    /// - Parameters:
    ///   - separator: The string to use as a separator between received text components.
    ///   - content: A text array builder that creates text components.
    public init<Separator: StringProtocol>(separator: Separator, @TextArrayBuilder content: () -> [Text]) {
        self.init(separator: Text(separator), content: content)
    }
}
