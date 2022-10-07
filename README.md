# TextBuilder

![CI status](https://github.com/davdroman/TextBuilder/workflows/CI/badge.svg)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdavdroman%2FTextBuilder%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/davdroman/TextBuilder)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdavdroman%2FTextBuilder%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/davdroman/TextBuilder)

## Introduction

`Text` composition in SwiftUI can often be cumbersome, especially when there's logic affecting its format and content.

TextBuilder leverages the power of Swift [Result Builders](https://github.com/apple/swift-evolution/blob/main/proposals/0289-result-builders.md) to solve this problem. TextBuilder mimics SwiftUI's [ViewBuilder](https://developer.apple.com/documentation/swiftui/viewbuilder) to make for a familiar experience at the point of use.

## Usage

TextBuilder offers 3 ready-made builders out of the box, depending on which text separator you need.

### Unspaced Text

```swift
@BasicTextBuilder
var loremIpsum: Text {
    Text("Lorem").underline().foregroundColor(.blue)
    Text("ipsum dolor")
    Text("sit").bold()
    Text("amet, consectetur")
}
```

![](https://github.com/davdroman/TextBuilder/blob/bd991543b123eebf60417b8567f68064655a9151/Tests/TextBuilderTests/__Snapshots__/TextBuilderTests/testBasicTextBuilder.iOS.png?raw=true)

### Spaced Text

```swift
@SpacedTextBuilder
var loremIpsum: Text {
    Text("Lorem").underline().foregroundColor(.blue)
    Text("ipsum dolor")
    Text("sit").bold()
    Text("amet, consectetur")
}
```

![](https://github.com/davdroman/TextBuilder/blob/bd991543b123eebf60417b8567f68064655a9151/Tests/TextBuilderTests/__Snapshots__/TextBuilderTests/testSpacedTextBuilder.iOS.png?raw=true)

### Multiline Text

```swift
@MultilineTextBuilder
var loremIpsum: Text {
    Text("Lorem").underline().foregroundColor(.blue)
    Text("ipsum dolor")
    Text("sit").bold()
    Text("amet, consectetur")
}
```

![](https://github.com/davdroman/TextBuilder/blob/bd991543b123eebf60417b8567f68064655a9151/Tests/TextBuilderTests/__Snapshots__/TextBuilderTests/testMultilineTextBuilder.iOS.png?raw=true)

### Pro Tip ✨

TextBuilder accepts `String` types directly as if they were plain `Text`, and also provides a `String.text` computed var to remove unwanted code noise when `Text` is explicitly needed.

```swift
@MultilineTextBuilder
var loremIpsum: Text {
    "Lorem".text.underline().foregroundColor(.blue)
    "ipsum dolor"
    "sit".text.bold()
    "amet, consectetur"
}
```

### Other Separators

There are two options to customize the separator used to compose your `Text`.

First, you can use `Text.init(separator:content:)`:

```swift
var loremIpsum: Text {
    Text(separator: " 🍆 ") {
        "Lorem".text.underline().foregroundColor(.blue)
        "ipsum dolor"
        "sit".text.bold()
        "amet, consectetur"
    }
}
```

But if you prefer to keep using a result builder, you can:

```swift
struct EggplantSeparator: TextBuilderSeparator {
    static var separator: String { " 🍆 " }
}

@TextBuilder<EggplantSeparator>
var loremIpsum: Text {
    "Lorem".text.underline().foregroundColor(.blue)
    "ipsum dolor"
    "sit".text.bold()
    "amet, consectetur"
}
```

![](https://github.com/davdroman/TextBuilder/blob/bd991543b123eebf60417b8567f68064655a9151/Tests/TextBuilderTests/__Snapshots__/TextBuilderTests/testCustomTextBuilder.iOS.png?raw=true)

## Benchmarks

```
MacBook Pro (14-inch, 2021)
Apple M1 Pro (10 cores, 8 performance and 2 efficiency)
32 GB Memory

$ swift run -c release Benchmarks

name           time        std        iterations
------------------------------------------------
Result Builder 1667.000 ns ±  34.69 %     796036
Initializer    2333.000 ns ±  25.30 %     585724
```
