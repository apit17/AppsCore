import XCTest
@testable import AppsCore

final class AppsColorTests: XCTestCase {
  
  func testColorRedEqual() {
    let color = AppsCore.Color.fromHexString("FF0000")
    XCTAssertEqual(color, .red)
  }
  
  func testAppsColorsAreEqual() {
    let color = AppsCore.Color.fromHexString("006736")
    XCTAssertEqual(color, AppsCore.Color.appsColor)
  }
  
  func testSecondaryAppsColorsAreEqual() {
    let color = AppsCore.Color.fromHexString("FCFFFD")
    XCTAssertEqual(color, AppsCore.Color.secondaryColor)
  }
  
  static var allTests = [
    ("testColorRedEqual", testColorRedEqual),
    ("testAppsColorsAreEqual", testAppsColorsAreEqual),
    ("testSecondaryAppsColorsAreEqual", testSecondaryAppsColorsAreEqual)
  ]
}
