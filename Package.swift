// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	
    name: "Weather",
	platforms: [.macOS(.v12)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
		.package(url: "https://github.com/onevcat/Rainbow.git", from: "4.0.1"),
		.package(url: "https://github.com/patriksvensson/spectre-kit.git", branch: "main"),
        .package(url: "https://github.com/rensbreur/SwiftTUI.git", from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Weather",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
				.product(name: "Rainbow", package: "Rainbow"),
				.product(name: "SpectreKit", package: "spectre-kit"),
                .product(name: "SwiftTUI", package: "swifttui")
            ]
        ),
    ]
)
