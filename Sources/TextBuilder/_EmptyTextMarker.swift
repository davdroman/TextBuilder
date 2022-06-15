// https://github.com/apple/swift/blob/main/test/stdlib/StringCompatibility.swift

import Foundation

struct _EmptyTextMarker {
    var base: String
}

extension _EmptyTextMarker : BidirectionalCollection {
    typealias Iterator = String.Iterator
    typealias Index = String.Index
    typealias SubSequence = _EmptyTextMarker
    func makeIterator() -> Iterator { return base.makeIterator() }
    var startIndex: String.Index { return base.startIndex }
    var endIndex: String.Index { return base.startIndex }
    subscript(i: Index) -> Character { return base[i] }
    subscript(indices: Range<Index>) -> _EmptyTextMarker {
        return _EmptyTextMarker(base: String(self.base[indices]))
    }
    func index(after i: Index) -> Index { return base.index(after: i) }
    func index(before i: Index) -> Index { return base.index(before: i) }
    func index(_ i: Index, offsetBy n: Int) -> Index {
        return base.index(i, offsetBy: n)
    }
    func distance(from i: Index, to j: Index) -> Int {
        return base.distance(from: i, to: j)
    }
}

extension _EmptyTextMarker : RangeReplaceableCollection {
    init() { base = "" }
    mutating func append<S: Sequence>(contentsOf s: S)
    where S.Element == Character {
        base.append(contentsOf: s)
    }
    mutating func replaceSubrange<C: Collection>(_ r: Range<Index>, with c: C)
    where C.Element == Character {
        base.replaceSubrange(r, with: c)
    }
}

extension _EmptyTextMarker : CustomStringConvertible {
    var description: String { return "***MyString***" }
}

extension _EmptyTextMarker : TextOutputStream {
    public mutating func write(_ other: String) {
        append(contentsOf: other)
    }
}

extension _EmptyTextMarker : TextOutputStreamable {
    public func write<Target : TextOutputStream>(to target: inout Target) {
        target.write(base)
    }
}

extension _EmptyTextMarker : ExpressibleByUnicodeScalarLiteral {
    public init(unicodeScalarLiteral value: String) {
        base = .init(unicodeScalarLiteral: value)
    }
}
extension _EmptyTextMarker : ExpressibleByExtendedGraphemeClusterLiteral {
    public init(extendedGraphemeClusterLiteral value: String) {
        base = .init(extendedGraphemeClusterLiteral: value)
    }
}

extension _EmptyTextMarker : ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        base = .init(stringLiteral: value)
    }
}

extension _EmptyTextMarker : CustomReflectable {
    public var customMirror: Mirror {
        return base.customMirror
    }
}

extension _EmptyTextMarker : CustomDebugStringConvertible {
    public var debugDescription: String {
        return "(***MyString***)"
    }
}

extension _EmptyTextMarker : Equatable {
    public static func ==(lhs: _EmptyTextMarker, rhs: _EmptyTextMarker) -> Bool {
        return lhs.base == rhs.base
    }
}

extension _EmptyTextMarker : Comparable {
    public static func <(lhs: _EmptyTextMarker, rhs: _EmptyTextMarker) -> Bool {
        return lhs.base < rhs.base
    }
}

extension _EmptyTextMarker : Hashable {
    public var hashValue : Int {
        return base.hashValue
    }
}

extension _EmptyTextMarker {
    public func hasPrefix(_ prefix: String) -> Bool {
        return self.base.hasPrefix(prefix)
    }

    public func hasSuffix(_ suffix: String) -> Bool {
        return self.base.hasSuffix(suffix)
    }
}

extension _EmptyTextMarker : StringProtocol {
    var utf8: String.UTF8View { return base.utf8 }
    var utf16: String.UTF16View { return base.utf16 }
    var unicodeScalars: String.UnicodeScalarView { return base.unicodeScalars }
    func lowercased() -> String {
        return base.lowercased()
    }
    func uppercased() -> String {
        return base.uppercased()
    }

    init<C: Collection, Encoding: Unicode.Encoding>(
        decoding codeUnits: C, as sourceEncoding: Encoding.Type
    )
    where C.Iterator.Element == Encoding.CodeUnit {
        base = .init(decoding: codeUnits, as: sourceEncoding)
    }

    init(cString nullTerminatedUTF8: UnsafePointer<CChar>) {
        base = .init(cString: nullTerminatedUTF8)
    }

    init<Encoding: Unicode.Encoding>(
        decodingCString nullTerminatedCodeUnits: UnsafePointer<Encoding.CodeUnit>,
        as sourceEncoding: Encoding.Type) {
            base = .init(decodingCString: nullTerminatedCodeUnits, as: sourceEncoding)
        }

    func withCString<Result>(
        _ body: (UnsafePointer<CChar>) throws -> Result) rethrows -> Result {
            return try base.withCString(body)
        }

    func withCString<Result, Encoding: Unicode.Encoding>(
        encodedAs targetEncoding: Encoding.Type,
        _ body: (UnsafePointer<Encoding.CodeUnit>) throws -> Result
    ) rethrows -> Result {
        return try base.withCString(encodedAs: targetEncoding, body)
    }
}
