# Keystore Renewal

Run this when the current certificate expires (valid until **15 Apr 2026**).

## Step 1 — Delete the old keystore

```bash
rm android/app/elder-shield.jks
```

## Step 2 — Generate a new one

```bash
keytool -genkey -v \
  -keystore android/app/elder-shield.jks \
  -alias elder-shield-key \
  -keyalg RSA \
  -keysize 2048 \
  -validity 30 \
  -storepass 'eldershield101@#$' \
  -keypass 'eldershield101@#$' \
  -dname "CN=Sagnik Das, OU=Elder Shield, O=Elder Shield, L=Unknown, S=Unknown, C=IN"
```

Change `-validity 30` to however many days you need (e.g. `365` for one year).

## Step 3 — Confirm the new expiry date

```bash
keytool -list -v \
  -keystore android/app/elder-shield.jks \
  -storepass 'eldershield101@#$' \
  | grep -E "Alias|Owner|Valid|until"
```

## Step 4 — Rebuild the APK

```bash
flutter build apk --release --split-per-abi --target-platform android-arm64
```

The signed APK will be at:
`build/app/outputs/flutter-apk/app-arm64-v8a-release.apk`
