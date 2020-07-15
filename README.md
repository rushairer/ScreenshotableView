# ScreenshotableView

Screenshotable view for SwiftUI

## How to use?

```swift

@State private var sharedImage: UIImage?
@State private var shotting = false

...

// The view want to take screenshot
var content: some View {
...
}

ScreenshotableView(shotting: self.$shotting,
                   completed: { screenshot in
                   self.sharedImage = screenshot
                   self.shotting = false
}) {
    self.content
}

```
