public import Builders
public import SwiftUI

extension StringProtocol {
	@inlinable
	public var text: Text {
		Text(self)
	}
}

extension Sequence<Text> {
	/// Returns a new `Text` by concatenating the elements of the sequence.
	///
	/// If the sequence is empty, it returns nil.
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
	public func joined(separator: Text? = nil) -> Text? {
		reduce(nil) { accumulated, next in
			guard let accumulated else {
				return next
			}
			guard let separator else {
				return accumulated + next
			}
			return accumulated + separator + next
		}
	}
}

extension ArrayBuilder<Text> {
	@inlinable
	public static func buildExpression(_ expression: some StringProtocol) -> [Text] {
		[Text(expression)]
	}
}

extension Text {
	/// Creates a combined text view based on the given `content` by inserting
	/// `separator` text views between each received text component.
	///
	/// - Parameters:
	///   - separator: The text to use as a separator between received text components.
	///     By default there is no separator.
	///   - content: A text array builder that creates text components.
	public init(
		separator: Text? = nil,
		default: Text = Text(verbatim: ""),
		@ArrayBuilder<Text> content: () -> [Text]
	) {
		self = content().joined(separator: separator) ?? `default`
	}

	/// Creates a combined text view based on the given `content` by inserting
	/// `separator` string between each received text component.
	///
	/// - Parameters:
	///   - separator: The string to use as a separator between received text components.
	///   - content: A text array builder that creates text components.
	@inlinable
	public init(
		separator: some StringProtocol,
		default: Text = Text(verbatim: ""),
		@ArrayBuilder<Text> content: () -> [Text]
	) {
		self.init(separator: Text(separator), content: content)
	}
}
