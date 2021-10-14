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
    var components: RGBA? {
        #if canImport(UIKit)
        return UIColor(self).cgColor.rgba
        #elseif canImport(AppKit)
        return NSColor(self).cgColor.rgba
        #endif
    }
}
