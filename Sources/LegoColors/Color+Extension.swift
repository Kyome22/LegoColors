//
//  Color+Extension.swift
//  
//
//  Created by Takuto Nakamura on 2021/10/10.
//

import SwiftUI

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

extension Color {
    var components: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        #if canImport(UIKit)
        let c = UIColor(self)
        var r: CGFloat = .zero
        var g: CGFloat = .zero
        var b: CGFloat = .zero
        var a: CGFloat = .zero
        c.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
        #elseif canImport(AppKit)
        guard let c = NSColor(self).usingColorSpace(.sRGB) else {
            return (0, 0, 0, 0)
        }
        return (c.redComponent, c.greenComponent, c.blueComponent, c.alphaComponent)
        #endif
    }
}
