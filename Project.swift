import ProjectDescription

let project = Project(
    name: "XcframeworkRepro",
    settings: .settings(
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release"),
        ]
    ),
    targets: [
        .target(
            name: "XcframeworkRepro",
            destinations: [.iPhone],
            product: .app,
            bundleId: "com.example.xcframework-repro",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .extendingDefault(with: [:]),
            sources: ["Sources/**"],
            dependencies: [
                .external(name: "FirebaseAnalytics"),
            ]
        ),
    ]
)
