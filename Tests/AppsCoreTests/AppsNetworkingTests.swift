//
//  AppsNetworkingTests.swift
//  AppsCoreTests
//
//  Created by Apit Aprida on 24/07/21.
//

import XCTest
@testable import AppsCore

class NetworkingSessionMock: NetworkSession {
  var data: Data?
  var error: Error?
  
  func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
    completionHandler(data, error)
  }
  
  func post(with urlRequest: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
    completionHandler(data, error)
  }
}

struct MockData: Codable, Equatable {
  let id: Int
  let name: String
}

final class AppsNetworkingTests: XCTestCase {
  
  func testLoadDataCall() {
    let manager = AppsCore.Networking.Manager()
    let session = NetworkingSessionMock()
    manager.session = session
    let expectation = XCTestExpectation(description: "Called for data")
    let data = Data([1, 2, 3, 3, 1])
    session.data = data
    let url = URL(fileURLWithPath: "url")
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
  
  func testSendDataCall() {
    let session = NetworkingSessionMock()
    let manager = AppsCore.Networking.Manager()
    let sampleObject = MockData(id: 1, name: "Apit")
    let data = try? JSONEncoder().encode(sampleObject)
    session.data = data
    manager.session = session
    let url = URL(fileURLWithPath: "url")
    let expectation = XCTestExpectation(description: "Send data")
    manager.sendData(to: url, body: sampleObject) { result in
      expectation.fulfill()
      switch result {
      case .success(let returnedData):
        let returnedObject = try? JSONDecoder().decode(MockData.self, from: returnedData)
        XCTAssertEqual(returnedObject, sampleObject)
      case .failure(let error):
        XCTFail(error?.localizedDescription ?? "error forming error result")
      }
    }
    wait(for: [expectation], timeout: 5)
  }
  
  static var allTests = [
    ("testLoadDataCall", testLoadDataCall),
    ("testSendDataCall", testSendDataCall)
  ]
}
