// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-bool-algebra-primitives",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
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
        .package(
            url: "https://github.com/swift-primitives/swift-algebra-primitives.git",
            branch: "main"
        )
    ],
    targets: [

        .target(
            name: "Bool Algebra Primitives",
            dependencies: [
                .product(name: "Algebra Monoid Primitives", package: "swift-algebra-primitives"),
                .product(name: "Algebra Semiring Primitives", package: "swift-algebra-primitives"),
                .product(
                    name: "Algebra Semilattice Primitives",
                    package: "swift-algebra-primitives"
                ),
                .product(name: "Algebra Lattice Primitives", package: "swift-algebra-primitives"),
            ]
        ),
        .target(
            name: "Bool Algebra Primitives Test Support",
            dependencies: [
                "Bool Algebra Primitives"
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
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
