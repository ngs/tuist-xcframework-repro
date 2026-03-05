import ProjectDescription

let project = Project(
    name: "XcframeworkRepro",
    settings: .settings(
        configurations: [
            .debug(name: "Debug"),
            .debug(name: "Debug-Local"),
            .debug(name: "Debug-Staging"),
            .debug(name: "Debug-Production"),
            .release(name: "Release"),
            .release(name: "Staging"),
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
                .external(name: "Apollo"),
                .external(name: "ApolloAPI"),
                .external(name: "FirebaseAnalytics"),
                .external(name: "FirebaseCrashlytics"),
            ],
            settings: .settings(
                base: [
                    "OTHER_LDFLAGS": ["$(inherited)", "-ObjC"],
                ]
            )
        ),
    ]
)
