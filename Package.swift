// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Shoppable",
  products: [
    .library(
      name: "Product",
      targets: ["Product"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Product",
      dependencies: []
    ),
    .testTarget(
      name: "ProductTests",
      dependencies: ["Product"]
    )
  ]
)
