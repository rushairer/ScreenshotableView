// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "ScreenshotableView",
    platforms: [.iOS(.v13),
                .tvOS(.v13),
                .watchOS(.v6)],
    products: [
        .library(
            name: "ScreenshotableView",
            targets: ["ScreenshotableView"]),
    ],
    dependencies: [
      .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.8.1"),
    ],
    targets: [
        .target(
            name: "ScreenshotableView",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "ScreenshotableViewTests",
            dependencies: [
                "ScreenshotableView",
                "SnapshotTesting",
        ]),
    ],
    swiftLanguageVersions: [.v5]
)
