//import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxMacros

struct TextBuilderMacro: BodyMacro {
	static func expansion(
		of node: AttributeSyntax,
		providingBodyFor declaration: some DeclSyntaxProtocol & WithOptionalCodeBlockSyntax,
		in context: some MacroExpansionContext
	) throws -> [SwiftSyntax.CodeBlockItemSyntax] {
		[]
	}
}
