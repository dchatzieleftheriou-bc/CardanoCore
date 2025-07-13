// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let useLocalBinary = false

var package = Package(
    name: "CardanoCore",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "CardanoCore",
            targets: ["CardanoCore"])
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.2.1"),
        .package(name: "Bip39", url: "https://github.com/tesseract-one/Bip39.swift.git", from: "0.1.1"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.0.2")
    ],
    targets: [
        .target(
            name: "CardanoCore",
            dependencies: [
                "CCardano",
                "BigInt",
                .product(name: "OrderedCollections", package: "swift-collections")
            ],
            path: "Sources/Core"),
        .testTarget(
            name: "CardanoCoreTests",
            dependencies: ["CardanoCore"])
    ]
)

#if os(Linux)
package.targets.append(
    .systemLibrary(name: "CCardano")
)
#else
let ccardano: Target = useLocalBinary ?
    .binaryTarget(
        name: "CCardano",
        path: "rust/binaries/CCardano.xcframework") :
    .binaryTarget(
        name: "CCardano",
        url: "https://github.com/tesseract-one/Cardano.swift/releases/download/0.1.4/CCardano.binaries.zip",
        checksum: "50fa4995483338bab59ae6abf6bbfe50f6e05507bbcf4128087b75d049b9590e")
package.targets.append(contentsOf: [
    ccardano
])
#endif
