# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Elder Shield is an on-device SMS scam detector designed for elderly users. It uses weighted heuristic scoring to analyze incoming SMS messages in real-time, flags suspicious content, and provides one-tap protective actions — all without sending any message content off the device.

## Build & Development Commands

```bash
# Install dependencies
flutter pub get

# Run in debug mode
flutter run

# Run tests
flutter test

# Run a single test file
flutter test test/heuristic_detector_test.dart

# Lint/analyze
flutter analyze

# Regenerate localization files (after editing .arb files in lib/l10n/)
flutter gen-l10n

# Release build (obfuscated, ARM64-only, requires keystore)
./scripts/build_secure_apk.sh
```

**Requirements:** Flutter 3.x, Android SDK API 35, Java 17

## Architecture

The app uses Clean Architecture with Riverpod for state management.

**Core layers:**
- `lib/domain/detector/` — Pure Dart heuristic scoring engine. `HeuristicDetector` computes a 0.0–1.0 risk score from weighted signals (short URLs, urgency language, OTP phrases, bank/KYC keywords, etc.). Config is loaded at startup from `config/detector-config.json`.
- `lib/data/database.dart` — SQLCipher-encrypted SQLite database with a per-device 256-bit key stored in the Android Keystore.
- `lib/features/` — Modular screens: `home`, `messages`, `security`, `settings`, `onboarding`, `shell`.
- `lib/platform/` — Dart-side Method/Event channel bridges to Kotlin native code.
- `lib/services/` — `NotificationService`, `SettingsService` (EncryptedSharedPreferences), `UrlExpander`.

**Kotlin native side (`android/app/src/main/kotlin/com/eldershield/elder_shield/`):**
- `SmsReceiver.kt` — `BroadcastReceiver` (priority 999) that handles SMS when the app is killed. Runs `SimpleRiskCheck.kt` inline and triggers `ScamOverlayService.kt` for high-risk matches.
- `ScamOverlayService.kt` — Draws a system overlay warning when the app is in the background.
- `SmsEventEmitter.kt` — Pushes SMS events to Flutter via `EventChannel` when the app is foregrounded.
- `CallStateListener.kt` — Detects active calls via `TelephonyCallback` (API 31+); OTP risk score gets a +0.35 boost during calls.

**Key data flow:**
1. SMS arrives → `SmsReceiver.kt` (Kotlin)
2. If app is alive: event emitted via `NativeEventStream` → `SecurityController` (Riverpod) → `HeuristicDetector` → alert UI
3. If app is killed: `SimpleRiskCheck.kt` scores inline → `ScamOverlayService` shows overlay

## Key Configuration

- `config/detector-config.json` — Detection thresholds (medium: 0.4, high: 0.7) and keyword lists. Designed to be remotely updatable.
- `lib/application/app_providers.dart` — Global Riverpod providers (whitelist, foreground state, theme, language, font scale).
- `android/app/src/main/AndroidManifest.xml` — Permissions (`RECEIVE_SMS`, `READ_PHONE_STATE`, `SYSTEM_ALERT_WINDOW`, etc.) and receiver/service declarations.

## Localization

9 languages: English, Hindi, Bengali, Telugu, Tamil, Kannada, Malayalam, Urdu, Assamese.

- Edit ARB files in `lib/l10n/`
- Run `flutter gen-l10n` to regenerate `app_localizations_*.dart`
- In-app language switching works without restart via Riverpod

## Security Notes

- No message content leaves the device; all analysis is on-device
- Database encrypted with SQLCipher (256-bit AES key in Android Keystore)
- User preferences stored in `EncryptedSharedPreferences`
- Release APKs are obfuscated with R8; see `SECURE_BUILD.md` for signing setup
- Keystore files (`key.properties`, `*.jks`) are gitignored and must be set up locally
