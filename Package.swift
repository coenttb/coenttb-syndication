// swift-tools-version:6.0

import Foundation
import PackageDescription

extension String {
    static let coenttbSyndication: Self = "Coenttb Syndication"
    static let coenttbSyndicationVapor: Self = "Coenttb Syndication Vapor"
}

extension Target.Dependency {
    static var coenttbSyndication: Self { .target(name: .coenttbSyndication) }
    static var coenttbSyndicationVapor: Self { .target(name: .coenttbSyndicationVapor) }
}

extension Target.Dependency {
    static var coenttbWeb: Self { .product(name: "Coenttb Web", package: "coenttb-web") }
    static var coenttbVapor: Self { .product(name: "Coenttb Vapor", package: "coenttb-server-vapor") }
    static var dependenciesTestSupport: Self { .product(name: "DependenciesTestSupport", package: "swift-dependencies") }
}

let package = Package(
    name: "coenttb-syndication",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .library(name: .coenttbSyndication, targets: [.coenttbSyndication]),
        .library(name: .coenttbSyndicationVapor, targets: [.coenttbSyndicationVapor])
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/coenttb-web", branch: "main"),
        .package(url: "https://github.com/coenttb/coenttb-server-vapor", branch: "main"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.6.2"),
    ],
    targets: [
        .target(
            name: .coenttbSyndication,
            dependencies: [
                .coenttbWeb,
            ]
        ),
        .target(
            name: .coenttbSyndicationVapor,
            dependencies: [
                .coenttbWeb,
                .coenttbSyndication,
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
