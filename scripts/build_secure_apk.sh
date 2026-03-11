#!/usr/bin/env bash
# Build a release APK with security hardening for sharing.
# - Dart code obfuscation (symbols stripped; save build/symbols/ for crash decoding only)
# - Single ABI (arm64) for smaller APK
# - Android R8 minify + shrink (see android/app/build.gradle.kts and proguard-rules.pro)

set -e
cd "$(dirname "$0")/.."

echo "Building secure release APK (obfuscated, single ABI)..."
flutter build apk --release \
  --obfuscate \
  --split-debug-info=build/symbols \
  --target-platform android-arm64

APK="build/app/outputs/flutter-apk/app-release.apk"
if [[ -f "$APK" ]]; then
  echo ""
  echo "Done. APK: $APK"
  echo ""
  echo "Important:"
  echo "  - Keep build/symbols/ PRIVATE. You need it to decode release stack traces."
  echo "  - Do not commit build/symbols/ or share it. Add to .gitignore if needed."
  echo "  - For production, sign with a release keystore (see SECURE_BUILD.md)."
else
  echo "Build failed or APK not found."
  exit 1
fi
