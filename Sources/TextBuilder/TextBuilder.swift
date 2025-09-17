public import SwiftUI

@attached(body)
public macro TextBuilder(separator: Text? = nil) = #externalMacro(module: "TextBuilderMacro", type: "TextBuilderMacro")

@attached(body)
public macro TextBuilder<Separator: StringProtocol>(separator: Separator) = #externalMacro(module: "TextBuilderMacro", type: "TextBuilderMacro")
