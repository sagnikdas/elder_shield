# Elder Shield

**On-device SMS scam protection for elderly users.**

Elder Shield analyzes every incoming SMS in real time, flags suspicious messages before the user reads them, and provides one-tap actions to stay safe — all without sending a single byte of message content off the device.

---

## Why

Phone scams disproportionately target older adults. The most common patterns — fake OTPs, KYC threats, parcel delivery frauds, prize claims — share recognizable textual fingerprints. Elder Shield catches these patterns locally, with no account, no subscription, and no cloud dependency.

---

## Features

### Detection
- **On-device heuristic analysis** — Scores each SMS against weighted signals: short URLs, OTP phrases, urgency language, bank/KYC keywords, payment requests, reward scams, parcel fraud, crypto bait, and suspect sender IDs.
- **Call-state boost** — If an OTP SMS arrives while the user is on a phone call (a classic social-engineering pattern), the risk score is automatically increased.
- **Three risk bands** — Low, Medium, and High, with configurable thresholds via a Sensitivity Mode setting (Conservative / Balanced / Sensitive).
- **Trusted-sender whitelist** — Senders manually trusted by the user are silently skipped; no alert, no DB entry.
- **Feedback-based suppression** — If the user has previously marked a sender as safe, future messages from that sender are analysed and saved but do not trigger alerts.

### Alerts
- **Real-time warning sheet** — A full-height bottom sheet for high-risk messages with plain-English reasons, one-tap feedback, and a trusted-contact call button.
- **Local notification** — Medium and high-risk messages post a heads-up notification while the app is in the foreground.
- **Background & killed-app detection** — A native Kotlin `BroadcastReceiver` runs a lightweight heuristic check even when the app is not running, showing a full-screen notification and system overlay for high-confidence matches.

### Safety tools
- **URL expansion** — Tapping any link in a flagged message opens a preview sheet that follows redirects and shows the true destination before anything is launched.
- **Trusted contacts** — Store up to three emergency contacts; a large "Call" button appears on the home screen and every warning sheet.
- **One-tap feedback** — Mark any message as a scam or safe directly from the warning sheet or history view; "Trust this sender" adds them to the whitelist in one step.

### Privacy & storage
- **Fully on-device** — No message content, sender information, or analysis results ever leave the device.
- **Encrypted SQLite** — Message history is stored in a SQLCipher-encrypted database using a per-device 256-bit key held in the Android system keystore.
- **Encrypted settings** — All user preferences and the trusted-sender list are stored in Android `EncryptedSharedPreferences` via `flutter_secure_storage`.
- **No account required** — The app works completely offline and without registration.

### Internationalisation
Supports **9 languages** out of the box: English, Hindi, Bengali, Telugu, Tamil, Kannada, Malayalam, Urdu, and Assamese. Language can be switched in-app without a restart.

---

## Architecture

```
elder_shield/
├── lib/
│   ├── domain/detector/        # HeuristicDetector, DetectorConfig (pure Dart)
│   ├── data/                   # AppDatabase (SQLCipher), MessageRepository
│   ├── features/
│   │   ├── security/           # SecurityController — event loop, scoring, alerting
│   │   ├── settings/           # SettingsService, SettingsController
│   │   └── messages/           # MessagesController, MessageRepository
│   ├── platform/               # NativeEventStream, WhitelistChannel, OverlayAlerts
│   ├── services/               # NotificationService, UrlExpander
│   ├── presentation/           # Screens and sheets
│   └── l10n/                   # ARB files + generated localisations
└── android/app/src/main/kotlin/
    ├── SmsReceiver.kt           # BroadcastReceiver — background SMS entry point
    ├── SimpleRiskCheck.kt       # Lightweight native heuristic (app-killed path)
    ├── CallStateListener.kt     # TelephonyCallback (API 31+) / PhoneStateListener
    ├── SmsEventEmitter.kt       # EventChannel sink
    ├── ScamOverlayService.kt    # System overlay for background alerts
    └── MainActivity.kt          # Channel registration
```

**State management:** Riverpod
**Navigation:** go_router
**Database:** sqflite_sqlcipher
**Local notifications:** flutter_local_notifications
**Secure storage:** flutter_secure_storage

---

## How detection works

Each SMS body is scored against a set of weighted signals that combine to a value between 0 and 1:

| Signal | Default weight |
|--------|---------------|
| Short / suspicious URL | 0.25 |
| OTP phrase or digit code | 0.25 |
| Urgency language | 0.20 |
| Bank / KYC keywords | 0.20 |
| Payment request language | 0.20 |
| Reward / lottery scam | 0.15 |
| Parcel delivery fraud | 0.15 |
| Crypto investment bait | 0.15 |
| Suspect sender ID | 0.10 |
| OTP-while-on-call boost | +0.35 |

Scores below 0.4 → **Low** (no alert). 0.4–0.7 → **Medium** (notification). Above 0.7 → **High** (full warning sheet + notification).

Thresholds and keyword lists are configurable via a remote JSON file (`config/detector-config.json`) served from this repository. The app fetches updates in the background on each launch; the baked-in defaults are always the fallback.

---

## Building

**Requirements**

- Flutter 3.x (`flutter --version`)
- Android SDK with API 35
- Java 17

```bash
# Clone
git clone https://github.com/sagnikdas/eproj_sms.git
cd eproj_sms

# Install dependencies
flutter pub get

# Debug build
flutter run

# Release build (requires a keystore — see SECURE_BUILD.md)
flutter build apk --release
```

---

## Permissions

| Permission | Why |
|---|---|
| `RECEIVE_SMS` / `READ_SMS` | Analyse incoming messages |
| `READ_PHONE_STATE` | Detect active call for OTP-during-call scoring |
| `CALL_PHONE` | One-tap emergency call to trusted contact |
| `POST_NOTIFICATIONS` | Show risk alerts (Android 13+) |
| `SYSTEM_ALERT_WINDOW` | Background overlay when app is killed |
| `USE_FULL_SCREEN_INTENT` | Full-screen alert for high-risk messages |
| `READ_CONTACTS` | Pick trusted contacts during onboarding |

The app does **not** request internet permission for any user data. The only outbound network call is a background fetch of `detector-config.json` from this repository.

---

## Remote config

Detection weights and keyword lists can be updated without a Play Store release by editing `config/detector-config.json`. The app downloads this file silently in the background on launch and caches it in encrypted storage. If the fetch fails for any reason the baked-in defaults take over.

---

## Disclaimer

Elder Shield is a best-effort heuristic tool. It will not catch every scam and will occasionally flag legitimate messages. It is not a substitute for user judgement, law enforcement, or bank fraud teams. Never share OTPs, account details, or PINs with anyone — no legitimate organisation will ask for them over SMS.

---

## License

MIT
