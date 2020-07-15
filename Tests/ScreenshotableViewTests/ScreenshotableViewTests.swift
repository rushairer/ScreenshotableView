import XCTest
import SnapshotTesting
import SwiftUI

@testable import ScreenshotableView

let referenceFrame = CGRect(x: 0, y: 0, width: 300, height: 400)


final class ScreenshotableViewTests: XCTestCase {
    
    func testUIViewTakeScreenshot() {
        let view = UIView(frame: referenceFrame)
        view.backgroundColor = UIColor.red
        let text = UILabel(frame: referenceFrame)
        text.text = "Hello world!"
        view.addSubview(text)
        
        assertSnapshot(matching: view, as: .image)

        let screenshot = view.takeScreenshot()
        XCTAssertNotNil(screenshot)
        XCTAssertEqual(screenshot.size.width, referenceFrame.width)
        XCTAssertEqual(screenshot.size.height, referenceFrame.height)
        
        assertSnapshot(matching: screenshot, as: .image)

    }
    
    static var allTests = [
        ("testUIViewTakeScreenshot", testUIViewTakeScreenshot),
    ]
}
