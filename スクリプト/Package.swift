// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "translateScript",
    platforms: [.macOS(.v14)],
    targets: [
        .executableTarget(name: "translateScript")
    ]
)
