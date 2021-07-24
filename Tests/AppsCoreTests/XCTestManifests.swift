import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(AppsColorTests.allTests),
    testCase(AppsNetworkingTests.allTests),
  ]
}
#endif
