// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LegoColors",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "LegoColors",
            targets: ["LegoColors"]),
    ],
    targets: [
        .target(
            name: "LegoColors",
            dependencies: []),
        .testTarget(
            name: "LegoColorsTests",
            dependencies: ["LegoColors"]),
    ]
)
