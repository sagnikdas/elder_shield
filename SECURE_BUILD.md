# Secure APK build and sharing

This document describes how to build and share a release APK with security hardening so the app is harder to reverse-engineer.

## What we protect against

- **Dart/app logic**: Obfuscation renames classes and methods so decompiled code is hard to read and follow.
- **Java/Kotlin (Android)**: R8 minification and shrinking remove unused code and obfuscate the rest.
- **Debug symbols**: Stripped from the APK and saved separately so they are not shipped.

**Important:** A determined person can still disassemble and analyze the app. The goal is to make casual reverse engineering and copying of your logic much harder, not to make it impossible. Never put secrets (API keys, passwords) in the app; assume anything in the APK can be extracted.

---

## 1. Build a secure APK

From the project root, either run the script or the Flutter command directly.

**Option A – script (recommended):**
```bash
chmod +x scripts/build_secure_apk.sh
./scripts/build_secure_apk.sh
```

**Option B – manual:**
```bash
flutter build apk --release \
  --obfuscate \
  --split-debug-info=build/symbols \
  --target-platform android-arm64
```

Output APK: `build/app/outputs/flutter-apk/app-release.apk`

- `--obfuscate`: Obfuscates Dart code (renames symbols).
- `--split-debug-info=build/symbols`: Puts symbol maps in `build/symbols/` and **does not** put them in the APK. You need these only to decode release stack traces.
- `--target-platform android-arm64`: Builds one ABI (smaller APK; fine for most phones).

**Keep `build/symbols/` private.** Do not commit or share it. It is already in `.gitignore`. Without it, you cannot symbolicate crash reports for this build.

---

## 2. Android-side hardening (already enabled)

In `android/app/build.gradle.kts`, release builds use:

- **R8 minification** (`isMinifyEnabled = true`): Shrinks and obfuscates Java/Kotlin code.
- **Resource shrinking** (`isShrinkResources = true`): Removes unused resources.
- **ProGuard rules** (`proguard-rules.pro`): Keeps Flutter embedding and plugins working; everything else can be obfuscated.

If a plugin breaks after enabling this, add the required `-keep` rules to `android/app/proguard-rules.pro` (see the plugin’s docs or R8 error output).

---

## 3. Signing (for production / sharing with others)

Right now the release APK is signed with the **debug** keystore so `flutter run --release` works. For sharing with friends or publishing:

1. Create a **release keystore** (one-time, keep it safe and backed up):
   ```bash
   keytool -genkey -v -keystore android/app/release.keystore -alias elder-shield -keyalg RSA -keysize 2048 -validity 10000
   ```
2. Configure `android/app/build.gradle.kts` to use it in `release` (e.g. `signingConfigs.release` with `storeFile`, `storePassword`, `keyAlias`, `keyPassword`). Do not commit passwords; use env vars or a local properties file listed in `.gitignore`.
3. Build as above; the APK will be signed with your release key so recipients can verify it’s from you.

---

## 4. Sharing the APK safely

- **Share the file securely:** Use a private link (e.g. Google Drive, Dropbox, or a link with expiry) rather than public uploads.
- **Do not share:** The APK only. Do **not** share `build/symbols/`, your keystore, or keystore passwords.
- **No secrets in the app:** Assume the APK can be decompiled. Use backend or environment-based secrets, not keys hardcoded in the app.

---

## 5. If you need to decode a crash from this build

Use the symbol files from the **exact same** build that produced the APK:

```bash
flutter symbolize -d build/symbols -i <stack_trace_file>
```

So keep a copy of `build/symbols/` for each version you distribute, stored somewhere private and secure.
