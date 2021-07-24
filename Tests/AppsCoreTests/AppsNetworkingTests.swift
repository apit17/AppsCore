//
//  AppsNetworkingTests.swift
//  AppsCoreTests
//
//  Created by Apit Aprida on 24/07/21.
//

import XCTest
import AppsCore

final class AppsNetworkingTests: XCTestCase {
  
  func testLoadDataCall() {
    let manager = AppsCore.Networking.Manager()
    let expectation = XCTestExpectation(description: "Called for data")
    guard let url = URL(string: "https://apple.com") else {
      return XCTFail("Could not create URL properly")
    }
    manager.loadData(from: url) { result in
      expectation.fulfill()
      switch result {
      case .success(let returnedData):
        XCTAssertNotNil(returnedData, "Response data is nil")
      case .failure(let error):
        XCTFail(error?.localizedDescription ?? "error forming error result")
      }
    }
    wait(for: [expectation], timeout: 5)
  }
  
  static var allTests = [
    ("testLoadDataCall", testLoadDataCall)
  ]
}
