import SwiftDiagnostics
public import SwiftSyntax
public import SwiftSyntaxMacros

public struct TextBuilderMacro: BodyMacro {
	public static func expansion(
		of node: AttributeSyntax,
		providingBodyFor declaration: some DeclSyntaxProtocol & WithOptionalCodeBlockSyntax,
		in context: some MacroExpansionContext
	) throws -> [CodeBlockItemSyntax] {
		let separatorExpr: ExprSyntax = if let args = node.arguments, case let .argumentList(list) = args, let first = list.first {
			first.expression
		} else {
			ExprSyntax(NilLiteralExprSyntax())
		}

		let statements = declaration.body?.statements ?? []

		return [
			"""
			Text(separator: \(separatorExpr)) { \(statements) }
			"""
		]
	}
}
