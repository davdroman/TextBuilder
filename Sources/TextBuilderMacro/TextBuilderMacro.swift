import SwiftDiagnostics
public import SwiftSyntax
public import SwiftSyntaxMacros

public struct TextBuilderMacro: BodyMacro {
	public static func expansion(
		of node: AttributeSyntax,
		providingBodyFor declaration: some DeclSyntaxProtocol & WithOptionalCodeBlockSyntax,
		in context: some MacroExpansionContext
	) throws -> [CodeBlockItemSyntax] {
		print(declaration)
		guard let originalBody = declaration.body else {
			return []
		}

		// Extract separator expression if provided; default to nil
		let separatorExpr: ExprSyntax = {
			if let args = node.arguments, case let .argumentList(list) = args, let first = list.first {
				return first.expression
			} else {
				// nil literal
				return ExprSyntax(NilLiteralExprSyntax())
			}
		}()

		// Use the original statements, but strip any leading trivia from the first item
		// to avoid an extra blank line after the opening brace of the trailing closure.
		let originalItems = originalBody.statements
//		let adjustedItems: CodeBlockItemListSyntax = {
//			guard let first = originalItems.first else { return originalItems }
//			var itemsArray = Array(originalItems)
//			itemsArray[itemsArray.startIndex] = first.with(\.leadingTrivia, Trivia())
//			return CodeBlockItemListSyntax(itemsArray)
//		}()

		return [
			"""
			Text(separator: \(separatorExpr)) { \(originalItems) }
			"""
		]
	}
}
