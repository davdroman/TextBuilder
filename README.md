# TextBuilder

![CI status](https://github.com/davdroman/TextBuilder/workflows/CI/badge.svg)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdavdroman%2FTextBuilder%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/davdroman/TextBuilder)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdavdroman%2FTextBuilder%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/davdroman/TextBuilder)

## Introduction

`Text` composition in SwiftUI can often be cumbersome, especially when there's logic affecting its format and content.

TextBuilder leverages the power of Swift [Macros](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/) to solve this problem. The `@TextBuilder` macro transforms functions into builder-style closures, making text composition intuitive and readable.

## Requirements

- Swift 6.0+
- iOS 13.0+, tvOS 13.0+, macOS 10.15+, watchOS 6.0+

## Usage

### Basic Usage

Apply `@TextBuilder` to functions that return `Text`. The macro will transform the function body into a builder-style closure that concatenates text segments.

```swift
@TextBuilder
func loremIpsum() -> Text {
    Text("Lorem").underline().foregroundColor(.blue)
    Text("ipsum dolor")
    Text("sit").bold()
    Text("amet, consectetur")
}
```

This creates a concatenated `Text` without any separators between segments.

### With Separators

You can specify a separator to be inserted between text segments:

```swift
@TextBuilder(separator: " ")
func spacedText() -> Text {
    Text("Lorem").underline().foregroundColor(.blue)
    Text("ipsum dolor")
    Text("sit").bold()
    Text("amet, consectetur")
}
```

For multiline text:

```swift
@TextBuilder(separator: "\n")
func multilineText() -> Text {
    Text("Lorem").underline().foregroundColor(.blue)
    Text("ipsum dolor")
    Text("sit").bold()
    Text("amet, consectetur")
}
```

### String Support ✨

TextBuilder accepts `String` types directly and provides a convenient `.text` computed property:

```swift
@TextBuilder(separator: " ")
func mixedText() -> Text {
    "Hello"  // String literal becomes verbatim Text
    "world".text.bold()  // Use .text for chaining modifiers
    String(2025)  // Any StringProtocol works
}
```

### Control Flow

TextBuilder supports Swift's control flow statements:

```swift
@TextBuilder(separator: " ")
func conditionalText(showDetails: Bool) -> Text {
    "Hello"
    
    if showDetails {
        "with details"
    } else {
        "basic"
    }
    
    if let name = userName {
        name.text.italic()
    }
    
    for i in 1...3 {
        String(i)
    }
}
```

### Alternative API

If you prefer not to use macros, you can use the underlying `Text` initializer directly:

```swift
var customText: Text {
    Text(separator: " 🍆 ") {
        "Lorem".text.underline().foregroundColor(.blue)
        "ipsum dolor"
        "sit".text.bold()
        "amet, consectetur"
    }
}
```

### Joining Text Arrays

For programmatic text composition, use the `joined` method on sequences of `Text`:

```swift
let textArray = [
    Text("First").bold(),
    Text("Second").italic(),
    Text("Third").underline()
]

let joined = textArray.joined(separator: Text(" | "))
```

## Behavior

- **Empty bodies** produce `Text(verbatim: "")`
- **Mixed types**: You can mix `Text` values and string-like values (string literals, `String`, `Substring`, etc.)
- **Control flow**: `if`/`else`, `if let`, and `for` loops are fully supported
- **Modifiers preserved**: Styling applied to individual segments is maintained
- **Separator placement**: Separators are inserted between segments, not before the first or after the last

## Limitations

The `@TextBuilder` macro currently cannot be applied to computed properties due to Swift limitations. Use functions instead.

See [Swift Issue #75715](https://github.com/swiftlang/swift/issues/75715) for updates on computed property support.
