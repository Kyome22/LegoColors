# LegoColors

A library to make it easier to handle the colors of LEGO blocks with SwiftUI's Color.
This library supports both iOS (14≤) and macOS (11≤).

## Usage

```swift
// Get SwiftUI's Color from name of a brick.
let color = LegoColor.darkTurquoise.color

// Get an approximate LegoColor from SwiftUI's Color
let legoColor = LegoColor(color: Color.green)

// Get an approximate LegoColor from UIColor or NSColor.
let legoColor = LegoColor(uiColor: UIColor.blue)
let legoColor = LegoColor(nsColor: NSColor.yellow)
```

Note: `LegoColor` refers to [Color Guid of Bricklink](https://www.bricklink.com/catalogColors.asp).
