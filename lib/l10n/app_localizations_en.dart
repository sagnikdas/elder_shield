// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Elder Shield';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get homeAppBarTitle => 'Elder Shield';

  @override
  String get homePostOnboardingTitle => 'You\'re protected';

  @override
  String homePostOnboardingBody(String contactName) {
    return 'From Home you can call $contactName anytime.';
  }

  @override
  String get commonGotIt => 'Got it';

  @override
  String get homeTrustedContactFallbackName => 'your trusted contact';

  @override
  String get permissionsDialogTitle => 'Enable protection in Settings';

  @override
  String get permissionsDialogBody => 'Elder Shield needs SMS and Phone access to check your messages for scams.\n\nOpen app settings to turn these permissions on?';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get permissionsDialogOpenSettings => 'Open settings';

  @override
  String get homeProtectionStatusLabel => 'Protection status';

  @override
  String get homeProtectionStatusProtected => 'Protected';

  @override
  String get homeProtectionStatusPermissionsNeeded => 'Permissions needed';

  @override
  String get homeEnableProtectionButton => 'Enable protection';

  @override
  String homeTodayRiskSummaryWithCount(int count) {
    return '$count suspicious message(s) detected today.';
  }

  @override
  String get homeTodayRiskSummaryNoRisk => 'No suspicious activity today.';

  @override
  String get homeTodayRiskTapToSeeMessages => 'Tap to see messages';

  @override
  String get commonView => 'View';

  @override
  String get homeAutoCheckInfo => 'Elder Shield checks new messages automatically.';

  @override
  String homeCallTrustedButtonLabel(String name) {
    return 'Call $name';
  }

  @override
  String get homeCallTooltipText => 'Tap here anytime you get a worrying message.';

  @override
  String get homeAddTrustedIntro => 'Add a trusted contact so you can call them quickly if you get a scary message.';

  @override
  String get homeAddTrustedButton => 'Add a trusted contact';

  @override
  String get homeWhyAddTrustedShow => 'Why add a trusted contact?';

  @override
  String get homeWhyAddTrustedHide => 'Hide why';

  @override
  String get homeWhyAddTrustedExplanation => 'If you ever get a worrying message, you can tap one big button to call someone you trust instead of guessing what to do alone.';

  @override
  String get homeTrustedContactsHeader => 'Your trusted contacts';

  @override
  String get highRiskHeaderTitle => 'Danger: possible scam message';

  @override
  String get highRiskHeaderBody => 'Do not tap any links or share codes from this message.';

  @override
  String get highRiskWhyFlaggedTitle => 'Why this was flagged:';

  @override
  String get actionScam => 'This is a Scam';

  @override
  String get actionSafe => 'This is Safe';

  @override
  String get actionTrustSender => 'Trust this sender';

  @override
  String get snackbarGenericError => 'Something went wrong. Try again.';

  @override
  String get snackbarMarkedScam => 'Marked as scam. Thank you.';

  @override
  String get snackbarSenderTrusted => 'Sender trusted — no more alerts from them.';

  @override
  String get settingsTrustedSendersTitle => 'Trusted Senders';

  @override
  String get settingsTrustedSendersNone => 'No trusted senders';

  @override
  String settingsTrustedSendersCount(int count) {
    return '$count trusted sender(s)';
  }

  @override
  String get settingsTrustedSendersExplanation => 'These senders will not trigger any alerts. Tap \'Trust this sender\' on a warning to add them here.';

  @override
  String get settingsTrustedSendersRemoveDialogTitle => 'Remove trusted sender?';

  @override
  String get settingsTrustedSendersRemoveDialogBody => 'Alerts will be shown again for messages from this sender.';

  @override
  String get settingsTrustedSendersRemoveDialogRemove => 'Remove';

  @override
  String get highRiskSwipeUpForDetails => 'Swipe up for more details';

  @override
  String get riskLowLabel => 'Low risk';

  @override
  String get riskMediumLabel => 'Medium risk — review';

  @override
  String get riskHighLabel => 'High risk — possible scam';

  @override
  String get deleteMessageTitle => 'Delete message?';

  @override
  String get deleteMessageBody => 'Are you sure? This will remove the message from Elder Shield.';

  @override
  String get deleteMessageConfirm => 'Delete';

  @override
  String get deleteMessageDeletedSnackbar => 'Removed from Elder Shield.';

  @override
  String get languageSectionTitle => 'Language';

  @override
  String get languageEnglishName => 'English';

  @override
  String get languageBengaliName => 'Bengali';

  @override
  String get languageKannadaName => 'Kannada';

  @override
  String get languageHindiName => 'Hindi';

  @override
  String get languageUrduName => 'Urdu';

  @override
  String get languageAssameseName => 'Assamese';

  @override
  String get languageTamilName => 'Tamil';

  @override
  String get languageMalayalamName => 'Malayalam';

  @override
  String get languageTeluguName => 'Telugu';

  @override
  String languageSectionSubtitle(String languageName) {
    return 'Current: $languageName';
  }

  @override
  String get snackbarUpdated => 'Updated';

  @override
  String get settingsAppearanceTitle => 'Appearance';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsTextSizeTitle => 'Text size';

  @override
  String get settingsTextSizeDescription => 'Adjust to see text larger or smaller. Changes apply immediately.';

  @override
  String get settingsTextSizeSample => 'Elder Shield keeps you safe from scam messages.';

  @override
  String get settingsLegalTitle => 'Legal & information';

  @override
  String get settingsPrivacyPolicyTitle => 'Privacy policy';

  @override
  String get settingsPrivacyPolicySubtitle => 'How we use your data';

  @override
  String get settingsPermissionsExplainedTitle => 'Permissions explained';

  @override
  String get settingsPermissionsExplainedSubtitle => 'Why we need each permission';

  @override
  String get settingsSensitivityTitle => 'Sensitivity';

  @override
  String get settingsSensitivityLabelConservative => 'Fewer alerts';

  @override
  String get settingsSensitivityLabelBalanced => 'Balanced';

  @override
  String get settingsSensitivityLabelSensitive => 'More alerts';

  @override
  String get settingsSensitivityDescConservative => 'Only very obvious scams. Good if you prefer fewer alerts.';

  @override
  String get settingsSensitivityDescBalanced => 'Good for most people. A balance of scams caught and noise.';

  @override
  String get settingsSensitivityDescSensitive => 'Catches more scams but may sometimes flag safe messages.';

  @override
  String get settingsTrustedContactsTitle => 'Trusted contacts';

  @override
  String get settingsTrustedContactsNone => 'None';

  @override
  String settingsTrustedContactsCount(int count) {
    return '$count contact(s)';
  }

  @override
  String get settingsTrustedContactsExplanation => 'You can call them with one tap from Home or when we show a scam warning. First in the list is used for the main \"Call\" button.';

  @override
  String get settingsTrustedContactsAddContactTitle => 'Add contact';

  @override
  String get settingsTrustedContactsAddContactSubtitle => 'Type a name and phone number';

  @override
  String get settingsTrustedContactsChooseFromContactsTitle => 'Choose from contacts';

  @override
  String get settingsTrustedContactsChooseFromContactsSubtitle => 'Pick a number from your phone';

  @override
  String get settingsTrustedContactsPickerUnavailable => 'Device contact picker is not available yet on this preview build.';

  @override
  String get settingsTrustedContactsRemoveDialogTitle => 'Remove trusted contact?';

  @override
  String get settingsTrustedContactsRemoveDialogBody => 'This person will no longer appear in your trusted contacts or on the Home screen.';

  @override
  String get settingsTrustedContactsRemoveDialogRemove => 'Remove';

  @override
  String get settingsAdvancedSectionTitle => 'Advanced';

  @override
  String get settingsDeleteAllHistoryButton => 'Delete all history';

  @override
  String get settingsRerunPermissionsButton => 'Re-run permissions check';

  @override
  String get settingsDeleteAllHistoryDialogTitle => 'Delete all history?';

  @override
  String get settingsDeleteAllHistoryDialogBody => 'This will permanently delete all analyzed messages and reasons from this device. You cannot undo this.';

  @override
  String get settingsDeleteAllHistoryDialogConfirm => 'Delete all';

  @override
  String get settingsHistoryDeletedSnackbar => 'History deleted';

  @override
  String get settingsRerunPermissionsSnackbar => 'Permission check done. Restart the app if you just granted access.';

  @override
  String get settingsOverlayTitle => 'Emergency pop-up over other apps';

  @override
  String get settingsOverlaySubtitleEnabled => 'Enabled: high-risk warnings can appear above other apps. Recommended so we can warn you even when you’re in another app.';

  @override
  String get settingsOverlaySubtitleDisabled => 'Off: tap to enable the Android overlay permission. Recommended so we can warn you even when you’re in another app.';

  @override
  String get settingsHowItWorksTitle => 'How Elder Shield works';

  @override
  String get settingsHowItWorksSubtitle => 'What we check, when we alert, what to do';

  @override
  String get settingsAboutTitle => 'About Elder Shield';

  @override
  String get settingsAddTrustedDialogTitle => 'Add trusted contact';

  @override
  String get settingsAddTrustedDialogConsent => 'They can be called with one tap from Home or when we show a scam warning.';

  @override
  String get settingsAddTrustedDialogConfirm => 'Add';

  @override
  String get settingsEditTrustedDialogTitle => 'Edit trusted contact';

  @override
  String get settingsEditTrustedDialogConfirm => 'Save';

  @override
  String get settingsContactNameLabel => 'Name';

  @override
  String get settingsContactNameHint => 'e.g. My son';

  @override
  String get settingsContactNumberLabel => 'Phone number';

  @override
  String get settingsContactNumberHint => 'e.g. +91 98765 43210';

  @override
  String get settingsContactDialogCancel => 'Cancel';

  @override
  String get settingsContactInvalidNumber => 'Enter a valid phone number';

  @override
  String get howItWorksBulletWhatWeCheck => 'What we check: We read your SMS and look for signs of scams — suspicious links, urgent language, requests for OTP or bank details, and messages that pretend to be your bank or a known service.';

  @override
  String get howItWorksBulletWhenWeAlert => 'When we alert: If a message looks risky, we notify you. For high-risk messages we can show a pop-up even when the app is in the background, and list the message on the Messages tab.';

  @override
  String get howItWorksBulletWhatToDo => 'What to do when you see a warning: Don’t tap any link in the message. You can mark it as \"This is a Scam\" or \"This is Safe\" to help us learn. Best step: call your trusted contact from the warning screen or from Home.';

  @override
  String get howItWorksBulletCallTrusted => 'How to call your trusted contact: On the Home screen, tap the big \"Call [Name]\" button anytime — especially if you get a worrying message. You can also call from the warning screen when we show a possible scam.';

  @override
  String get howItWorksSeeWarningCta => 'See what a warning looks like';

  @override
  String get permissionsIntro => 'Elder Shield only uses permissions for scam protection. You can deny any permission; protection will be limited but the app still works.';

  @override
  String get permissionsSmsTitle => 'Messages (SMS)';

  @override
  String get permissionsSmsBody => 'We receive and read incoming SMS so we can analyse them for scam indicators (e.g. suspicious links, OTP phishing, bank-related wording) and show you warnings. No message content is sent off your device. You can delete all analysed history from Settings.';

  @override
  String get permissionsPhoneStateTitle => 'Phone (read state)';

  @override
  String get permissionsPhoneStateBody => 'We need to know when you\'re on a call so we can raise the risk level when an OTP arrives during a call (a common scam pattern). We do not record calls, listen to audio, or access your call log.';

  @override
  String get permissionsPhoneCallTitle => 'Phone (make calls)';

  @override
  String get permissionsPhoneCallBody => 'So you can tap \"Call trusted contact\" from Home or a warning. The app only starts a call when you tap the button, and only to numbers you have added as trusted contacts.';

  @override
  String get permissionsNotificationsTitle => 'Notifications';

  @override
  String get permissionsNotificationsBody => 'To show you alerts when we detect a suspicious or high-risk message, so you can act quickly. You can turn off notifications in system settings; you will still be able to use the app.';

  @override
  String get permissionsOverlayTitle => 'Draw over other apps (optional)';

  @override
  String get permissionsOverlayBody => 'If you enable the Android overlay permission in Settings, Elder Shield can show an emergency warning above other apps when a high-risk message arrives. This is optional and intended for personal-use safety setups.';

  @override
  String get privacyTitle => 'Privacy Policy';

  @override
  String get privacySection1Title => '1. Who we are';

  @override
  String get privacySection1Body => 'Elder Shield is an Android app that helps protect elderly users from SMS- and call-related scams by analysing messages on the device and warning when something looks suspicious.';

  @override
  String get privacySection2Title => '2. Data we process';

  @override
  String get privacySection2Paragraphs => 'All processing happens on your device. We do not send your messages, call state, or any other personal data to our servers or to any third party.\n\nMessage data: When you receive an SMS, the app reads the sender, message body, and timestamp. This data is used only to run our on-device scam detection. Results are stored only on your device. You can delete all of this at any time from Settings → Delete all history.\n\nCall state: The app checks whether you\'re on a phone call. We do not record calls, listen to audio, or access your call log. Call state is used only to improve detection (e.g. warning when an OTP arrives during a call).\n\nSettings and trusted contacts: Stored only on your device in secure storage. Trusted contacts are used only so you can tap \"Call trusted contact\". We do not call or message them automatically.';

  @override
  String get privacySection3Title => '3. What we do not do';

  @override
  String get privacySection3Paragraphs => 'We do not send your SMS content, call state, or contact list to the internet.\n\nWe do not sell, rent, or share your data with advertisers or data brokers.\n\nWe do not require an account or sign-in. The app works fully offline after permissions are granted.\n\nWe do not read or analyse RCS/chat messages; only standard SMS is supported.';

  @override
  String get privacySection4Title => '4. Permissions and why we need them';

  @override
  String get privacySection4Paragraphs => 'SMS (receive/read): To receive and read incoming SMS so we can analyse them for scam patterns and show you warnings.\n\nPhone (read phone state): To know when you\'re on a call, so we can flag higher risk when an OTP arrives during a call. We do not record or listen to calls.\n\nPhone (make calls): So you can tap \"Call trusted contact\". We only call numbers you have added as trusted contacts.\n\nNotifications: To show you alerts when we detect a suspicious or high-risk message.\n\nThe app may open your device\'s messaging app when you choose \"Block this sender\"; the app does not send SMS itself.';

  @override
  String get privacySection5Title => '5. Data retention and your choices';

  @override
  String get privacySection5Paragraphs => 'Analyzed messages and reasons: Kept only on your device until you choose Settings → Delete all history.\n\nSettings and trusted contacts: Stored on your device until you change or remove them, or uninstall the app.\n\nWe do not retain any copy of your data on our servers because we do not collect it.';

  @override
  String get privacySection6Title => '6. Children and sensitive users';

  @override
  String get privacySection6Paragraphs => 'The app is intended to help elderly and other vulnerable users avoid scams. We do not knowingly collect data from children in a way that would require parental consent; the app does not send data off-device.\n\nIf you are a caregiver setting up the app for someone else, we recommend explaining the permissions and this policy to them.';

  @override
  String get privacySection7Title => '7. Changes to this policy';

  @override
  String get privacySection7Paragraphs => 'If we change this policy (for example, if we add optional cloud features in a future version), we will update this document and, where required by law or store policy, notify you or ask for consent.';

  @override
  String get privacySection8Title => '8. Contact';

  @override
  String get privacySection8Body => 'For privacy-related questions or requests about Elder Shield, please contact [insert your contact email or support URL here].';

  @override
  String get privacyLastUpdatedNote => 'Last updated: Block 10. Replace placeholders before release.';

  @override
  String get aboutTagline => 'On-device scam protection for elderly users.';

  @override
  String get messagesAppBarTitle => 'Messages';

  @override
  String get messagesFilterAll => 'All';

  @override
  String get messagesFilterHighRisk => 'High Risk';

  @override
  String get messagesFilterAllSemanticsLabel => 'Show all messages';

  @override
  String get messagesFilterAllSemanticsHint => 'Double tap to see all analyzed messages.';

  @override
  String get messagesFilterHighRiskSemanticsLabel => 'Show only high-risk messages';

  @override
  String get messagesFilterHighRiskSemanticsHint => 'Double tap to filter to the most serious warnings.';

  @override
  String get messagesErrorTitle => 'Something went wrong while loading messages.';

  @override
  String get messagesErrorSubtitle => 'Pull down to try again.';

  @override
  String get messagesEmptyTitle => 'No messages analyzed yet. Elder Shield will check new messages automatically.';

  @override
  String get messagesEmptySubtitle => 'When we find something suspicious, we\'ll notify you and you can open it here.';

  @override
  String get messagesRefreshSnackbar => 'List updated';

  @override
  String get messagesLoadingHeader => 'Loading messages…';

  @override
  String messagesDateToday(String time) {
    return 'Today, $time';
  }

  @override
  String messagesDateYesterday(String time) {
    return 'Yesterday, $time';
  }

  @override
  String messagesDateOther(String month, int day, String time) {
    return '$month $day, $time';
  }

  @override
  String onboardingStepOf(int step, int total) {
    return 'Step $step of $total';
  }

  @override
  String get onboardingWelcomeBody1 => 'Elder Shield watches your messages and calls to warn you about scams.';

  @override
  String get onboardingWelcomeBody2 => 'You can call a trusted person with one tap if you’re ever unsure.';

  @override
  String get onboardingGetStarted => 'Get Started';

  @override
  String get onboardingPermissionsTitle => 'Why we need access';

  @override
  String get onboardingPermissionsBulletMessages => 'Messages: so we can read your texts and warn you if one looks like a scam.';

  @override
  String get onboardingPermissionsBulletPhone => 'Phone: so we know when you are on a call. Scammers often ask for OTPs while you are on the phone.';

  @override
  String get onboardingPermissionsBody1 => 'When you tap \"Allow Permissions\" below, your device will ask for: Messages, Phone, and Notifications (so we can alert you about possible scams even when the app is closed).';

  @override
  String get onboardingPermissionsBody2 => 'We never read your messages for anything except checking for scams.';

  @override
  String get onboardingPermissionsRetryWarning => 'Some permissions were denied. Protection will be limited until you allow them.';

  @override
  String get onboardingPermissionsPrimaryAllow => 'Allow Permissions';

  @override
  String get onboardingPermissionsPrimaryRetry => 'Try Again';

  @override
  String get onboardingSkipForNow => 'Skip for now';

  @override
  String get onboardingTrustedTitle => 'Add a trusted contact';

  @override
  String get onboardingTrustedBody1 => 'Pick someone you’d call if you got a worrying message — like a family member or close friend.';

  @override
  String get onboardingTrustedBody2 => 'By adding them, you can call this person with one tap from the Home screen or when we show a scam warning.';

  @override
  String get onboardingTrustedAddFromContacts => 'Add from contacts';

  @override
  String get onboardingTrustedAddFromContactsUnavailable => 'Device contact picker is not available yet on this preview build.';

  @override
  String get onboardingTrustedOrEnterManually => 'Or enter manually:';

  @override
  String get onboardingTrustedDone => 'Done';

  @override
  String get onboardingTrustedSeeWarningCta => 'See what a warning looks like';

  @override
  String get onboardingTrustedMissingFields => 'Please enter both name and number';

  @override
  String get launchGateChecking => 'Checking…';

  @override
  String get exampleWarningBanner => 'This is an example. No real message or action.';

  @override
  String get exampleWarningSnackbar => 'This was an example. No action was taken.';

  @override
  String get exampleWarningButton => 'Got it — this was an example';

  @override
  String get exampleWarningSenderUnknown => 'Unknown';

  @override
  String get exampleWarningBody => 'Your bank account will be blocked within 24 hours. Click here to verify: http://secure-bank-verify.com. Do not share this with anyone.';

  @override
  String get exampleWarningReasonSuspiciousLink => 'Contains a suspicious link';

  @override
  String get exampleWarningReasonPretendBank => 'Pretends to be your bank';

  @override
  String get exampleWarningReasonUrgentLanguage => 'Uses urgent or threatening language';

  @override
  String get reasonShortUrl => 'Contains a shortened or suspicious link';

  @override
  String get reasonOtpMention => 'Asks for or mentions a one-time code (OTP)';

  @override
  String get reasonUrgentLanguage => 'Uses urgent or threatening language';

  @override
  String get reasonBankKyc => 'Mentions bank account, KYC, or payment details';

  @override
  String get reasonPaymentRequest => 'Asks you to send or approve a payment';

  @override
  String get reasonPrizeLottery => 'Looks like a prize or lottery reward scam';

  @override
  String get reasonParcelDelivery => 'Mentions a suspicious parcel or delivery issue';

  @override
  String get reasonCryptoInvestment => 'Mentions risky crypto investment or guaranteed returns';

  @override
  String get reasonSenderSuspicious => 'Sender name looks unusual or suspicious';

  @override
  String get reasonInCallOtp => 'An OTP arrived while you are on a phone call — common scam pattern';

  @override
  String messageFromLabel(String sender) {
    return 'From: $sender';
  }

  @override
  String get fullScreenWarningTitle => 'Possible scam';

  @override
  String get fullScreenWarningClosingNote => 'Closing this screen does not delete the message from your phone.';

  @override
  String get fullScreenWarningDeleteAction => 'Delete message';

  @override
  String get fullScreenWarningDeleteSnackbar => 'Removed from Elder Shield. Opening messaging app so you can delete it from your phone.';

  @override
  String get fullScreenWarningBlockSender => 'Block this sender (opens messaging app)';

  @override
  String get roleSelectionTitle => 'Who is setting this up?';

  @override
  String get roleSelectionSubtitle => 'This helps us tailor the experience.';

  @override
  String get caregiverOption => 'I\'m setting this up for my parent / family member';

  @override
  String get selfProtectionOption => 'I want to protect myself';

  @override
  String get namePersonTitle => 'Who are you protecting?';

  @override
  String get namePersonSubtitle => 'Pick a name or type your own.';

  @override
  String get presetNameMaa => 'Maa';

  @override
  String get presetNamePapa => 'Papa';

  @override
  String get presetNameDadi => 'Dadi';

  @override
  String get presetNameDada => 'Dada';

  @override
  String get presetNameNani => 'Nani';

  @override
  String get presetNameNana => 'Nana';

  @override
  String get namePersonCustomHint => 'Or type a name';

  @override
  String get namePersonContinue => 'Continue';

  @override
  String get namePersonValidation => 'Please choose or enter a name';

  @override
  String get guardianTitle => 'Add yourself as guardian';

  @override
  String get guardianSubtitle => 'We\'ll notify you if a suspicious message is detected on their phone.';

  @override
  String get guardianNameLabel => 'Your name';

  @override
  String get guardianNameHint => 'e.g. Rahul';

  @override
  String get guardianPhoneLabel => 'Your WhatsApp / phone number';

  @override
  String get guardianPhoneHint => 'e.g. +91 98765 43210';

  @override
  String get guardianContinue => 'Continue';

  @override
  String get guardianValidation => 'Please enter both your name and phone number';

  @override
  String get yourNameTitle => 'What is your name?';

  @override
  String get yourNameSubtitle => 'So we can personalise your protection.';

  @override
  String get yourNameHint => 'Enter your name';

  @override
  String get yourNameContinue => 'Continue';

  @override
  String get yourNameValidation => 'Please enter your name';

  @override
  String get addGuardianOptional => 'Have a family member who cares? Add a guardian contact';

  @override
  String get addGuardianOptionalSubtitle => 'They can be notified when you receive a suspicious message.';

  @override
  String get onboardingFinish => 'Finish Setup';
}
