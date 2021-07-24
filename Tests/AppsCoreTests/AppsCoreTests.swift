import XCTest
@testable import AppsCore

final class AppsCoreTests: XCTestCase {
    
    func testColorRedEqual() {
        let color = AppsCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual)
    ]
}
