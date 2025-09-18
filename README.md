# TextBuilder

![CI status](https://github.com/davdroman/TextBuilder/workflows/CI/badge.svg)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdavdroman%2FTextBuilder%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/davdroman/TextBuilder)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdavdroman%2FTextBuilder%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/davdroman/TextBuilder)

## Introduction

`Text` composition in SwiftUI can often be cumbersome, especially when there's logic affecting its format and content.

TextBuilder leverages the power of Swift [Macros](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/) to solve this problem. The `@TextBuilder` macro transforms functions into builder-style closures, making text composition intuitive and readable.

## Installation

Add `TextBuilder` to your Swift Package Manager dependencies:

```swift
.package(url: "https://github.com/davdroman/swiftui-text-builder", from: "4.0.0"),
```

Then, add the dependency to your desired target:

```swift
.product(name: "TextBuilder", package: "swiftui-text-builder"),
```

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
var body: some View {
    Text(separator: " 👏 ") {
        "Lorem".text.underline().foregroundColor(.blue)
        "ipsum dolor"
        "sit".text.bold()
        "amet, consectetur"
    }
}
```

This is useful if you simply want to insert some rich text into a view body without defining a separate function.

## Limitations

The `@TextBuilder` macro currently cannot be applied to computed properties due to Swift limitations. Use functions instead.

See [Swift Issue #75715](https://github.com/swiftlang/swift/issues/75715) for updates on computed property support.
