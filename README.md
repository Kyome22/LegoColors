# LegoColors

A library to make it easier to handle the colors of LEGO blocks with Swift.<br/>
This library supports both iOS (14≤) and macOS (11≤).

## Usage

```swift
// Get CGColor from name of a brick.
let color = LegoColor.darkTurquoise.color

// Get an approximate LegoColor from CGColor
let cgColor = CGColor(srgbRed: 0.12, green: 0.34, blue: 0.56, alpha: 1.0)
let legoColor = LegoColor(cgColor: cgColor)

// Get an approximate LegoColor from UIColor or NSColor.
let legoColor = LegoColor(uiColor: UIColor.blue)
let legoColor = LegoColor(nsColor: NSColor.yellow)
```

Note: `LegoColor` refers to [Color Guid of Bricklink](https://www.bricklink.com/catalogColors.asp).

## LICENSE

Copyright (c) 2021 Takuto NAKAMURA (Kyome)

You are free to use it as long as it is not for commercial use.
