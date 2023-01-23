// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Shoppable",
  products: [
    .library(
      name: "ProductFetcher",
      targets: ["ProductFetcher"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "ProductFetcher",
      dependencies: []
    ),
    .testTarget(
      name: "ProductFetcherTests",
      dependencies: ["ProductFetcher"]
    )
  ]
)
