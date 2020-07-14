import XCTest
import SnapshotTesting
import SwiftUI

@testable import ScreenshotableView

let referenceFrame = CGRect(x: 0, y: 0, width: 300, height: 400)

struct TestView: View {
    var body: some View {
        Text("Hello")
            .background(Color.red)
            .frame(width: referenceFrame.width, height: referenceFrame.height, alignment: .center)
    }
}

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
    
    /*
    func testUIViewTakeScreenshotAfterScreenUpdates() {
        let content = UIView(frame: referenceFrame)
        content.alpha = 0.5
        let imageView = UIImageView(image: UIImage(systemName: "star.lefthalf.fill"))
        imageView.frame = referenceFrame
        content.addSubview(imageView)
        
        let view = UIView(frame: referenceFrame)
        content.addSubview(view)

        let text = UILabel(frame: referenceFrame)
        text.text = "Hello world!"
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = referenceFrame
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyView.frame = referenceFrame
        vibrancyView.contentView.addSubview(text)
        blurView.contentView.addSubview(vibrancyView)
        view.addSubview(blurView)

        let screenshot = content.takeScreenshot(afterScreenUpdates: true)
        XCTAssertNotNil(screenshot)
        XCTAssertEqual(screenshot.size.width, referenceFrame.width)
        XCTAssertEqual(screenshot.size.height, referenceFrame.height)
        
        let screenshot2 = content.takeScreenshot(afterScreenUpdates: false)
        XCTAssertNotNil(screenshot2)
        XCTAssertEqual(screenshot2.size.width, referenceFrame.width)
        XCTAssertEqual(screenshot2.size.height, referenceFrame.height)
    }
    
    func testViewScreenshot()  {
        let view = TestView()
        let screenshot = view.takeScreenshot(afterScreenUpdates: true)
        XCTAssertNotNil(screenshot)
        XCTAssertEqual(screenshot.size.width, referenceFrame.width)
        XCTAssertEqual(screenshot.size.height, referenceFrame.height)
        
    }
  
    */
    
    static var allTests = [
        ("testUIViewTakeScreenshot", testUIViewTakeScreenshot),
        //("testUIViewTakeScreenshotAfterScreenUpdates", testUIViewTakeScreenshotAfterScreenUpdates),
        //("testViewScreenshot", testViewScreenshot),
    ]
}
