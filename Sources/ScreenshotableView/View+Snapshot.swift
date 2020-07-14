//
//  File.swift
//  
//
//  Created by Abenx on 2020/7/14.
//

import SwiftUI
import UIKit

extension View {
    func takeScreenshot(afterScreenUpdates: Bool) -> UIImage {
        let hosting = UIHostingController(rootView: self)
        hosting.overrideUserInterfaceStyle = UIApplication.shared.windows.first?.overrideUserInterfaceStyle ?? UIUserInterfaceStyle.unspecified
        hosting.view.sizeToFit()
        return hosting.view.takeScreenshot(afterScreenUpdates: afterScreenUpdates)
    }
}

extension UIView {
    
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
        let draw = self.drawHierarchy(in: self.bounds, afterScreenUpdates: afterScreenUpdates)
        print(draw)
        let snapshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshot!
    }
}
