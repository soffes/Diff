// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Diff",
    products: [
        .library(name: "Diff", targets: ["Diff"])
    ],
    targets: [
        .target(name: "Diff"),
        .testTarget(name: "DiffTests", dependencies: ["Diff"])
    ]
)
