# ScreenshotableView

[![Swift](https://img.shields.io/badge/Swift-5.2-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2013.0%20%7C%20tvOS%2013.0%20%7C%20watchOS%206.0-blue.svg)](https://developer.apple.com/)

一个用于 SwiftUI 的截图组件，支持对任意 SwiftUI 视图进行截图操作。

## 特性

-   支持对任意 SwiftUI 视图进行截图
-   支持自定义截图时机
-   支持深色/浅色模式截图
-   适配 iOS 13.0+、tvOS 13.0+ 和 watchOS 6.0+

## 安装

### Swift Package Manager

在 `Package.swift` 中添加依赖：

```swift
dependencies: [
    .package(url: "https://github.com/rushairer/ScreenshotableView.git", from: "1.0.0")
]
```

## 基本用法

```swift
import SwiftUI
import ScreenshotableView

struct ContentView: View {
    @State private var sharedImage: UIImage?
    @State private var shotting = false

    var content: some View {
        Text("Hello, World!")
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
    }

    var body: some View {
        ScreenshotableView(shotting: self.$shotting,
                         completed: { screenshot in
            self.sharedImage = screenshot
            self.shotting = false
        }) {
            content
        }
        .onTapGesture {
            shotting = true
        }
    }
}
```

## 高级用法

### 自定义截图时机

通过控制 `shotting` 状态来决定何时进行截图：

```swift
Button("Take Screenshot") {
    shotting = true
}
```

### 指定界面样式

可以在截图时指定界面样式（深色/浅色模式）：

```swift
View(...)
    .takeScreenshot(frame: frame, style: .dark)
```

## 注意事项

1. 确保在截图完成后将 `shotting` 状态设置为 `false`
2. 截图操作是在主线程异步执行的
3. 建议在截图前确保视图已完全加载和布局

## 许可证

本项目基于 MIT 许可证开源，详细信息请查看 [LICENSE](LICENSE) 文件。
