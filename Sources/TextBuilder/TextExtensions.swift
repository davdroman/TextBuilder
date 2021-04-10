import SwiftUI

extension StringProtocol {
    public var text: Text { Text(self) }
}

extension Sequence where Element == Text {
    public func joined(separator: Text = Text("")) -> Text {
        var isInitial = true
        return reduce(Text("")) { (result, text) in
            if isInitial {
                isInitial = false
                return text
            }
            return result + separator + text
        }
    }
}

extension Text {
    public init(separator: Text = Text(""), @BasicTextBuilder content: () -> [Text]) {
        self = content().joined(separator: separator)
    }

    public init<Separator: StringProtocol>(separator: Separator, @BasicTextBuilder content: () -> [Text]) {
        self.init(separator: Text(separator), content: content)
    }
}
