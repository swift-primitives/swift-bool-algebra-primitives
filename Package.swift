// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "swift-bool-algebra-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Bool Algebra Primitives",
            targets: ["Bool Algebra Primitives"]
        ),
        .library(
            name: "Bool Algebra Primitives Test Support",
            targets: ["Bool Algebra Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(path: "../swift-algebra-primitives"),
    ],
    targets: [
        .target(
            name: "Bool Algebra Primitives",
            dependencies: [
                .product(name: "Algebra Monoid Primitives", package: "swift-algebra-primitives"),
                .product(name: "Algebra Semiring Primitives", package: "swift-algebra-primitives"),
                .product(name: "Algebra Semilattice Primitives", package: "swift-algebra-primitives"),
            ]
        ),
        .target(
            name: "Bool Algebra Primitives Test Support",
            dependencies: [
                "Bool Algebra Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Bool Algebra Primitives Tests",
            dependencies: [
                "Bool Algebra Primitives",
                "Bool Algebra Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
