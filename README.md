# Tuist xcframework Slice Resolution Bug Reproduction

## Bug

Tuist 4.153.x incorrectly resolves the `ios-arm64` (device) slice of
`GoogleAppMeasurement.xcframework` when building for the iOS Simulator,
causing a linker error:

```
building for 'iOS-simulator', but linking in object file ... built for 'iOS'
```

This works correctly in Tuist 4.147.0.

## Branch Strategy

| Branch | Tuist Version | Expected Result |
|--------|--------------|-----------------|
| `main` | Latest (4.153.x) | Build FAILS |
| `tuist-4.147.0` | 4.147.0 | Build SUCCEEDS |

The only difference between branches is the Tuist install command in CI.

## Local Reproduction

```bash
# With latest Tuist (should fail)
brew install --formula tuist
tuist install
tuist generate --no-open
xcodebuild build \
  -workspace XcframeworkRepro.xcworkspace \
  -scheme XcframeworkRepro \
  -configuration Debug \
  -destination 'generic/platform=iOS Simulator' \
  CODE_SIGNING_ALLOWED=NO

# With Tuist 4.147.0 (should succeed)
brew install --formula tuist@4.147.0
tuist install
tuist generate --no-open
xcodebuild build \
  -workspace XcframeworkRepro.xcworkspace \
  -scheme XcframeworkRepro \
  -configuration Debug \
  -destination 'generic/platform=iOS Simulator' \
  CODE_SIGNING_ALLOWED=NO
```
