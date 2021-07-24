import XCTest
@testable import AppsCore

final class AppsCoreTests: XCTestCase {
    
    func testColorRedEqual() {
        let color = AppsCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testAppsColorsAreEquals() {
        let color = AppsCore.colorFromHexString("006736")
        XCTAssertEqual(color, AppsCore.appsColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testAppsColorsAreEquals", testAppsColorsAreEquals)
    ]
}
