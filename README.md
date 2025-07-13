# CardanoCore

This repository is a focused fork of [Cardano.swift](https://github.com/tesseract-one/Cardano.swift), streamlined to provide core Cardano blockchain functionality.

## Overview

CardanoCore provides essential Cardano blockchain interactions while maintaining a lighter footprint compared to the full Cardano.swift SDK. This repository focuses on core functionality needed for basic Cardano blockchain operations.

## Features

- Streamlined Cardano blockchain interactions
- Key management and address generation
- Transaction building and signing
- UTXO management
- Network communication basics

## Requirements

- macOS 10.12+ / iOS 11+
- Swift 5.0+
- Xcode 13+ (for development)

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/dchatzieleftheriou-bc/CardanoCore", from: "0.1.0")
]
```

### CocoaPods

Add this to your `Podfile`:

```ruby
pod 'CardanoCore', '~> 0.1.0'
```

## Basic Usage

```swift
import CardanoCore

// Initialize keychain
let keychain = try Keychain(mnemonic: ["your", "mnemonic", "phrase"])

// Generate account
try keychain.addAccount(index: 0)

// Initialize Cardano instance
let cardano = try Cardano(network: .testnet,
                         signer: keychain)

// Generate new address
let account = try cardano.addresses.fetchedAccounts()[0]
let address = try cardano.addresses.new(for: account, change: false)
```

## Differences from Cardano.swift

This repository differs from the original Cardano.swift in the following ways:

- Focused feature set
- Simplified dependency structure
- Modified networking layer
- Streamlined API surface


## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Original [Cardano.swift](https://github.com/tesseract-one/Cardano.swift) project
- Cardano community