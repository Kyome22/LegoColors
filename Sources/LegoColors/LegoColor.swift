//
//  LegoColor.swift
//
//
//  Created by Takuto Nakamura on 2021/10/10.
//
//  Color Guid of Bricklink.com
//  https://www.bricklink.com/catalogColors.asp

import SwiftUI

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public struct LegoColor: Equatable {
    public let name: String
    public let color: Color
    public let bricklinkID: Int
    
    init(id: Int, red: Double, green: Double, blue: Double, opacity: Double = 1, name: String) {
        self.name = name
        self.color = Color(red: red, green: green, blue: blue, opacity: opacity)
        self.bricklinkID = id
    }
    
    func diff(red: CGFloat, green: CGFloat, blue: CGFloat) -> CGFloat {
        let (r, g, b, _) = color.components
        return abs(r - red) + abs(g - green) + abs(b - blue)
    }
    
    public static func == (lhs: LegoColor, rhs: LegoColor) -> Bool {
        return lhs.name == rhs.name
    }
}

public extension LegoColor {
    static let white =               SolidColors[0_]
    static let vertLightGray =       SolidColors[1_]
    static let veryLightBluishGray = SolidColors[2_]
    static let lightBluishGray =     SolidColors[3_]
    static let lightGray =           SolidColors[4_]
    static let darkGray =            SolidColors[5_]
    static let darkBluishGray =      SolidColors[6_]
    static let black =               SolidColors[7_]
    static let darkRed =             SolidColors[8_]
    static let red =                 SolidColors[9_]
    static let rust =                SolidColors[10]
    static let coral =               SolidColors[11]
    static let darkSalmon =          SolidColors[12]
    static let salmon =              SolidColors[13]
    static let lightSalmon =         SolidColors[14]
    static let sandRed =             SolidColors[15]
    static let reddishBrown =        SolidColors[16]
    static let brown =               SolidColors[17]
    static let darkBrown =           SolidColors[18]
    static let darkTan =             SolidColors[19]
    static let tan =                 SolidColors[20]
    static let lightNougat =         SolidColors[21]
    static let nougat =              SolidColors[22]
    static let mediumNougat =        SolidColors[23]
    static let darkNougat =          SolidColors[24]
    static let mediumBrown =         SolidColors[25]
    static let fabulandBrown =       SolidColors[26]
    static let fabulandOrange =      SolidColors[27]
    static let earthOrange =         SolidColors[28]
    static let darkOrange =          SolidColors[29]
    static let neonOrange =          SolidColors[30]
    static let orange =              SolidColors[31]
    static let mediumOrange =        SolidColors[32]
    static let brightLightOrange =   SolidColors[33]
    static let lightOrange =         SolidColors[34]
    static let veryLightOrange =     SolidColors[35]
    static let darkYellow =          SolidColors[36]
    static let yellow =              SolidColors[37]
    static let brightLightYellow =   SolidColors[38]
    static let lightYellow =         SolidColors[39]
    static let lightLime =           SolidColors[40]
    static let yellowishGreen =      SolidColors[41]
    static let neonGreen =           SolidColors[42]
    static let mediumLime =          SolidColors[43]
    static let lime =                SolidColors[44]
    static let oliveGreen =          SolidColors[45]
    static let darkGreen =           SolidColors[46]
    static let green =               SolidColors[47]
    static let brightGreen =         SolidColors[48]
    static let mediumGreen =         SolidColors[49]
    static let lightGreen =          SolidColors[50]
    static let sandGreen =           SolidColors[51]
    static let darkTurquoise =       SolidColors[52]
    static let lightTurquoise =      SolidColors[53]
    static let aqua =                SolidColors[54]
    static let lightAqua =           SolidColors[55]
    static let darkBlue =            SolidColors[56]
    static let blue =                SolidColors[57]
    static let darkAzure =           SolidColors[58]
    static let mediumAzure =         SolidColors[59]
    static let mediumBlue =          SolidColors[60]
    static let maerskBlue =          SolidColors[61]
    static let brightLightBlue =     SolidColors[62]
    static let lightBlue =           SolidColors[63]
    static let skyBlue =             SolidColors[64]
    static let sandBlue =            SolidColors[65]
    static let blueViolet =          SolidColors[66]
    static let darkBlueViolet =      SolidColors[67]
    static let violet =              SolidColors[68]
    static let mediumViolet =        SolidColors[69]
    static let lightViolet =         SolidColors[70]
    static let darkPurple =          SolidColors[71]
    static let purple =              SolidColors[72]
    static let lightPurple =         SolidColors[73]
    static let mediumLavender =      SolidColors[74]
    static let clikitsLavender =     SolidColors[75]
    static let lavender =            SolidColors[76]
    static let sandPurple =          SolidColors[77]
    static let magenta =             SolidColors[78]
    static let darkPink =            SolidColors[79]
    static let mediumDarkPink =      SolidColors[80]
    static let brightPink =          SolidColors[81]
    static let pink =                SolidColors[82]
    static let lightPink =           SolidColors[83]
    
    static let transClear = LegoColor(id: 12,
                                      red: 0.932,
                                      green: 0.932,
                                      blue: 0.932,
                                      opacity: 0.3,
                                      name: "transClear")
    
    #if os(iOS)
    // return an approximate color from UIColor
    init(uiColor: UIColor) {
        // Default color space of UIColor is sRGB.
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if a < 0.5 {
            self = LegoColor.transClear
        } else {
            self = LegoColor.getApproximateColor(r: r, g: g, b: b)
        }
    }
    #endif
    
    #if os(macOS)
    // return an approximate color from NSColor
    init?(nsColor: NSColor) {
        guard let sRGBColor = nsColor.usingColorSpace(.sRGB) else { return nil }

        let r = sRGBColor.redComponent
        let g = sRGBColor.greenComponent
        let b = sRGBColor.blueComponent
        let a = sRGBColor.alphaComponent
    
        if a < 0.5 {
            self = LegoColor.transClear
        } else {
            self = LegoColor.getApproximateColor(r: r, g: g, b: b)
        }
    }
    #endif
    
    init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        if a < 0.5 {
            self = LegoColor.transClear
        } else {
            self = LegoColor.getApproximateColor(r: r, g: g, b: b)
        }
    }
    
    init(color: Color) {
        let (r, g, b, a) = color.components
        if a < 0.5 {
            self = LegoColor.transClear
        } else {
            self = LegoColor.getApproximateColor(r: r, g: g, b: b)
        }
    }
    
    static func getApproximateColor(r: CGFloat, g: CGFloat, b: CGFloat) -> LegoColor {
        var n: Int = 0
        var diff = SolidColors[n].diff(red: r, green: g, blue: b)
        for i in (1 ..< SolidColors.count) {
            let d = SolidColors[i].diff(red: r, green: g, blue: b)
            if d < diff {
                diff = d
                n = i
            }
        }
        return SolidColors[n]
    }
}
