import XCTest
@testable import ScreenshotableView

final class ScreenshotableViewTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ScreenshotableView().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
