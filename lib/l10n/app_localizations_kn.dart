// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್';

  @override
  String get settingsTitle => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get homeAppBarTitle => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್';

  @override
  String get homePostOnboardingTitle => 'ನೀವು ಈಗ ಸುರಕ್ಷಿತರಾಗಿದ್ದೀರಿ';

  @override
  String homePostOnboardingBody(String contactName) {
    return 'ಹೋಮ್ ಪರದಿಯಿಂದ ನೀವು ಯಾವಾಗ ಬೇಕಾದರೂ $contactNameರನ್ನು ಕರೆ ಮಾಡಬಹುದು.';
  }

  @override
  String get commonGotIt => 'ಸರಿ';

  @override
  String get homeTrustedContactFallbackName => 'ನಿಮ್ಮ ನಂಬಿಕೆಯ ಸಂಪರ್ಕ';

  @override
  String get permissionsDialogTitle => 'Enable protection in Settings';

  @override
  String get permissionsDialogBody => 'Elder Shield needs SMS and Phone access to check your messages for scams.\n\nOpen app settings to turn these permissions on?';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get permissionsDialogOpenSettings => 'Open settings';

  @override
  String get homeProtectionStatusLabel => 'ರಕ್ಷಣೆ ಸ್ಥಿತಿ';

  @override
  String get homeProtectionStatusProtected => 'ರಕ್ಷಿಸಲಾಗಿದೆ';

  @override
  String get homeProtectionStatusPermissionsNeeded => 'ಅನುಮತಿಗಳು ಬೇಕು';

  @override
  String get homeEnableProtectionButton => 'ರಕ್ಷಣೆ ಆನ್ ಮಾಡಿ';

  @override
  String homeTodayRiskSummaryWithCount(int count) {
    return 'ಇಂದು $count ಅನುಮಾನಾಸ್ಪದ ಸಂದೇಶ(ಗಳು) ಪತ್ತೆಯಾಗಿದೆ.';
  }

  @override
  String get homeTodayRiskSummaryNoRisk => 'ಇಂದು ಯಾವುದೇ ಅನುಮಾನಾಸ್ಪದ ಚಟುವಟಿಕೆ ಇಲ್ಲ.';

  @override
  String get homeTodayRiskTapToSeeMessages => 'ಸಂದೇಶಗಳನ್ನು ನೋಡಲು ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get commonView => 'View';

  @override
  String get homeAutoCheckInfo => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್ ಹೊಸ ಸಂದೇಶಗಳನ್ನು ಸ್ವಯಂ ಪರೀಕ್ಷಿಸುತ್ತದೆ.';

  @override
  String homeCallTrustedButtonLabel(String name) {
    return '$nameರಿಗೆ ಕರೆ ಮಾಡಿ';
  }

  @override
  String get homeCallTooltipText => 'ಯಾವುದೇ ಕಳವಳದ ಸಂದೇಶ ಬಂದಾಗ ಇಲ್ಲಿ ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get homeAddTrustedIntro => 'ಭಯ ಹುಟ್ಟಿಸುವ ಸಂದೇಶ ಬಂದರೆ ತಕ್ಷಣ ಕರೆ ಮಾಡಲು ಒಬ್ಬ ನಂಬಿಕೆಯ ವ್ಯಕ್ತಿಯನ್ನು ಸೇರಿಸಿ.';

  @override
  String get homeAddTrustedButton => 'ನಂಬಿಕೆಯ ಸಂಪರ್ಕ ಸೇರಿಸಿ';

  @override
  String get homeWhyAddTrustedShow => 'ನಂಬಿಕೆಯ ಸಂಪರ್ಕವನ್ನು ಏಕೆ ಸೇರಿಸಬೇಕು?';

  @override
  String get homeWhyAddTrustedHide => 'ಕಾರಣ ಅಡಗಿಸಿ';

  @override
  String get homeWhyAddTrustedExplanation => 'ಒಂದು ಆತಂಕಕಾರಿ ಸಂದೇಶ ಬಂದಾಗ ನೀವು ಒಬ್ಬರೇ ತೀರ್ಮಾನ ತೆಗೆದುಕೊಳ್ಳಬಾರದೆಂದು, ಒಂದು ದೊಡ್ಡ ಬಟನ್ ಒತ್ತುವುದರಿಂದ ನೀವು ನಂಬಿಕೆಯ ವ್ಯಕ್ತಿಗೆ ಕರೆ ಮಾಡಬಹುದು.';

  @override
  String get homeTrustedContactsHeader => 'ನಿಮ್ಮ ನಂಬಿಕೆಯ ಸಂಪರ್ಕಗಳು';

  @override
  String get highRiskHeaderTitle => 'ಎಚ್ಚರಿಕೆ: ಇದು ಮೋಸ ಸಂದೇಶವಾಗಿರಬಹುದು';

  @override
  String get highRiskHeaderBody => 'ಈ ಸಂದೇಶದಲ್ಲಿರುವ ಯಾವುದೇ ಲಿಂಕ್‌ಗಳಿಗೆ ಟ್ಯಾಪ್ ಮಾಡಬೇಡಿ, ಯಾವುದೇ ಕೋಡ್‌ಗಳನ್ನು ಹಂಚಿಕೊಳ್ಳಬೇಡಿ.';

  @override
  String get highRiskWhyFlaggedTitle => 'ಏಕೆ ಇದು ಗುರುತಿಸಲಾಗಿದೆ:';

  @override
  String get actionScam => 'ಇದು ಮೋಸ';

  @override
  String get actionSafe => 'ಇದು ಸುರಕ್ಷಿತ';

  @override
  String get actionTrustSender => 'Trust this sender';

  @override
  String get snackbarGenericError => 'ಏನೋ ತಪ್ಪಾಗಿದೆ. ಮತ್ತೊಮ್ಮೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get snackbarMarkedScam => 'ಮೋಸವೆಂದು ಗುರುತಿಸಲಾಗಿದೆ. ಧನ್ಯವಾದಗಳು.';

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
  String get highRiskSwipeUpForDetails => 'ಹೆಚ್ಚು ವಿವರಗಳನ್ನು ನೋಡಲು ಮೇಲೆ ಸ್ವೈಪ್ ಮಾಡಿ';

  @override
  String get riskLowLabel => 'ಕಡಿಮೆ ಅಪಾಯ';

  @override
  String get riskMediumLabel => 'ಮಧ್ಯಮ ಅಪಾಯ — ಗಮನಿಸಿ';

  @override
  String get riskHighLabel => 'ಹೆಚ್ಚು ಅಪಾಯ — ಸಾಧ್ಯವಾದ ಮೋಸ';

  @override
  String get deleteMessageTitle => 'Delete message?';

  @override
  String get deleteMessageBody => 'Are you sure? This will remove the message from Elder Shield.';

  @override
  String get deleteMessageConfirm => 'Delete';

  @override
  String get deleteMessageDeletedSnackbar => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್‌ನಿಂದ ಅಳಿಸಲಾಗಿದೆ.';

  @override
  String get languageSectionTitle => 'ಭಾಷೆ';

  @override
  String get languageEnglishName => 'ಇಂಗ್ಲಿಷ್';

  @override
  String get languageBengaliName => 'ಬೆಂಗಾಲಿ';

  @override
  String get languageKannadaName => 'ಕನ್ನಡ';

  @override
  String get languageHindiName => 'ಹಿಂದಿ';

  @override
  String get languageUrduName => 'ಉರ್ದು';

  @override
  String get languageAssameseName => 'ಅಸ್ಸಾಮೀಸ್';

  @override
  String get languageTamilName => 'ತಮಿಳು';

  @override
  String get languageMalayalamName => 'ಮಲಯಾಳಂ';

  @override
  String get languageTeluguName => 'ತೆಲುಗು';

  @override
  String languageSectionSubtitle(String languageName) {
    return 'ಪ್ರಸ್ತುತ: $languageName';
  }

  @override
  String get snackbarUpdated => 'ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get settingsAppearanceTitle => 'ದೃಶ್ಯರೂಪ';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsTextSizeTitle => 'ಪಠ್ಯದ ಗಾತ್ರ';

  @override
  String get settingsTextSizeDescription => 'Adjust to see text larger or smaller. Changes apply immediately.';

  @override
  String get settingsTextSizeSample => 'Elder Shield keeps you safe from scam messages.';

  @override
  String get settingsLegalTitle => 'ಕಾನೂನು ಮತ್ತು ಮಾಹಿತಿ';

  @override
  String get settingsPrivacyPolicyTitle => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get settingsPrivacyPolicySubtitle => 'ನಾವು ನಿಮ್ಮ ಡೇಟಾವನ್ನು ಹೇಗೆ ಬಳಸುತ್ತೇವೆ';

  @override
  String get settingsPermissionsExplainedTitle => 'ಅನುಮತಿಗಳ ವಿವರ';

  @override
  String get settingsPermissionsExplainedSubtitle => 'ಪ್ರತಿ ಅನುಮತಿ ಏಕೆಬೇಕೆಂದು';

  @override
  String get settingsSensitivityTitle => 'ಸಂವೇದನಾಶೀಲತೆ';

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
  String get settingsTrustedContactsTitle => 'ನಂಬಿಕೆಯ ಸಂಪರ್ಕಗಳು';

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
  String get settingsAdvancedSectionTitle => 'ಮುನ್ನಡೆ ಆಯ್ಕೆಗಳು';

  @override
  String get settingsDeleteAllHistoryButton => 'ಎಲ್ಲಾ ಇತಿಹಾಸವನ್ನು ಅಳಿಸಿ';

  @override
  String get settingsRerunPermissionsButton => 'ಅನುಮತಿಗಳನ್ನು ಮತ್ತೆ ಪರಿಶೀಲಿಸಿ';

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
  String get settingsOverlayTitle => 'ಇತರ ಆ್ಯಪ್‌ಗಳ ಮೇಲಿನ ತುರ್ತು ಪಾಪ್-ಅಪ್';

  @override
  String get settingsOverlaySubtitleEnabled => 'ಸಕ್ರಿಯ: ಹೆಚ್ಚು ಅಪಾಯದ ಎಚ್ಚರಿಕೆಗಳು ಇತರ ಆ್ಯಪ್‌ಗಳ ಮೇಲೆಯೂ ತೋರಿಸಬಹುದು. ನೀವು ಬೇರೆ ಆ್ಯಪ್‌ನಲ್ಲಿ ಇದ್ದರೂ ಎಚ್ಚರಿಸಲು ಇದು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ.';

  @override
  String get settingsOverlaySubtitleDisabled => 'ಆಫ್: ಆಂಡ್ರಾಯ್ಡ್ ಓವರ್‌ಲೇ ಅನುಮತಿಯನ್ನು ಆನ್ ಮಾಡಲು ಇಲ್ಲಿ ಟ್ಯಾಪ್ ಮಾಡಿ. ನೀವು ಬೇರೆ ಆ್ಯಪ್‌ನಲ್ಲಿ ಇದ್ದರೂ ಎಚ್ಚರಿಕೆ ಪಡೆಯಲು ಇದನ್ನು ಆನ್ ಮಾಡುವುದು ಉತ್ತಮ.';

  @override
  String get settingsHowItWorksTitle => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್ ಹೇಗೆ ಕೆಲಸ ಮಾಡುತ್ತದೆ';

  @override
  String get settingsHowItWorksSubtitle => 'ನಾವು ಏನು ಪರಿಶೀಲಿಸುತ್ತೇವೆ, ಯಾವಾಗ ಎಚ್ಚರಿಸುತ್ತೇವೆ, ಏನು ಮಾಡಬೇಕು';

  @override
  String get settingsAboutTitle => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್ ಬಗ್ಗೆ';

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
  String get howItWorksBulletWhatWeCheck => 'ನಾವು ಏನು ನೋಡುತ್ತೇವೆ: ನಿಮ್ಮ ಎಸ್‌ಎಂಎಸ್‌ಗಳನ್ನು ಓದಿ, ಅದರಲ್ಲಿ ಅನುಮಾನಾಸ್ಪದ ಲಿಂಕ್‌ಗಳು, ತುರ್ತುವಾದ ಭಾಷೆ, ಒಟಿಪಿ ಅಥವಾ ಬ್ಯಾಂಕ್ ವಿವರಗಳನ್ನು ಕೇಳುವುದು, ಬ್ಯಾಂಕ್ ಅಥವಾ ಪರಿಚಿತ ಸೇವೆಯಂತೆ ನಟಿಸುವ ಸಂದೇಶಗಳು ಇತ್ಯಾದಿ ಮೋಸದ ಲಕ್ಷಣಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸುತ್ತೇವೆ.';

  @override
  String get howItWorksBulletWhenWeAlert => 'ಯಾವಾಗ ಎಚ್ಚರಿಸುತ್ತೇವೆ: ಸಂದೇಶ ಅನುಮಾನಾಸ್ಪದ ಕಾಣಿಸಿದರೆ ನಾವು ನಿಮಗೆ ತಿಳಿಸುತ್ತೇವೆ. ಹೆಚ್ಚು ಅಪಾಯದ ಸಂದೇಶಗಳಿಗೆ, ಆ್ಯಪ್ ಬ್ಯಾಕ್ಗ್ರೌಂಡ್‌ನಲ್ಲಿದ್ದಾಗಲೂ ಪಾಪ್‌ಅಪ್ ತೋರಿಸಿ, ಅದನ್ನು ಸಂದೇಶಗಳ ಪಟ್ಟಿಯಲ್ಲಿ ಹೈಲೈಟ್ ಮಾಡಬಹುದು.';

  @override
  String get howItWorksBulletWhatToDo => 'ಎಚ್ಚರಿಕೆ ಕಂಡಾಗ ಏನು ಮಾಡಬೇಕು: ಸಂದೇಶದಲ್ಲಿನ ಯಾವುದೇ ಲಿಂಕ್‌ಗೆ ಟ್ಯಾಪ್ ಮಾಡಬೇಡಿ. \"ಇದು ಮೋಸ\" ಅಥವಾ \"ಇದು ಸುರಕ್ಷಿತ\" ಎಂದು ಗುರುತಿಸುವುದರಿಂದ ನಮ್ಮಿಗೆ ಕಲಿಯಲು ಸಹಾಯ ಮಾಡಬಹುದು. ಅತ್ಯುತ್ತಮ ಕ್ರಮ: ಎಚ್ಚರಿಕೆ ಪರದೆ ಅಥವಾ ಹೋಮ್‌ನಿಂದಲೇ ನಿಮ್ಮ ನಂಬಿಕೆಯ ಸಂಪರ್ಕಕ್ಕೆ ಕರೆ ಮಾಡಿ.';

  @override
  String get howItWorksBulletCallTrusted => 'ನಂಬಿಕೆಯ ಸಂಪರ್ಕಕ್ಕೆ ಹೇಗೆ ಕರೆ ಮಾಡುವುದು: ಹೋಮ್ ಪರದೆಯಲ್ಲಿ ದೊಡ್ಡ \"ಕಾಲ್ [ಹೆಸರು]\" ಬಟನ್ ಮೇಲೆ ಯಾವಾಗ ಬೇಕಾದರೂ — ವಿಶೇಷವಾಗಿ ಚಿಂತೆಯ ಸಂದೇಶ ಬಂದಾಗ — ಟ್ಯಾಪ್ ಮಾಡಿ. ನಾವು ಸಾಧ್ಯವಾದ ಮೋಸ ತೋರಿಸಿದಾಗ, ಎಚ್ಚರಿಕೆ ಪರದೆಯಿಂದಲೂ ಕರೆ ಮಾಡಬಹುದು.';

  @override
  String get howItWorksSeeWarningCta => 'ಎಚ್ಚರಿಕೆ ಹೇಗಿರುತ್ತದೆ ಎಂದು ನೋಡಿ';

  @override
  String get permissionsIntro => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್ ಅನುಮತಿಗಳನ್ನು ಕೇವಲ ಮೋಸಗಳಿಂದ ರಕ್ಷಣೆಗಾಗಿ ಮಾತ್ರ ಬಳಸುತ್ತದೆ. ನೀವು ಯಾವುದನ್ನಾದರೂ ನಿರಾಕರಿಸಬಹುದು; ರಕ್ಷಣೆ ಸೀಮಿತವಾಗುತ್ತದೆಯೇ ಹೊರತು, ಆ್ಯಪ್ ಇನ್ನೂ ಕೆಲಸ ಮಾಡುತ್ತದೆ.';

  @override
  String get permissionsSmsTitle => 'ಸಂದೇಶಗಳು (SMS)';

  @override
  String get permissionsSmsBody => 'ನಿಮ್ಮ ಬಳಿ ಹೊಸ SMS ಬಂದಾಗ, ನಾವು ಅದನ್ನು ಓದಿ ಅದರಲ್ಲಿ ಮೋಸದ ಲಕ್ಷಣಗಳಿವೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸುತ್ತೇವೆ (ಉದಾ. ಅನುಮಾನಾಸ್ಪದ ಲಿಂಕ್‌ಗಳು, ಒಟಿಪಿ ಮೋಸ, ಬ್ಯಾಂಕ್ ಸಂಬಂಧಿತ ಪದಗಳು). ಯಾವುದೇ ಸಂದೇಶ ವಿಷಯವನ್ನು ನಿಮ್ಮ ಸಾಧನದ ಹೊರಗೆ ಕಳುಹಿಸಲಾಗುವುದಿಲ್ಲ. ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ನೀವು ವಿಶ್ಲೇಷಿಸಲಾದ ಇತಿಹಾಸವನ್ನು ಎಲ್ಲವನ್ನೂ ಅಳಿಸಬಹುದು.';

  @override
  String get permissionsPhoneStateTitle => 'ಫೋನ್ (ಸ್ಥಿತಿ ಓದು)';

  @override
  String get permissionsPhoneStateBody => 'ನೀವು ಯಾವಾಗ ಫೋನ್‌ನಲ್ಲಿ ಮಾತನಾಡುತ್ತಿದ್ದೀರಿ ಎಂಬುದನ್ನು ತಿಳಿದುಕೊಳ್ಳಲು ಇದು ಬೇಕಾಗುತ್ತದೆ, ಹೀಗಾಗಿ ಕರೆ ನಡುವೆಯೇ ಒಟಿಪಿ ಬಂದರೆ ಅಪಾಯದ ಮಟ್ಟ ಹೆಚ್ಚಾಗಿದೆ ಎಂದು ಗುರುತಿಸಬಹುದು (ಸಾಮಾನ್ಯ ಮೋಸ ಮಾದರಿ). ನಾವು ಕರೆಗಳನ್ನು ದಾಖಲೆ ಮಾಡುವುದಿಲ್ಲ, ಆಡಿಯೋ ಕೇಳುವುದಿಲ್ಲ, ಅಥವಾ ನಿಮ್ಮ ಕಾಲ್ ಲಾಗ್‌ಗೆ ಪ್ರವೇಶಿಸುವುದಿಲ್ಲ.';

  @override
  String get permissionsPhoneCallTitle => 'ಫೋನ್ (ಕರೆಮಾಡುವುದು)';

  @override
  String get permissionsPhoneCallBody => 'ಹೋಮ್ ಪರದೆಯಿಂದ ಅಥವಾ ಎಚ್ಚರಿಕೆ ಪರದೆಯಿಂದ ನೀವು \"ನಂಬಿಕೆಯ ಸಂಪರ್ಕಕ್ಕೆ ಕರೆಮಾಡಿ\" ಬಟನ್ ಒತ್ತಬಹುದಾಗಿ ಮಾಡಲು. ನೀವು ಬಟನ್ ಒತ್ತಿದಾಗ ಮಾತ್ರ, ಮತ್ತು ನೀವು ನಂಬಿಕೆಯ ಸಂಪರ್ಕವಾಗಿ ಸೇರಿಸಿದ ಸಂಖ್ಯೆಗೆ ಮಾತ್ರ, ಕರೆ ಪ್ರಾರಂಭವಾಗುತ್ತದೆ.';

  @override
  String get permissionsNotificationsTitle => 'ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get permissionsNotificationsBody => 'ಅನುಮಾನಾಸ್ಪದ ಅಥವಾ ಹೆಚ್ಚು ಅಪಾಯದ ಸಂದೇಶ ಪತ್ತೆಯಾದಾಗ ನಿಮಗೆ ಶೀಘ್ರವಾಗಿ ತಿಳಿಸಲು. ನೀವು ಸಿಸ್ಟಮ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಅಧಿಸೂಚನೆಗಳನ್ನು ಆಫ್ ಮಾಡಬಹುದು; ಹೀಗೆ ಮಾಡಿದರೂ ಆ್ಯಪ್ ಅನ್ನು ಬಳಸಲು ಸಾಧ್ಯ.';

  @override
  String get permissionsOverlayTitle => 'ಇತರ ಆ್ಯಪ್‌ಗಳ ಮೇಲೂ ತೋರಿಸುವ ಅನುಮತಿ (ಐಚ್ಛಿಕ)';

  @override
  String get permissionsOverlayBody => 'ಆಂಡ್ರಾಯ್ಡ್ ಓವರ್‌ಲೇ ಅನುಮತಿಯನ್ನು ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಆನ್ ಮಾಡಿದರೆ, ಅತ್ಯಂತ ಅಪಾಯದ ಸಂದೇಶ ಬಂದಾಗ ಎಲ್ಡರ್ ಶೀಲ್ಡ್ ಇತರ ಆ್ಯಪ್‌ಗಳ ಮೇಲೂ ತುರ್ತು ಎಚ್ಚರಿಕೆ ತೋರಿಸಬಹುದು. ಇದು ಸಂಪೂರ್ಣವಾಗಿ ಐಚ್ಛಿಕ — ವೈಯಕ್ತಿಕ ಸುರಕ್ಷತಾ ಬಳಕೆಗಾಗಿ ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ.';

  @override
  String get privacyTitle => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get privacySection1Title => '1. ನಾವು ಯಾರು';

  @override
  String get privacySection1Body => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್ ಒಂದು ಆಂಡ್ರಾಯ್ಡ್ ಆ್ಯಪ್ ಆಗಿದ್ದು, ಸಾಧನದಲ್ಲೇ ಸಂದೇಶಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ, ಅನುಮಾನಾಸ್ಪದವಾಗಿ ಕಂಡರೆ ಎಚ್ಚರಿಕೆ ನೀಡಿ, ಹಿರಿಯ ಬಳಕೆದಾರರನ್ನು SMS ಮತ್ತು ಕರೆ ಸಂಬಂಧಿತ ಮೋಸಗಳಿಂದ ರಕ್ಷಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.';

  @override
  String get privacySection2Title => '2. ನಾವು ಯಾವ ಡೇಟಾವನ್ನು ಸಂಸ್ಕರಿಸುತ್ತೇವೆ';

  @override
  String get privacySection2Paragraphs => 'ಎಲ್ಲ ಸಂಸ್ಕರಣೆ ನಿಮ್ಮ ಸಾಧನದಲ್ಲೇ ನಡೆಯುತ್ತದೆ. ನಾವು ನಿಮ್ಮ ಸಂದೇಶಗಳು, ಕರೆ ಸ್ಥಿತಿ ಅಥವಾ ಬೇರೆ ಯಾವುದೇ ವ್ಯಕ್ತಿಗತ ಡೇಟಾವನ್ನು ನಮ್ಮ ಸರ್ವರ್‌ಗಳಿಗೆ ಅಥವಾ ತೃತೀಯ ಪಕ್ಷಗಳಿಗೆ ಕಳುಹಿಸುವುದಿಲ್ಲ.\n\nಸಂದೇಶ ಡೇಟಾ: ನೀವು ಎಸ್‌ಎಂಎಸ್ ಸ್ವೀಕರಿಸಿದಾಗ, ಆ್ಯಪ್ ಕಳುಹಿಸಿದವರ ಹೆಸರು/ಸಂಖ್ಯೆ, ಸಂದೇಶದ ಮೂಲಪಾಠ ಮತ್ತು ಸಮಯವನ್ನು ಓದುತ್ತದೆ. ಈ ಮಾಹಿತಿಯನ್ನು ಕೇವಲ ಸಾಧನದ ಒಳಗಿನ ಮೋಸ ಪತ್ತೆಗೆ ಮಾತ್ರ ಬಳಸಲಾಗುತ್ತದೆ. ಫಲಿತಾಂಶಗಳನ್ನು ನಿಮ್ಮ ಸಾಧನದಲ್ಲೇ ಉಳಿಸಲಾಗುತ್ತದೆ. ಸೆಟ್ಟಿಂಗ್‌ಗಳು → \"ಇತಿಹಾಸವನ್ನು ಎಲ್ಲವನ್ನೂ ಅಳಿಸಿ\" ಮುಖಾಂತರ ನೀವು ಯಾವಾಗ ಬೇಕಾದರೂ ಇದನ್ನು ಅಳಿಸಬಹುದು.\n\nಕರೆ ಸ್ಥಿತಿ: ನೀವು ಫೋನ್‌ನಲ್ಲಿ ಮಾತನಾಡುತ್ತಿದ್ದೀರಾ ಎಂಬುದನ್ನು ಆ್ಯಪ್ ಪರಿಶೀಲಿಸುತ್ತದೆ. ನಾವು ಕರೆಗಳನ್ನು ದಾಖಲೆ ಮಾಡುವುದಿಲ್ಲ, ಆಡಿಯೋ ಕೇಳುವುದಿಲ್ಲ, ಅಥವಾ ಕಾಲ್ ಲಾಗ್ ಅನ್ನು ಓದುತ್ತಿಲ್ಲ. ಇದು ಕೇವಲ ಪತ್ತೆಯ ಸುಧಾರಣೆಗಾಗಿ (ಉದಾ. ಕರೆ ನಡುವೆಯೇ ಒಟಿಪಿ ಬಂದಾಗ ಎಚ್ಚರಿಸಲು) ಬಳಸಲ್ಪಡುತ್ತದೆ.\n\nಸೆಟ್ಟಿಂಗ್‌ಗಳು ಮತ್ತು ನಂಬಿಕೆಯ ಸಂಪರ್ಕಗಳು: ನಿಮ್ಮ ಸಾಧನದಲ್ಲಿನ ಭದ್ರ ಸಂಗ್ರಹಣೆಯಲ್ಲಿ ಮಾತ್ರ ಉಳಿಯುತ್ತವೆ. \"ನಂಬಿಕೆಯ ಸಂಪರ್ಕಕ್ಕೆ ಕರೆಮಾಡಿ\" ಬಟನ್‌ಗೆ ಈ ಸಂಖ್ಯೆಗಳು ಮಾತ್ರ ಬಳಸಲ್ಪಡುತ್ತವೆ. ನಾವು ಅವರಿಗೆ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಕರೆ ಮಾಡೋಲ್ಲ ಅಥವಾ ಸಂದೇಶ ಕಳುಹಿಸೋಲ್ಲ.';

  @override
  String get privacySection3Title => '3. ನಾವು ಏನು ಮಾಡುವುದಿಲ್ಲ';

  @override
  String get privacySection3Paragraphs => 'ನಾವು ನಿಮ್ಮ SMS ವಿಷಯ, ಕರೆ ಸ್ಥಿತಿ, ಅಥವಾ ಸಂಪರ್ಕ ಪಟ್ಟಿ ಯಾವುದನ್ನೂ ಇಂಟರ್‌ನೆಟ್‌ಗೆ ಕಳುಹಿಸುವುದಿಲ್ಲ.\n\nನಾವು ನಿಮ್ಮ ಡೇಟಾವನ್ನು ಜಾಹೀರಾತುದಾರರಿಗೆ ಅಥವಾ ಡೇಟಾ ವಹಿವಾಟುದಾರರಿಗೆ ಮಾರಾಟ, ಬಾಡಿಗೆ, ಅಥವಾ ಹಂಚಿಕೆ ಮಾಡುವುದಿಲ್ಲ.\n\nಆ್ಯಪ್ ಬಳಸಲು ನೀವು ಖಾತೆ ಸೃಷ್ಟಿಸಬೇಕಾಗಿಲ್ಲ ಅಥವಾ ಲಾಗಿನ್ ಆಗಬೇಕಾಗಿಲ್ಲ. ಅಗತ್ಯ ಅನುಮತಿಗಳನ್ನು ನೀಡಿದ ಬಳಿಕ ಆ್ಯಪ್ ಸಂಪೂರ್ಣವಾಗಿ ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ.\n\nನಾವು RCS/ಚಾಟ್ ಸಂದೇಶಗಳನ್ನು ಓದುತ್ತಿಲ್ಲ ಅಥವಾ ವಿಶ್ಲೇಷಿಸುವುದಿಲ್ಲ; ಕೇವಲ ಸಾಮಾನ್ಯ SMS ಗೆ ಮಾತ್ರ ಬೆಂಬಲವಿದೆ.';

  @override
  String get privacySection4Title => '4. ಅನುಮತಿಗಳು ಮತ್ತು ಅವು ಏಕೆ ಬೇಕು';

  @override
  String get privacySection4Paragraphs => 'SMS (ಸ್ವೀಕರಿಸಿ/ಓದುವಿಕೆ): ಮೋಸ ಮಾದರಿಗಳಿಗಾಗಿ ವಿಶ್ಲೇಷಿಸಿ, ಎಚ್ಚರಿಕೆ ತೋರಿಸಲು ಒಳಬರುವ SMS ಗಳನ್ನು ಓದಲು.\n\nಫೋನ್ (ಸ್ಥಿತಿ ಓದು): ನೀವು ಕರೆದಲ್ಲಿದ್ದೀರಾ ಎಂಬುದನ್ನು ತಿಳಿದುಕೊಳ್ಳಲು, ಕರೆ ಮಧ್ಯೆ ಒಟಿಪಿ ಬಂದರೆ ಹೆಚ್ಚು ಅಪಾಯ ಎಂದು ಗುರುತಿಸಲು. ನಾವು ಕರೆಗಳನ್ನು ದಾಖಲೆ ಮಾಡುವುದಿಲ್ಲ ಅಥವಾ ಕೇಳುವುದಿಲ್ಲ.\n\nಫೋನ್ (ಕರೆಮಾಡುವುದು): ನೀವು \"ನಂಬಿಕೆಯ ಸಂಪರ್ಕಕ್ಕೆ ಕರೆಮಾಡಿ\" ಬಟನ್ ಒತ್ತಬಹುದು. ನಾವು ನೀವು ನಂಬಿಕೆಯ ಸಂಪರ್ಕವಾಗಿ ಸೇರಿಸಿದ ಸಂಖ್ಯೆಗಳಿಗೂ ಹಾಗೂ ನೀವು ಬಟನ್ ಒತ್ತಿದಾಗ ಮಾತ್ರ ಕರೆ ಮಾಡುತ್ತೇವೆ.\n\nಅಧಿಸೂಚನೆಗಳು: ಅನುಮಾನಾಸ್ಪದ ಅಥವಾ ಹೆಚ್ಚು ಅಪಾಯದ ಸಂದೇಶ ಪತ್ತೆಯಾದಾಗ ನಿಮ್ಮನ್ನು ಎಚ್ಚರಿಸಲು.\n\n\"ಈ ಕಳುಹಿಸಿದವರನ್ನು ಬ್ಲಾಕ್ ಮಾಡಿ\" ಆಯ್ಕೆ ಮಾಡಿದಾಗ, ಆ್ಯಪ್ ನಿಮ್ಮ ಸಾಧನದ ಮೆಸೇಜಿಂಗ್ ಆ್ಯಪ್ ಅನ್ನು ತೆರೆಯಬಹುದು; ನಾವು ಸ್ವತಃ SMS ಕಳುಹಿಸುವುದಿಲ್ಲ.';

  @override
  String get privacySection5Title => '5. ಡೇಟಾ ಸಂಗ್ರಹ ಅವಧಿ ಮತ್ತು ನಿಮ್ಮ ಆಯ್ಕೆಗಳು';

  @override
  String get privacySection5Paragraphs => 'ವಿಶ್ಲೇಷಿಸಲಾದ ಸಂದೇಶಗಳು ಮತ್ತು ಕಾರಣಗಳು: ಇವು ನಿಮ್ಮ ಸಾಧನದಲ್ಲೇ ಉಳಿಯುತ್ತವೆ, ನೀವು ಸೆಟ್ಟಿಂಗ್‌ಗಳು → \"ಇತಿಹಾಸವನ್ನು ಎಲ್ಲವನ್ನೂ ಅಳಿಸಿ\" ಆಯ್ಕೆ ಮಾಡುವವರೆಗೆ.\n\nಸೆಟ್ಟಿಂಗ್‌ಗಳು ಮತ್ತು ನಂಬಿಕೆಯ ಸಂಪರ್ಕಗಳು: ನೀವು ಅವನ್ನು ಬದಲಾಯಿಸುವವರೆಗೆ, ತೆಗೆದುಹಾಕುವವರೆಗೆ, ಅಥವಾ ಆ್ಯಪ್ ಅನ್ನು ಅನ್‌ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡುವವರೆಗೆ, ನಿಮ್ಮ ಸಾಧನದಲ್ಲೇ ಉಳಿಯುತ್ತವೆ.\n\nನಾವು ನಿಮ್ಮ ಡೇಟಾವಿನ ಪ್ರತಿಯನ್ನು ನಮ್ಮ ಸರ್ವರ್‌ಗಳಲ್ಲಿ ಇಡುವುದಿಲ್ಲ, ಏಕೆಂದರೆ ನಾವು ಅದನ್ನು ಸಂಗ್ರಹಿಸುವುದೇ ಇಲ್ಲ.';

  @override
  String get privacySection6Title => '6. ಮಕ್ಕಳು ಮತ್ತು ಸಂವೇದನಾಶೀಲ ಬಳಕೆದಾರರು';

  @override
  String get privacySection6Paragraphs => 'ಈ ಆ್ಯಪ್ ಮೋಸಗಳಿಂದ ದೂರವಿರಲು ಹಿರಿಯರು ಮತ್ತು ಇತರ ಸಂವೇದನಾಶೀಲ ಬಳಕೆದಾರರಿಗೆ ಸಹಾಯ ಮಾಡಲು ವಿನ್ಯಾಸಗೊಳಿಸಲಾಗಿದೆ. ನಾವು ಮಕ್ಕಳಿಂದ ಪೋಷಕರ ಅನುಮತಿ ಅಗತ್ಯವಾಗುವ ರೀತಿಯಲ್ಲಿ ಡೇಟಾವನ್ನು ಸಂಗ್ರಹಿಸುವುದಿಲ್ಲ; ಆ್ಯಪ್ ಯಾವುದೇ ಡೇಟಾವನ್ನೂ ಸಾಧನದ ಹೊರಗೆ ಕಳುಹಿಸುವುದಿಲ್ಲ.\n\nನೀವು ಯಾರಿಗೋ ಪರವಾಗಿ (ಉದಾ. ಹಿರಿಯ ಕುಟುಂಬ ಸದಸ್ಯ) ಆ್ಯಪ್ ಅನ್ನು ಸೆಟ್‌ಅಪ್ ಮಾಡುತ್ತಿದ್ದರೆ, ಅನುಮತಿಗಳು ಮತ್ತು ಈ ನೀತಿಯನ್ನು ಸಣ್ಣವಾಗಿ ಅವರಿಗೆ ವಿವರಿಸಲು ನಾವು ಶಿಫಾರಸು ಮಾಡುತ್ತೇವೆ.';

  @override
  String get privacySection7Title => '7. ಈ ನೀತಿಯಲ್ಲಿ ಬದಲಾವಣೆಗಳು';

  @override
  String get privacySection7Paragraphs => 'ನಾವು ಈ ನೀತಿಯನ್ನು ಬದಲಾಯಿಸಿದರೆ (ಉದಾಹರಣೆಗೆ, ಭವಿಷ್ಯದ ಆವೃತ್ತಿಯಲ್ಲಿ ಐಚ್ಛಿಕ ಕ್ಲೌಡ್ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸೇರಿಸಿದರೆ), ನಾವು ಈ ಡಾಕ್ಯುಮೆಂಟನ್ನು ನವೀಕರಿಸುತ್ತೇವೆ ಮತ್ತು ಕಾನೂನು ಅಥವಾ ಸ್ಟೋರ್ ನೀತಿಗಳ ಪ್ರಕಾರ ಅಗತ್ಯವಿದ್ದರೆ, ನಿಮಗೆ ತಿಳಿಸಬಹುದು ಅಥವಾ ಒಪ್ಪಿಗೆ ಕೇಳಬಹುದು.';

  @override
  String get privacySection8Title => '8. ಸಂಪರ್ಕ';

  @override
  String get privacySection8Body => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್ ಸಂಬಂಧಿತ ಗೌಪ್ಯತಾ ಪ್ರಶ್ನೆಗಳು ಅಥವಾ ವಿನಂತಿಗಳಿಗೆ, ದಯವಿಟ್ಟು ಇಲ್ಲಿ ಸಂಪರ್ಕಿಸಿ: [ನಿಮ್ಮ ಸಹಾಯ ಇಮೇಲ್ ಅಥವಾ ಬೆಂಬಲ URL ಅನ್ನು ಇಲ್ಲಿ ಸೇರಿಸಿ].';

  @override
  String get privacyLastUpdatedNote => 'ಕೊನೆಯ ಅಪ್‌ಡೇಟ್: ಬ್ಲಾಕ್ 10. ರಿಲೀಸ್ ಮಾಡುವ ಮೊದಲು ಈ ಸ್ಥಾನದ ಪಠ್ಯಗಳನ್ನು (ಪ್ಲೇಸ್‌ಹೋಲ್ಡರ್) ಬದಲಾಯಿಸಿ.';

  @override
  String get aboutTagline => 'ಹಿರಿಯ ಬಳಕೆದಾರರಿಗೆ ಸಾಧನಗಳಲ್ಲೇ ಮೋಸದಿಂದ ರಕ್ಷಣೆ.';

  @override
  String get messagesAppBarTitle => 'ಸಂದೇಶಗಳು';

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
  String get messagesRefreshSnackbar => 'ಪಟ್ಟಿ ನವೀಕರಿಸಲಾಗಿದೆ';

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
    return 'ಹಂತ $step / $total';
  }

  @override
  String get onboardingWelcomeBody1 => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್ ನಿಮ್ಮ ಸಂದೇಶಗಳು ಮತ್ತು ಕರೆಗಳನ್ನು ಗಮನಿಸಿ, ಮೋಸವಿರಬಹುದು ಎಂದು ಕಂಡುಬಂದರೆ ಮುಂಚಿತವಾಗಿ ಎಚ್ಚರಿಸುತ್ತದೆ.';

  @override
  String get onboardingWelcomeBody2 => 'ನೀವು ಅನುಮಾನದಲ್ಲಿ ಇದ್ದರೆ, ಒಂದೇ ಟ್ಯಾಪ್‌ನಿಂದ ನಂಬಿಕೆಯ ವ್ಯಕ್ತಿಗೆ ಕರೆ ಮಾಡಬಹುದು.';

  @override
  String get onboardingGetStarted => 'ಪ್ರಾರಂಭಿಸೋಣ';

  @override
  String get onboardingPermissionsTitle => 'ಈ ಅನುಮತಿಗಳು ಏಕೆ ಬೇಕು';

  @override
  String get onboardingPermissionsBulletMessages => 'ಮೆಸೇಜುಗಳು: ನಿಮ್ಮ ಎಸ್‌ಎಂಎಸ್ ಓದಿ, ಅವುಗಳಲ್ಲಿ ಮೋಸದ ಲಕ್ಷಣಗಳಿದ್ದರೆ ಎಚ್ಚರಿಸಲು.';

  @override
  String get onboardingPermissionsBulletPhone => 'ಫೋನ್: ನೀವು ಯಾವಾಗ ಕರೆಗಳಲ್ಲಿ ಇದ್ದೀರಿ ಎಂದು ತಿಳಿದುಕೊಳ್ಳಲು. ಮೋಸಗಾರರು ಹಲವಾರು ಬಾರಿ ಫೋನ್‌ನಲ್ಲಿ ಮಾತನಾಡಿಸುತ್ತಾ ಒಟಿಪಿ ಕೇಳುತ್ತಾರೆ.';

  @override
  String get onboardingPermissionsBody1 => 'ಕೆಳಗಿನ \"ಅನುಮತಿಗಳನ್ನು ನೀಡಿ\" ಮೇಲೆ ಟ್ಯಾಪ್ ಮಾಡಿದಾಗ, ನಿಮ್ಮ ಸಾಧನವು ಮೆಸೇಜುಗಳು, ಫೋನ್ ಮತ್ತು ನೋಟಿಫಿಕೇಶನ್‌ಗಳ ಅನುಮತಿಯನ್ನು ಕೇಳುತ್ತದೆ (ಮೋಸದ ಶಂಕೆಯಿದ್ದರೆ ಆ್ಯಪ್ ಮುಚ್ಚಿದ್ದರೂ ನಾವು ಎಚ್ಚರಿಸಲು).';

  @override
  String get onboardingPermissionsBody2 => 'ಮೋಸ ಪರಿಶೀಲನೆಗೆ ಹೊರತು ಬೇರೆ ಯಾವ ಕಾರಣಕ್ಕೂ ನಾವು ನಿಮ್ಮ ಸಂದೇಶಗಳನ್ನು ಓದುತ್ತಿಲ್ಲ.';

  @override
  String get onboardingPermissionsRetryWarning => 'ಕೆಲವು ಅನುಮತಿಗಳನ್ನು ನಿರಾಕರಿಸಲಾಗಿದೆ. ನೀವು ಅವನ್ನು ನೀಡುವವರೆಗೂ ರಕ್ಷಣೆ ಸೀಮಿತವಾಗಿರುತ್ತದೆ.';

  @override
  String get onboardingPermissionsPrimaryAllow => 'ಅನುಮತಿಗಳನ್ನು ನೀಡಿ';

  @override
  String get onboardingPermissionsPrimaryRetry => 'ಮತ್ತೊಮ್ಮೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get onboardingSkipForNow => 'ಈಗ ಇರಲಿ';

  @override
  String get onboardingTrustedTitle => 'ನಂಬಿಕೆಯ ಸಂಪರ್ಕವನ್ನು ಸೇರಿಸಿ';

  @override
  String get onboardingTrustedBody1 => 'ಯಾವುದಾದರೂ ಆತಂಕಕಾರಿ ಸಂದೇಶ ಬಂದರೆ ನೀವು ಕರೆ ಮಾಡಲು ಇಚ್ಛಿಸುವ — ಕುಟುಂಬದ ಸದಸ್ಯ ಅಥವಾ ಆಪ್ತ ಸ್ನೇಹಿತನಂತೆ — ಒಬ್ಬರನ್ನು ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get onboardingTrustedBody2 => 'ಇವರನ್ನು ಸೇರಿಸಿದ ನಂತರ, ಹೋಮ್ ಪರದೆ ಅಥವಾ ನಾವು ಮೋಸ ಎಚ್ಚರಿಕೆ ತೋರಿಸಿದಾಗ ಒಂದೇ ಟ್ಯಾಪ್‌ನಿಂದ ಈ ವ್ಯಕ್ತಿಗೆ ಕರೆ ಮಾಡಬಹುದು.';

  @override
  String get onboardingTrustedAddFromContacts => 'ಸಂಪರ್ಕಗಳಿಂದ ಸೇರಿಸಿ';

  @override
  String get onboardingTrustedAddFromContactsUnavailable => 'ಈ ಪೂರ್ವವೀಕ್ಷಣಾ ಆವೃತ್ತಿಯಲ್ಲಿ ಸಾಧನದ ಕಾನ್ಟ್ಯಾಕ್ಟ್ ಪಿಕರ್ ಇನ್ನೂ ಲಭ್ಯವಿಲ್ಲ.';

  @override
  String get onboardingTrustedOrEnterManually => 'ಅಥವಾ ಸಂಖ್ಯೆಯನ್ನು ಕೈಯಾರೆ ನಮೂದಿಸಿ:';

  @override
  String get onboardingTrustedDone => 'ಆಯಿತು';

  @override
  String get onboardingTrustedSeeWarningCta => 'ಎಚ್ಚರಿಕೆ ಹೇಗಿರುತ್ತದೆ ಎಂದು ನೋಡಿ';

  @override
  String get onboardingTrustedMissingFields => 'ದಯವಿಟ್ಟು ಹೆಸರು ಮತ್ತು ಸಂಖ್ಯೆಯನ್ನು ಎರಡನ್ನೂ ನಮೂದಿಸಿ';

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
  String get reasonShortUrl => 'ಸಂಕ್ಷಿಪ್ತ ಅಥವಾ ಅನುಮಾನಾಸ್ಪದ ಲಿಂಕ್ ಹೊಂದಿದೆ';

  @override
  String get reasonOtpMention => 'ಒಟಿಪಿ ಅಥವಾ ಒಮ್ಮೆ ಬಳಕೆಯ ಕೋಡನ್ನು ಕೇಳುತ್ತದೆ ಅಥವಾ ಉಲ್ಲೇಖಿಸುತ್ತದೆ';

  @override
  String get reasonUrgentLanguage => 'ತೀವ್ರ ತುರ್ತು ಅಥವಾ ಬೆದರಿಕೆ ನೀಡುವ ಭಾಷೆಯನ್ನು ಬಳಸುತ್ತದೆ';

  @override
  String get reasonBankKyc => 'ಬ್ಯಾಂಕ್ ಖಾತೆ, KYC ಅಥವಾ ಪಾವತಿ ವಿವರಗಳ ಬಗ್ಗೆ ಹೇಳುತ್ತದೆ';

  @override
  String get reasonPaymentRequest => 'ನೀವು ಹಣ ಕಳುಹಿಸಲು ಅಥವಾ ಪಾವತಿ ಅಂಗೀಕರಿಸಲು ಕೇಳುತ್ತದೆ';

  @override
  String get reasonPrizeLottery => 'ಲಾಟರಿ/ಬಹುಮಾನ ಗೆದ್ದಿದ್ದೀರಿ ಎಂಬಂತೆ ಪ್ರಲೋಭನ ತೋರಿಸುತ್ತದೆ';

  @override
  String get reasonParcelDelivery => 'ಸಂದೇಹಾಸ್ಪದ ಪಾರ್ಸೆಲ್ ಅಥವಾ ಡೆಲಿವರಿ ಸಮಸ್ಯೆಯ ಬಗ್ಗೆ ಹೇಳುತ್ತದೆ';

  @override
  String get reasonCryptoInvestment => 'ಹೆಚ್ಚು ಅಪಾಯದ ಕ್ರಿಪ್ಟೋ ಹೂಡಿಕೆ ಅಥವಾ ಖಚಿತ ಲಾಭದ ಭರವಸೆ ನೀಡುತ್ತದೆ';

  @override
  String get reasonSenderSuspicious => 'ಕಳುಹಿಸಿದವರ ಹೆಸರು ಅಸಹಜ ಅಥವಾ ಅನುಮಾನಾಸ್ಪದವಾಗಿ ಕಾಣುತ್ತದೆ';

  @override
  String get reasonInCallOtp => 'ನೀವು ಫೋನ್‌ನಲ್ಲಿ ಮಾತನಾಡುತ್ತಿರುವಾಗಲೇ ಒಟಿಪಿ ಬಂದಿದೆ — ಇದು ಸಾಮಾನ್ಯ ಮೋಸ ಪ್ಯಾಟರ್ನ್';

  @override
  String messageFromLabel(String sender) {
    return 'ಕಳುಹಿಸಿದವರು: $sender';
  }

  @override
  String get fullScreenWarningTitle => 'ಸಂಭಾವ್ಯ ಮೋಸ';

  @override
  String get fullScreenWarningClosingNote => 'ಈ ಪರದೆಯನ್ನು ಮುಚ್ಚಿದರೂ ನಿಮ್ಮ ಫೋನ್‌ನಲ್ಲಿನ ಸಂದೇಶ ಅಳಿಸದು.';

  @override
  String get fullScreenWarningDeleteAction => 'ಸಂದೇಶ ಅಳಿಸಿ';

  @override
  String get fullScreenWarningDeleteSnackbar => 'ಎಲ್ಡರ್ ಶೀಲ್ಡ್‌ನಿಂದ ಅಳಿಸಲಾಗಿದೆ. ನಿಮ್ಮ ಫೋನ್‌ನಿಂದ ಅಳಿಸಲು ಮೆಸೇಜಿಂಗ್ ಆ್ಯಪ್ ತೆರೆಯಲಾಗುತ್ತಿದೆ.';

  @override
  String get fullScreenWarningBlockSender => 'ಈ ಕಳುಹಿಸಿದವರನ್ನು ಬ್ಲಾಕ್ ಮಾಡಿ (ಮೆಸೇಜಿಂಗ್ ಆ್ಯಪ್ ತೆರೆಯುತ್ತದೆ)';

  @override
  String guardianPlanMonthlyPrice(String price) {
    return '₹$price';
  }

  @override
  String guardianPlanYearlyPrice(String price) {
    return '₹$price';
  }

  @override
  String get guardianPlanTitle => 'ಗಾರ್ಡಿಯನ್ ಪ್ಲಾನ್';

  @override
  String get guardianPlanSubtitle => 'ಕುಟುಂಬ ಸದಸ್ಯರಿಗೆ ಅನುಮಾನಾಸ್ಪದ ಸಂದೇಶ ಬಂದಾಗ ತಿಳಿಯಿರಿ';

  @override
  String get guardianPlanWhatYouGet => 'ನೀವು ಪಡೆಯುವುದು';

  @override
  String get guardianPlanBenefitAlerts => 'ಅನುಮಾನಾಸ್ಪದ ಸಂದೇಶಗಳ ಮೇಲೆ WhatsApp/SMS ಎಚ್ಚರಿಕೆಗಳು';

  @override
  String get guardianPlanBenefitHeartbeat => 'ದೈನಂದಿನ ಚೆಕ್-ಇನ್: ಅವರ ಫೋನ್ ರಕ್ಷಿತವಾಗಿದೆ ಎಂದು ತಿಳಿಯಿರಿ';

  @override
  String get guardianPlanBenefitSummary => 'ವಾರದ ಬೆದರಿಕೆ ಸಾರಾಂಶ';

  @override
  String get guardianPlanBenefitFamily => '3 ಕುಟುಂಬ ಸದಸ್ಯರನ್ನು ರಕ್ಷಿಸಿ';

  @override
  String get guardianPlanMonthlyFallback => 'ಮಾಸಿಕ ಯೋಜನೆ';

  @override
  String get guardianPlanYearlyFallback => 'ವಾರ್ಷಿಕ ಯೋಜನೆ — 33% ಉಳಿತಾಯ';

  @override
  String get guardianPlanYearlySaveBadge => '33% ಉಳಿತಾಯ';

  @override
  String get guardianPlanRestore => 'ಖರೀದಿಗಳನ್ನು ಮರುಸ್ಥಾಪಿಸಿ';

  @override
  String get guardianPlanMaybeLater => 'ನಂತರ';

  @override
  String get guardianPlanTerms => 'ಸೇವಾ ನಿಯಮಗಳು';

  @override
  String get guardianPlanPrivacy => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get guardianPlanActiveSubtitle => 'ಗಾರ್ಡಿಯನ್ ಎಚ್ಚರಿಕೆಗಳು, ದೈನಂದಿನ ಚೆಕ್-ಇನ್, ವಾರದ ಸಾರಾಂಶ';

  @override
  String get guardianPlanUpgradeSubtitle => 'ಕುಟುಂಬ ಸದಸ್ಯರಿಗೆ ಅನುಮಾನಾಸ್ಪದ ಸಂದೇಶ ಬಂದಾಗ ಎಚ್ಚರಿಕೆ ಪಡೆಯಿರಿ';

  @override
  String get guardianPlanActiveBadge => 'ಸಕ್ರಿಯ';
}
