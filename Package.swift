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
      name: "AppModel",
      targets: ["AppModel"]
    ),
    .library(
      name: "BasketFeature",
      targets: ["BasketFeature"]
    ),
    .library(
      name: "Product",
      targets: ["Product"]
    ),
    .library(
      name: "ProductsFeature",
      targets: ["ProductsFeature"]
    ),
    .library(
      name: "Shoppable",
      targets: ["Shoppable"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "AppModel",
      dependencies: [
        "Product"
      ]
    ),
    .target(
      name: "BasketFeature",
      dependencies: [
        "AppModel",
        "Product"
      ]
    ),
    .target(
      name: "Product"
    ),
    .target(
      name: "ProductsFeature",
      dependencies: [
        "AppModel",
        "Product"
      ]
    ),
    .target(
      name: "Shoppable",
      dependencies: [
        "AppModel",
        "BasketFeature",
        "Product",
        "ProductsFeature"
      ]
    ),
    .testTarget(
      name: "AppModelTests",
      dependencies: ["AppModel"]
    ),
    .testTarget(
      name: "ProductTests",
      dependencies: ["Product"]
    )
  ]
)
