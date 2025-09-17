import SwiftDiagnostics
public import SwiftSyntax
public import SwiftSyntaxMacros

public struct TextBuilderMacro: BodyMacro {
	public static func expansion(
		of node: AttributeSyntax,
		providingBodyFor declaration: some DeclSyntaxProtocol & WithOptionalCodeBlockSyntax,
		in context: some MacroExpansionContext
	) throws -> [SwiftSyntax.CodeBlockItemSyntax] {
		[]
	}
}
