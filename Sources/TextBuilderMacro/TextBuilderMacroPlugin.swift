import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct TextBuilderMacroPlugin: CompilerPlugin {
	let providingMacros: [any Macro.Type] = [
		TextBuilderMacro.self,
	]
}
