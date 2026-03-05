# Elder Shield — Permission Disclosures

Use this for **Play Console declarations** and to keep **in-app permission text** accurate. Every claim here matches the current implementation.

---

## 1. Declarations for Google Play

When declaring sensitive permissions in the Play Console, you can use the following.

### 1.1 SMS (RECEIVE_SMS, READ_SMS)

- **Permission type:** SMS
- **Declared use:** Elder Shield’s core function is to protect users from SMS-based scams. We need to **receive** and **read** incoming SMS messages so we can:
  - Analyse them on-device for scam indicators (e.g. suspicious links, OTP phishing, urgency or bank-related wording).
  - Show the user a risk level and reasons, and send a local notification for medium- or high-risk messages.
- **Scope:** Only incoming SMS; no sending of SMS by the app except that the user can open the system SMS app to block a sender. No SMS content is sent off-device. No use for marketing, ads, or analytics.
- **User control:** User can deny the permission; protection is then limited. User can delete all analysed message history from Settings.

### 1.2 Phone (READ_PHONE_STATE)

- **Permission type:** Phone
- **Declared use:** We need to know **when the user is on a phone call** (e.g. ringing or in-call) so we can:
  - Raise the risk level when an OTP or verification-style SMS arrives during a call (a common social-engineering scam pattern).
- **Scope:** We do **not** read phone numbers from the call, record audio, or access call logs. We only observe “on a call” vs “not on a call.”
- **User control:** User can deny; scam detection still works but without the “OTP during call” boost.

### 1.3 Phone (CALL_PHONE)

- **Permission type:** Phone
- **Declared use:** So the user can tap **“Call trusted contact”** from the Home screen or from a scam warning. The app starts a phone call only to numbers the user has explicitly added as trusted contacts.
- **Scope:** Initiate outbound calls only when the user taps the button; no automatic or background calling.
- **User control:** User chooses which contacts to add; they can remove them anytime in Settings.

### 1.4 Notifications (POST_NOTIFICATIONS, Android 13+)

- **Permission type:** Notifications
- **Declared use:** To show **local scam alerts** when we detect a suspicious or high-risk SMS (e.g. “Suspicious message” or “Warning: Possible scam message”), so the user can act quickly.
- **Scope:** Only for our own alert notifications; no promotional or third-party notifications.
- **User control:** User can revoke notification permission in system settings; they will not see our alerts but can still open the app and use Messages and Settings.

---

## 2. In-app pre-permission text (must match)

The app shows the following **before** requesting permissions (onboarding and, if needed, Settings → Re-run permissions):

- **Messages:**  
  *“Messages: so we can read your texts and warn you if one looks like a scam.”*

- **Phone:**  
  *“Phone: so we know when you are on a call. Scammers often ask for OTPs while you are on the phone.”*

- **What happens when they tap “Allow permissions”:**  
  The next screen or button copy should make clear that the system will ask for **Messages** first, then **Phone** (and on Android 13+, **Notifications** when we first show an alert, if applicable). See Block 9 in-app disclosure addition.

These bullets must stay in sync with this document and the [privacy policy draft](privacy_policy_draft.md).

---

## 3. Manifest vs disclosure cross-check

| Manifest item | Purpose (manifest comment / code) | In permission_disclosures.md? | In privacy_policy_draft.md? | Mismatch? |
|---------------|-----------------------------------|------------------------------|-----------------------------|-----------|
| RECEIVE_SMS | Receive incoming SMS for scam detection | Yes (§1.1) | Yes (§4) | No |
| READ_SMS | Read SMS content for analysis | Yes (§1.1) | Yes (§4) | No |
| READ_PHONE_STATE | Call state for OTP-during-call detection | Yes (§1.2) | Yes (§4) | No |
| CALL_PHONE | One-tap call to trusted contact | Yes (§1.3) | Yes (§4) | No |
| POST_NOTIFICATIONS | Scam alert notifications (Android 13+) | Yes (§1.4) | Yes (§4) | No |
| &lt;queries&gt; PROCESS_TEXT | Not used by app in current code | N/A | N/A | **Optional:** Remove from manifest if not used to reduce declaration surface. |
| &lt;queries&gt; tel | url_launcher: start phone call | Implied by CALL_PHONE use | Implied | No |
| &lt;queries&gt; sms | url_launcher: open SMS app for “Block sender” | Yes (§2 / policy) | Yes (privacy policy §4) | No |

### Fixes applied in Block 9

- Core permissions: all aligned with privacy policy and in-app text.
- **In-app:** Added line before permission button: “When you tap ‘Allow Permissions’ below, your device will ask for: Messages first, then Phone.”
- **Privacy policy:** Added sentence that we may open the device’s messaging app for “Block sender” only; we do not send SMS ourselves.
- **Optional before release:** Remove `<queries>` PROCESS_TEXT from the manifest if the app does not use the “Process text” feature.

---

*Last updated: Block 9. Re-check when adding or removing permissions or features.*
