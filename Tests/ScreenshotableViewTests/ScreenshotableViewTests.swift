import XCTest
import SnapshotTesting
import SwiftUI

@testable import ScreenshotableView

let referenceFrame = CGRect(x: 0, y: 0, width: 300, height: 400)


final class ScreenshotableViewTests: XCTestCase {

    func testUIViewTakeScreenshot() {
        // 设置测试环境
        let view = UIView(frame: referenceFrame)
        view.backgroundColor = UIColor.red
        let text = UILabel(frame: CGRect(x: 10, y: 10, width: referenceFrame.width - 20, height: 30))
        text.text = "Hello world!"
        text.textAlignment = .center
        view.addSubview(text)
        assertSnapshot(matching: view, as: .image)
        // 验证视图层级
        XCTAssertEqual(view.subviews.count, 1, "视图应该只包含一个子视图")
        XCTAssertTrue(view.subviews.first is UILabel, "子视图应该是UILabel类型")

        // 测试截图功能
        guard let screenshot = view.takeScreenshot() else {
            XCTFail("截图不应该为nil")
            return
        }

        // 验证截图尺寸
        XCTAssertEqual(screenshot.size.width, referenceFrame.width, "截图宽度应该与视图相同")
        XCTAssertEqual(screenshot.size.height, referenceFrame.height, "截图高度应该与视图相同")

        // 验证截图内容
        XCTAssertNotNil(screenshot.cgImage, "截图应该包含有效的CGImage")

        // 验证截图像素
        let imageRef = screenshot.cgImage!
        XCTAssertGreaterThan(imageRef.width, 0, "截图宽度应该大于0")
        XCTAssertGreaterThan(imageRef.height, 0, "截图高度应该大于0")

        // 使用SnapshotTesting进行像素级对比
        assertSnapshot(matching: screenshot, as: .image)
    }


    static var allTests = [
        ("testUIViewTakeScreenshot", testUIViewTakeScreenshot),
        
    ]
}
