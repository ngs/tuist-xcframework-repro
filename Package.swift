// swift-tools-version: 6.0
import PackageDescription

#if TUIST
import ProjectDescription

let packageSettings = PackageSettings(
    productTypes: [
        "FirebaseAnalytics": .framework,
    ],
    baseSettings: .settings(
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release"),
        ]
    )
)
#endif

let package = Package(
    name: "XcframeworkRepro",
    dependencies: [
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            from: "12.8.0"
        ),
    ]
)
