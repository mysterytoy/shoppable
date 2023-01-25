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
      name: "AppState",
      targets: ["AppState"]
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
      name: "AppState",
      dependencies: [
        "BasketFeature",
        "Product",
        "ProductsFeature"
      ]
    ),
    .target(
      name: "BasketFeature",
      dependencies: [
        "Product"
      ]
    ),
    .target(
      name: "Product"
    ),
    .target(
      name: "ProductsFeature",
      dependencies: [
        "Product"
      ]
    ),
    .target(
      name: "Shoppable",
      dependencies: [
        "AppState",
        "BasketFeature",
        "Product",
        "ProductsFeature"
      ]
    ),
    .testTarget(
      name: "AppStateTests",
      dependencies: ["AppState"]
    ),
    .testTarget(
      name: "ProductTests",
      dependencies: ["Product"]
    )
  ]
)
