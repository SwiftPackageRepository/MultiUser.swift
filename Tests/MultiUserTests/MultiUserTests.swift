import XCTest
@testable import MultiUser

final class MultiUserTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let userService = UserService()
        XCTAssertEqual(userService.hasUsers, false)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
