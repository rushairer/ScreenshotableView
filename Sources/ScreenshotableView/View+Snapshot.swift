//
//  File.swift
//  
//
//  Created by Abenx on 2020/7/14.
//

import SwiftUI
import UIKit

public extension View {
    func takeScreenshot(
        frame: CGRect,
        afterScreenUpdates: Bool = true,
        style: UIUserInterfaceStyle? = nil
    ) -> UIImage? {
        let hosting = UIHostingController(rootView: self)
        
        // 同步界面样式
        if let style = style ?? UIApplication.shared.windows.first?.overrideUserInterfaceStyle {
            hosting.overrideUserInterfaceStyle = style
        }
        
        hosting.view.frame = frame
        hosting.view.layoutIfNeeded() // 确保布局更新
        
        return hosting.view.takeScreenshot(afterScreenUpdates: afterScreenUpdates)
    }
}

public extension UIView {
    func takeScreenshot(afterScreenUpdates: Bool = true) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        return renderer.image { context in
            if self.responds(to: #selector(drawHierarchy(in:afterScreenUpdates:))) {
                self.drawHierarchy(in: bounds, afterScreenUpdates: afterScreenUpdates)
            } else {
                self.layer.render(in: context.cgContext)
            }
        }
    }
}
