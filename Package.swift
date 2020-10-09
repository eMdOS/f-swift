// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "fswift",
    products: [
        .library(name: "fswift", type: .dynamic, targets: ["Algebra"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Algebra", dependencies: []),
        .testTarget(name: "AlgebraTests", dependencies: ["Algebra"]),
    ],
    swiftLanguageVersions: [.v5]
)
