// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let coenttbSyndication: Self = "Coenttb Syndication"
}

extension Target.Dependency {
    static var coenttbSyndication: Self { .target(name: .coenttbSyndication) }
}

extension Target.Dependency {
    static var coenttbWeb: Self { .product(name: "Coenttb Web", package: "coenttb-web") }
    static var coenttbVapor: Self { .product(name: "Coenttb Vapor", package: "coenttb-server") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
}

let package = Package(
    name: "coenttb-syndication",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: .coenttbSyndication, targets: [.coenttbSyndication])
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/coenttb-web", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-server", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", branch: "1.6.2"),
    ],
    targets: [
        .target(
            name: .coenttbSyndication,
            dependencies: [
                .coenttbWeb,
                .coenttbVapor,
            ]
        ),
        .testTarget(
            name: .coenttbSyndication + " Tests",
            dependencies: [
                .coenttbSyndication,
                .dependenciesTestSupport
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)
