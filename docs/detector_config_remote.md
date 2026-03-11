# Remote detector configuration (silent updates)

This document describes how to serve scam-detection rules from a static JSON URL and have the Elder Shield app pick them up **silently**—no app update, no reinstall, and no user prompts.

---

## 1. Goals

- **Silent updates**: Change detection rules (keywords, weights, thresholds) by updating a file on your server. Users get the new behavior on next app launch or after a background refresh—no app store update.
- **No user disturbance**: No dialogs, no “New configuration available” prompts. The app just uses the latest config it has (cached or fetched).
- **Safe fallbacks**: If the network fails or the JSON is invalid, the app keeps using the last good config (or baked-in defaults). Detection never stops working.

---

## 2. Where to host the JSON

Host a single static JSON file over **HTTPS**. No backend logic is required.

| Option | Example URL | Notes |
|--------|-------------|--------|
| Your API server | `https://api.yourdomain.com/config/detector-config.json` | Serve from a static folder or reverse proxy. |
| CDN | `https://cdn.yourdomain.com/elder-shield/detector-config.json` | Cache at edge; minimal latency. |
| S3 + CloudFront | `https://d1234abcd.cloudfront.net/config/detector-config.json` | Upload the file to S3; CloudFront serves it. |
| GCS + Cloud CDN | `https://storage.googleapis.com/your-bucket/config/detector-config.json` | Same idea: bucket + CDN. |
| Firebase Hosting | `https://your-project.web.app/config/detector-config.json` | Put the file in `public/config/`. |

Requirements:

- **HTTPS** (required for production).
- **GET** returns the JSON with a correct `Content-Type` (e.g. `application/json`).
- **No authentication** if you want the app to fetch without user login (config is non-secret rules only).

---

## 3. JSON format

The file must be valid JSON that matches what `DetectorConfig.fromJson()` expects. All fields are optional; missing fields fall back to app defaults.

### Top-level fields

| Field | Type | Description |
|-------|------|-------------|
| `thresholdMedium` | number | Score ≥ this → medium risk (default `0.4`). |
| `thresholdHigh` | number | Score ≥ this → high risk (default `0.7`). |
| `weightShortUrl` | number | Weight for “suspicious/short link” (default `0.25`). |
| `weightOtp` | number | Weight for OTP/verification code (default `0.25`). |
| `weightUrgency` | number | Weight for urgency/fear language (default `0.2`). |
| `weightBankKeyword` | number | Weight for bank/KYC/payment keywords (default `0.2`). |
| `weightSuspectSender` | number | Weight for suspicious sender (default `0.1`). |
| `weightInCallOtpBoost` | number | Extra weight when OTP arrives during call (default `0.35`). |
| `weightPaymentRequest` | number | Weight for “pay now” / payment request (default `0.2`). |
| `weightRewardScam` | number | Weight for lottery/prize scam (default `0.15`). |
| `weightParcelScam` | number | Weight for parcel/delivery scam (default `0.15`). |
| `weightCryptoScam` | number | Weight for crypto investment scam (default `0.15`). |
| `shortUrlDomains` | array of strings | Domains treated as shorteners (e.g. `bit.ly`, `tinyurl.com`). |
| `urgencyKeywords` | array of strings | Phrases that trigger urgency (e.g. `urgent`, `blocked`). |
| `bankKeywords` | array of strings | Bank/KYC/payment terms. |
| `suspectSenderPatterns` | array of strings | Sender name fragments (e.g. `secure`, `alert`). |
| `otpKeywords` | array of strings | OTP/verification phrases. |
| `paymentRequestKeywords` | array of strings | Payment request phrases. |
| `rewardScamKeywords` | array of strings | Prize/lottery phrases. |
| `parcelScamKeywords` | array of strings | Parcel/delivery phrases. |
| `cryptoScamKeywords` | array of strings | Crypto investment phrases. |

You can ship a **minimal** JSON (e.g. only new keywords) and rely on defaults for the rest. You can also add a custom **version** field (e.g. `"configVersion": 2`) for your own tracking; the app ignores unknown keys.

Example minimal override:

```json
{
  "thresholdHigh": 0.65,
  "urgencyKeywords": ["urgent", "immediately", "blocked", "new phrase"]
}
```

Full example: see the default config exported as JSON (e.g. from `DetectorConfig.defaults().toJson()` in the app code).

---

## 4. How the app uses config (current behavior)

1. **On every app startup** (`main()` → `_bootstrapDetectorConfig()`):
   - The app sets **defaults** first: `HeuristicDetector.updateConfig(DetectorConfig.defaults())`.
   - It then reads from **secure storage** (key `detector_config_v1`).
   - If a valid JSON string is found, it parses it and calls `HeuristicDetector.updateConfig(DetectorConfig.fromJson(...))`.
   - If anything fails (missing key, invalid JSON, exception), the app keeps using defaults. No crash, no dialog.

2. **During the session**:
   - All new SMS detection uses whatever config is currently set (defaults or the last applied config).

So today:
- **Writing** to secure storage under `detector_config_v1` (e.g. from a one-off dev tool or a future “fetch from URL” step) is what changes behavior.
- **Reading** from a remote URL is **not** implemented yet. Adding it is the only missing piece for “update by changing a file on the server.”

---

## 5. Silent update flow (with remote fetch)

To support **silent updates from your static URL**, the app should do the following (no UI, no reinstall).

### 5.1 On startup (after bootstrap)

1. **Bootstrap** (already in place):  
   Apply defaults, then apply cached config from secure storage if present.
2. **Background fetch** (to add):
   - In the background (e.g. after a short delay or on a timer), perform:
     - `GET https://your-config-url/detector-config.json`
     - If response is OK and body is valid JSON:
       - Parse with `DetectorConfig.fromJson(...)`.
       - Write the **raw response body** to secure storage under `detector_config_v1`.
       - Call `HeuristicDetector.updateConfig(config)` so the **current session** immediately uses the new config.
     - If network fails or JSON is invalid: do nothing. The app keeps using the config from bootstrap (cached or defaults).

### 5.2 When the user next opens the app

1. Bootstrap runs again: it loads from secure storage.  
2. If a previous fetch had already saved new JSON, that config is applied.  
3. So even if the user never had the app open when the fetch ran, they still get the new rules on **next launch**—no reinstall, no prompt.

### 5.3 Optional: refresh only when needed

- Store a **config version** or use the **ETag** header: only overwrite cache when the server’s version/ETag is different. This avoids unnecessary writes and applies.
- Or refresh on a **schedule** (e.g. once per day when the app is used) so updates are picked up within a day.

---

## 6. Operator guide: how to update config in production

1. **Edit your JSON** (add/remove keywords, change weights or thresholds).  
2. **Validate** it (e.g. paste into a JSON validator; or run a quick test that calls `DetectorConfig.fromJson()` on the parsed map).  
3. **Upload / deploy** the file to the same URL the app uses (e.g. replace `detector-config.json` on S3, or update the file in your `public/config/` and deploy).  
4. **No app release needed.**  
   - Devices that already have the app will:
     - Get the new config on their **next background fetch** (if you implement it), or  
     - Load the new config on **next app launch** after a fetch has run and saved to storage.  
5. **No user action.** Users are not notified; detection just uses the new rules.

---

## 7. Safety and validation

- **Always set defaults first** (already done in bootstrap). If fetch or cache is missing/bad, the app keeps working.  
- **Validate after parse**: only call `HeuristicDetector.updateConfig(config)` and write to storage if `DetectorConfig.fromJson(...)` succeeds. Discard invalid JSON.  
- **No sensitive data**: the config contains only rules and keywords. It can be public-read over HTTPS.  
- **HTTPS only**: use a URL with `https://` so the download is not tampered with in transit.

---

## 8. What is implemented vs what to add

| Piece | Status |
|-------|--------|
| Config model and JSON parsing | Done (`DetectorConfig.fromJson` / `toJson`). |
| Bootstrap: defaults → load from secure storage | Done (`_bootstrapDetectorConfig` in `main.dart`). |
| Apply config to detector | Done (`HeuristicDetector.updateConfig`). |
| **Fetch config from a static URL** | **Not implemented.** Add a single HTTP GET (e.g. with `package:http`), then save response body to secure storage and call `updateConfig`. |
| **Trigger fetch (e.g. after startup or periodically)** | **Not implemented.** Call the fetch from app startup (after bootstrap) and/or on a timer; keep it in the background with no UI. |

Once the fetch + store + `updateConfig` path is added, the rest of this document describes exactly how silent updates work: you update the file on the server, and the app picks it up without reinstall and without disturbing the user.
