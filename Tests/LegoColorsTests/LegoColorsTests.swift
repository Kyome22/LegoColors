import XCTest
import SwiftUI
#if os(iOS)
@testable import LegoColors
#elseif os(macOS)
@testable import LegoColors
#endif

final class LegoColorsTests: XCTestCase {
    
    func testColorComponents() {
        let (r, g, b, _) = Color(red: 0.12, green: 0.34, blue: 0.56).components
        let actualR = (100 * r).rounded() / 100
        let actualG = (100 * g).rounded() / 100
        let actualB = (100 * b).rounded() / 100
        XCTAssertEqual(0.12, actualR)
        XCTAssertEqual(0.34, actualG)
        XCTAssertEqual(0.56, actualB)
    }
    
    func testLegoColorInit() {
        let c = Color(red: 0.949, green: 0.717, blue: 0.254)
        let actual = LegoColor(color: c)
        XCTAssertEqual(LegoColor.brightLightOrange, actual)
    }
    
    func testLegoColorInitOnNative() {
        #if canImport(UIKit)
        let uc = UIColor(red: 0.949, green: 0.717, blue: 0.254, alpha: 1.0)
        let actual = LegoColor(uiColor: uc)
        XCTAssertEqual(LegoColor.brightLightOrange, actual)
        #elseif canImport(AppKit)
        let nc = NSColor(red: 0.949, green: 0.717, blue: 0.254, alpha: 1.0)
        let actual = LegoColor(nsColor: nc)
        XCTAssertEqual(LegoColor.brightLightOrange, actual)
        #endif
    }
}
