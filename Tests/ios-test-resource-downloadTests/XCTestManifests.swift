import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ios_test_resource_downloadTests.allTests),
    ]
}
#endif
