// swift-tools-version: 6.0
import PackageDescription

#if TUIST
import ProjectDescription

let packageSettings = PackageSettings(
    productTypes: [
        "Apollo": .framework,
        "ApolloAPI": .framework,
        "FirebaseAnalytics": .framework,
    ],
    baseSettings: .settings(
        configurations: [
            .debug(name: "Debug"),
            .debug(name: "Debug-Local"),
            .debug(name: "Debug-Staging"),
            .debug(name: "Debug-Production"),
            .release(name: "Release"),
            .release(name: "Staging"),
        ]
    )
)
#endif

let package = Package(
    name: "XcframeworkRepro",
    dependencies: [
        .package(
            url: "https://github.com/apollographql/apollo-ios.git",
            from: "2.0.0"
        ),
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            from: "12.8.0"
        ),
    ]
)
