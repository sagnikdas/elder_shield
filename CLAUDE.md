# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Elder Shield is an on-device SMS scam detector designed for elderly users in India. It uses weighted heuristic scoring to analyze incoming SMS messages in real-time, flags suspicious content, and provides one-tap protective actions — all without sending any message content off the device.

**Target users:** Elderly parents (60+, Tier 2 cities) as users; their adult children (25–40, metro) as buyers/caregivers.

**Business model:** Free (full detection) + "Guardian Plan" paid subscription (₹99/month or ₹799/year) for WhatsApp guardian alerts, daily heartbeat, weekly summaries.

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

### Core Dart layers

- `lib/domain/detector/` — Pure Dart heuristic scoring engine. `HeuristicDetector` computes a 0.0–1.0 risk score from weighted signals (short URLs, urgency language, OTP phrases, bank/KYC keywords, DLT sender IDs, etc.). Config loaded from `config/detector-config.json`.
- `lib/data/database.dart` — SQLCipher-encrypted SQLite database with per-device 256-bit key stored in Android Keystore.
- `lib/features/` — Modular screens: `home`, `messages`, `security`, `settings`, `onboarding`, `shell`.
- `lib/platform/` — Dart-side Method/Event channel bridges to Kotlin native code.
- `lib/application/app_providers.dart` — All global Riverpod providers.

### Services (`lib/services/`)

| File | Purpose |
|------|---------|
| `notification_service.dart` | Local push notifications via `flutter_local_notifications` |
| `settings_service.dart` | Wraps `FlutterSecureStorage` (EncryptedSharedPreferences); source of truth for all user preferences |
| `url_expander.dart` | Expands short URLs before the user taps a link |
| `guardian_alert_service.dart` | Rate-limited WhatsApp/SMS alert to guardian on high-risk detection (Dart side) |
| `subscription_service.dart` | Google Play Billing for Guardian Plan (monthly/yearly); exposes `isPremiumStream` |
| `heartbeat_service.dart` | Schedules WorkManager periodic tasks (daily 10AM, weekly Sundays) for heartbeat/summary |

### Kotlin native side (`android/app/src/main/kotlin/com/eldershield/elder_shield/`)

| File | Purpose |
|------|---------|
| `SmsReceiver.kt` | `BroadcastReceiver` (priority 999) — handles SMS when app is killed; runs `SimpleRiskCheck` inline |
| `ScamOverlayService.kt` | Draws system overlay warning when app is in background |
| `SmsEventEmitter.kt` | Pushes SMS events to Flutter via `EventChannel` when app is foregrounded |
| `CallStateListener.kt` | Detects active calls (API 31+); OTP risk score gets +0.35 boost during calls |
| `WhatsAppIntentHelper.kt` | Sends guardian alerts (rate-limited) or heartbeat messages via WhatsApp deep link or SMS fallback |
| `HeartbeatWorker.kt` | WorkManager `Worker` subclass — builds and delivers daily/weekly messages to guardian |
| `MainActivity.kt` | Registers all MethodChannels and the EventChannel |

### MethodChannels registered in `MainActivity.kt`

| Channel | Methods |
|---------|---------|
| `elder_shield/launch` | `getLaunchSms` — retrieves SMS payload that opened the app from a notification |
| `elder_shield/system` | `canDrawOverlays`, `openOverlayPermissionSettings` |
| `elder_shield/whitelist` | `setWhitelist` — syncs trusted senders to Kotlin SharedPreferences |
| `elder_shield/guardian` | `syncGuardian` — syncs guardian name/number/protected name to SharedPreferences |
| `elder_shield/heartbeat` | `syncGuardianInfo`, `syncHeartbeatData`, `getLastHeartbeatTime` |
| `fraud_guard/events` | EventChannel — streams incoming SMS events to Flutter |

### Key data flow

1. SMS arrives → `SmsReceiver.kt`
2. If app is alive: event emitted via `NativeEventStream` → `SecurityController` (Riverpod) → `HeuristicDetector` → alert UI + optional guardian alert
3. If app is killed: `SimpleRiskCheck.kt` scores inline → `ScamOverlayService` shows overlay + `WhatsAppIntentHelper` fires guardian alert

## Key Configuration

- `config/detector-config.json` — Detection thresholds (medium: 0.4, high: 0.7) and keyword lists. Designed to be remotely updatable.
- `lib/application/app_providers.dart` — Riverpod providers: `settingsServiceProvider`, `subscriptionServiceProvider`, `isPremiumProvider`, `heartbeatServiceProvider`, `whitelistedSendersProvider`, `fontScaleProvider`, `themeModeProvider`, `languageCodeProvider`.
- `android/app/build.gradle.kts` — App dependencies including `androidx.work:work-runtime-ktx:2.9.0` (required for `HeartbeatWorker`).
- `android/app/src/main/AndroidManifest.xml` — Permissions (`RECEIVE_SMS`, `READ_PHONE_STATE`, `SYSTEM_ALERT_WINDOW`, etc.) and receiver/service declarations.

## Settings Storage (`SettingsService` / `SettingsKeys`)

All stored in `FlutterSecureStorage` (EncryptedSharedPreferences):

| Key | Type | Purpose |
|-----|------|---------|
| `onboarding_complete` | bool | Has the user completed onboarding |
| `user_role` | String | `'caregiver'` or `'self'` — set during onboarding |
| `protected_person_name` | String? | e.g. "Maa", "Papa" — used in guardian messages |
| `guardian_contact` | JSON | `{name, number}` — the caregiver who receives alerts |
| `trusted_contacts` | JSON array | `[{name, number}]` — for one-tap call |
| `whitelisted_senders` | JSON array | Sender IDs to never alert on |
| `sensitivity_mode` | String | `conservative`/`balanced`/`sensitive` |
| `font_scale` | double | Text size multiplier (1.0 = 100%) |
| `theme_mode` | String | `light`/`dark`/`system` |
| `language_code` | String? | e.g. `en`, `hi`, `bn`; null = follow system |
| `is_premium_cached` | bool | Cached subscription state (re-verified on startup) |

## Onboarding Flow

Role-based branching:
1. `RoleSelectionScreen` — "I'm setting this up for a parent" vs "Protect myself"
2. **Caregiver path** (`CaregiverFlow`): pick protected person name → add guardian contact (self) → permissions
3. **Self-protection path** (`SelfProtectionFlow`): enter own name → permissions + optional guardian section

## Subscription (Guardian Plan)

- Product IDs: `guardian_plan_monthly` (₹99/month), `guardian_plan_yearly` (₹799/year)
- `SubscriptionService` — Google Play Billing via `in_app_purchase: ^3.2.0`
- `isPremiumProvider` — `StreamProvider<bool>` watched throughout the app
- Paywall screen: `lib/presentation/paywall/guardian_paywall_screen.dart`
- Route: `AppRoutes.guardianPaywall` (`/guardian-paywall`)
- Settings entry: Guardian Plan tile in settings screen (shows "Active" badge when subscribed)

## Heartbeat & Weekly Summary

- `HeartbeatService.initialize()` is called on app startup only when: `isPremiumCached == true` AND a guardian contact is configured
- Daily task fires at 10AM; weekly summary fires at 10AM on Sundays (WorkManager checks `DateTime.sunday`)
- Flutter side collects DB stats → syncs to SharedPreferences via `elder_shield/heartbeat` channel → `HeartbeatWorker.kt` reads and sends
- `WhatsAppIntentHelper.sendTextMessage()` (no rate limiting) used for scheduled messages vs `sendGuardianAlert()` (rate-limited) for real-time alerts

## Localization

9 languages: English (`en`), Hindi (`hi`), Bengali (`bn`), Telugu (`te`), Tamil (`ta`), Kannada (`kn`), Malayalam (`ml`), Urdu (`ur`), Assamese (`as`).

- Edit ARB files in `lib/l10n/`
- Run `flutter gen-l10n` to regenerate `app_localizations_*.dart`
- In-app language switching works without restart via Riverpod
- Note: Kannada (`kn`) has ~61 untranslated strings from legacy screens — non-blocking warning

## Navigation / Routes (`AppRoutes`)

| Constant | Path | Screen |
|----------|------|--------|
| `root` | `/` | LaunchGate (or onboarding if first run) |
| `shell` | `/shell` | MainShell (bottom nav, index 0) |
| `messages` | `/messages` | MainShell index 1 |
| `settings` | `/settings` | MainShell index 2 |
| `guardianPaywall` | `/guardian-paywall` | GuardianPaywallScreen |

## Security Notes

- No message content leaves the device; all analysis is on-device
- Database encrypted with SQLCipher (256-bit AES key in Android Keystore)
- User preferences stored in `FlutterSecureStorage` (EncryptedSharedPreferences)
- Release APKs are obfuscated with R8; see `SECURE_BUILD.md` for signing setup
- Keystore files (`key.properties`, `*.jks`) are gitignored and must be set up locally
- `WhatsAppIntentHelper` rate limiting: 10-min min interval, 1-hour same-sender cooldown, max 10 alerts/day

## Key Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_riverpod` | ^2.6.1 | State management |
| `sqflite_sqlcipher` | ^3.4.0 | Encrypted SQLite |
| `flutter_secure_storage` | ^9.2.4 | EncryptedSharedPreferences |
| `flutter_local_notifications` | ^18.0.1 | Push notifications |
| `in_app_purchase` | ^3.2.0 | Google Play Billing |
| `workmanager` | ^0.9.0 | Background periodic tasks |
| `permission_handler` | ^11.3.1 | Runtime permissions |
| `url_launcher` | ^6.2.5 | Open links / WhatsApp |
| `flutter_contacts` | latest | Contact picker |
| `http` | ^1.2.0 | URL expansion |

## Phase Development History

All GTM phases have been implemented and merged into `main`:

- **Phase 1** (`feature/phase1-onboarding-redesign`) — Role-based onboarding, caregiver/self-protection flows, 9-language translations
- **Phase 2** (`feature/phase2-guardian-alerts`) — `GuardianAlertService`, `WhatsAppIntentHelper.kt`, `SecurityController` + `SmsReceiver.kt` integration
- **Phase 3** (`feature/phase3-subscription`) — `SubscriptionService`, `GuardianPaywallScreen`, `isPremiumProvider`, settings integration
- **Phase 4** (`feature/phase4-heartbeat`) — `HeartbeatService`, `HeartbeatWorker.kt`, `elder_shield/heartbeat` MethodChannel
- **Phase 5** (Caregiver Experience) — Deferred; depends on Phases 1–4 in production
- **Phase 6** (Backend/Analytics) — Future
