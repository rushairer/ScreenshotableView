
import SwiftUI
import UIKit

public struct ScreenshotableView<Content: View>: View {
    @Binding var shotting: Bool
    var completed: (UIImage) -> Void
    let content: Content
    
    public init(shotting:Binding<Bool>, completed: @escaping (UIImage) -> Void, @ViewBuilder content: () -> Content) {
        self._shotting = shotting
        self.completed = completed
        self.content = content()
    }

    public var body: some View {
        if self.shotting {
            DispatchQueue.main.async {
                let screenshot = self.content.takeScreenshot(afterScreenUpdates: true)
                self.completed(screenshot)
            }
        }
        return content
    }
}
