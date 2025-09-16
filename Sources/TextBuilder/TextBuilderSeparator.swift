public protocol TextBuilderSeparator {
	associatedtype Separator: StringProtocol
	static var separator: Separator? { get }
}

public struct NoSeparator: TextBuilderSeparator {
	public static var separator: String? { nil }
}

public struct WhitespaceSeparator: TextBuilderSeparator {
	public static var separator: String? { " " }
}

public struct NewlineSeparator: TextBuilderSeparator {
	public static var separator: String? { "\n" }
}

public typealias TextBuilder = TextBuilderWith<NoSeparator>
public typealias TextBuilderWithSpaces = TextBuilderWith<WhitespaceSeparator>
public typealias TextBuilderWithNewlines = TextBuilderWith<NewlineSeparator>
