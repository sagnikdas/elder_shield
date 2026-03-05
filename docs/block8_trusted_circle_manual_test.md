# Block 8 — Trusted Circle: Manual Test Flow

Use this to verify trusted contacts CRUD, one-tap call, and consent behaviour.

---

## Prerequisites

- App installed on a physical Android device.
- SMS and Phone permissions granted.
- Onboarding completed (or skip to Home).

---

## 1. Add trusted contact (onboarding)

- If you reset app data and go through onboarding again:
  - On **Add a trusted contact** screen, confirm the consent text:  
    *"By adding them, you can call this person with one tap from the Home screen or when we show a scam warning."*
  - Enter **Name** (e.g. My son) and **Phone number** (e.g. +91 98765 43210).
  - Tap **Done** → should land on Home with **"Call [Name]"** visible.
- **Skip for now** → should still land on Home; **"Add a trusted contact"** card shown.

---

## 2. Add / Edit / Remove (Settings)

- Open **Settings** tab.
- Under **Trusted contacts**, confirm the short explanation:  
  *"You can call them with one tap from Home or when we show a scam warning. First in the list is used for the main Call button."*
- **Add contact**: Tap **Add contact** → dialog shows consent line → enter name + number → **Add**. Contact appears in list; first contact has a star (primary).
- **Edit contact**: Tap a contact row or the edit (pencil) icon → dialog pre-filled → change name/number → **Save**. List updates.
- **Remove contact**: Tap remove (minus) icon → contact removed. If it was the only one, Home shows **"Add a trusted contact"** again.
- Add up to 3 contacts; **Add contact** hides when list has 3.

---

## 3. One-tap call from Home

- With at least one trusted contact, on **Home** tap the large **"Call [Trusted Contact Name]"** (or **"Call Trusted Contact"** if name empty).
- Device should start a call to that number (no in-app UI needed beyond the button).

---

## 4. One-tap call from warning sheets

- **Risk Detail** (Messages → tap a message): Sheet shows **"Call [Trusted Contact]"** (or **"Call Trusted Contact"**). Tap → call starts.
- **High-risk warning sheet** (when a high-risk SMS triggers the in-app alert): Same **"Call [Trusted Contact]"** button → tap → call starts.
- With **no** trusted contact, the Call button is not shown on these sheets.

---

## 5. Local storage

- Add or edit a contact in Settings → go to Home → kill and reopen app.
- Trusted contacts list and primary (first) contact should be unchanged; **"Call [Name]"** still correct on Home.

---

## Pass criteria

- Consent text visible when adding a contact (onboarding and Settings).
- CRUD: Add (up to 3), Edit, Remove work; list persists after restart.
- First contact is primary (star in Settings; used for Home and sheets).
- One-tap call works from Home, Risk Detail, and High-Risk Warning sheet when a contact exists.
