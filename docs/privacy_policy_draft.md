# Elder Shield — Privacy Policy (Draft)

*This draft matches the app’s implemented behaviour as of Block 10. The same text is shown in-app (Settings → Privacy policy). Update before publishing.*

---

## 1. Who we are

Elder Shield is an Android app that helps protect elderly users from SMS- and call-related scams by analysing messages on the device and warning when something looks suspicious.

---

## 2. Data we process

All processing happens **on your device**. We do not send your messages, call state, or any other personal data to our servers or to any third party.

### 2.1 Message data

- When you receive an SMS, the app reads the **sender**, **message body**, and **timestamp**.
- This data is used only to run our on-device scam detection (e.g. suspicious links, OTP-style text, urgency or bank-related wording).
- Results (risk score, reasons, and your optional “scam” or “safe” labels) are stored **only on your device** in a local database. You can delete all of this at any time from Settings → Delete all history.

### 2.2 Call state

- The app checks whether you are **on a phone call** (e.g. ringing or in a call). We do **not** record calls, listen to audio, or access your call log.
- Call state is used only to improve detection (e.g. warning you when an OTP arrives while you’re on a call, which is a common scam pattern).

### 2.3 Settings and trusted contacts

- Settings such as “onboarding complete,” “sensitivity mode,” and your **trusted contact names and phone numbers** are stored **only on your device** in secure storage.
- Trusted contacts are used only so you can tap “Call trusted contact” from the app. We do not call or message them automatically; the app only starts a call when you tap the button.

---

## 3. What we do not do

- We do **not** send your SMS content, call state, or contact list to the internet.
- We do **not** sell, rent, or share your data with advertisers or data brokers.
- We do **not** require an account or sign-in. The app works fully offline (after permissions are granted).
- We do **not** read or analyse RCS/chat messages; only standard SMS is supported.

---

## 4. Permissions and why we need them

| Permission | Purpose |
|------------|--------|
| **SMS (receive / read)** | To receive and read incoming SMS so we can analyse them for scam patterns and show you warnings. |
| **Phone (read phone state)** | To know when you’re on a call, so we can flag higher risk when an OTP arrives during a call. We do not record or listen to calls. |
| **Phone (make calls)** | So you can tap “Call trusted contact” and the app can start the call. We only call numbers you have added as trusted contacts. |
| **Notifications** | To show you alerts when we detect a suspicious or high-risk message, so you can act quickly. |

The app may also open your device’s messaging app when you choose “Block this sender” so you can block the number there; the app does not send SMS itself. These uses are explained in the app before we ask for permission, and are documented in our [Permission disclosures](permission_disclosures.md).

---

## 5. Data retention and your choices

- **Analyzed messages and reasons:** Kept only on your device until you choose **Settings → Delete all history**. Deleting removes all stored messages and reasons.
- **Settings and trusted contacts:** Stored on your device until you change or remove them, or uninstall the app.
- We do not retain any copy of your data on our servers because we do not collect it.

---

## 6. Children and sensitive users

The app is intended to help elderly and other vulnerable users avoid scams. We do not knowingly collect data from children in a way that would require parental consent; the app does not send data off-device. If you are a caregiver setting up the app for someone else, we recommend explaining the permissions and this policy to them.

---

## 7. Changes to this policy

If we change this policy (for example, if we add optional cloud features in a future version), we will update this document and, where required by law or store policy, notify you or ask for consent.

---

## 8. Contact

For privacy-related questions or requests about Elder Shield, please contact [sagnikd91@gmail.com].

---

*Last updated: Block 10 — In-app privacy. Replace placeholders before release.*
