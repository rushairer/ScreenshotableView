//
//  File.swift
//  
//
//  Created by Abenx on 2020/7/14.
//

import SwiftUI
import UIKit

public extension View {
    func takeScreenshot(frame:CGRect, afterScreenUpdates: Bool) -> UIImage {
        let hosting = UIHostingController(rootView: self)
        hosting.overrideUserInterfaceStyle = UIApplication.shared.windows.first?.overrideUserInterfaceStyle ?? UIUserInterfaceStyle.unspecified
        hosting.view.frame = frame
        return hosting.view.takeScreenshot(afterScreenUpdates: afterScreenUpdates)
    }
}

public extension UIView {
    func takeScreenshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let snapshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshot!
    }
    
    func takeScreenshot(afterScreenUpdates: Bool) -> UIImage {
        if !self.responds(to: #selector(drawHierarchy(in:afterScreenUpdates:))) {
            return self.takeScreenshot()
        }
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: afterScreenUpdates)
        let snapshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshot!
    }
}
