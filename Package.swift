// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "Features",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .tvOS(.v13),
    .watchOS(.v6),
    .macCatalyst(.v13)],
  products: [
    .library(
      name: "Features",
      targets: ["Features"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-syntax", "509.0.0"..<"601.0.0"),
  ],
  targets: [
    .macro(
      name: "FeaturesMacros",
      dependencies: [
        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
      ]
    ),
    .target(name: "Features", dependencies: ["FeaturesMacros"]),
    .testTarget(
      name: "FeaturesTests",
      dependencies: [
        "FeaturesMacros",
        .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
      ]
    ),
  ]
)
