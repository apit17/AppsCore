import XCTest
@testable import AppsCore

final class AppsCoreTests: XCTestCase {
    
    func testColorRedEqual() {
        let color = AppsCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testAppsColorsAreEqual() {
        let color = AppsCore.colorFromHexString("006736")
        XCTAssertEqual(color, AppsCore.appsColor)
    }
    
    func testSecondaryAppsColorsAreEqual() {
        let color = AppsCore.colorFromHexString("FCFFFD")
        XCTAssertEqual(color, AppsCore.secondaryColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testAppsColorsAreEqual", testAppsColorsAreEqual),
        ("testSecondaryAppsColorsAreEqual", testSecondaryAppsColorsAreEqual)
    ]
}
