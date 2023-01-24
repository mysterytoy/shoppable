// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Shoppable",
  platforms: [
    .iOS(.v16)
  ],
  products: [
    .library(
      name: "Shoppable",
      targets: ["Shoppable"]
    ),
    .library(
      name: "Product",
      targets: ["Product"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Shoppable",
      dependencies: [
        "Product"
      ]
    ),
    .target(
      name: "Product"
    ),
    .testTarget(
      name: "ShoppableTests",
      dependencies: ["Shoppable"]
    ),
    .testTarget(
      name: "ProductTests",
      dependencies: ["Product"]
    )
  ]
)
