import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_as.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('as'),
    Locale('bn'),
    Locale('en'),
    Locale('hi'),
    Locale('kn'),
    Locale('ml'),
    Locale('ta'),
    Locale('te'),
    Locale('ur')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Elder Shield'**
  String get appTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @homeAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Elder Shield'**
  String get homeAppBarTitle;

  /// No description provided for @homePostOnboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re protected'**
  String get homePostOnboardingTitle;

  /// Message shown after onboarding; contactName is either the trusted contact's name or a generic phrase.
  ///
  /// In en, this message translates to:
  /// **'From Home you can call {contactName} anytime.'**
  String homePostOnboardingBody(String contactName);

  /// No description provided for @commonGotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get commonGotIt;

  /// No description provided for @homeTrustedContactFallbackName.
  ///
  /// In en, this message translates to:
  /// **'your trusted contact'**
  String get homeTrustedContactFallbackName;

  /// No description provided for @permissionsDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable protection in Settings'**
  String get permissionsDialogTitle;

  /// No description provided for @permissionsDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Elder Shield needs SMS and Phone access to check your messages for scams.\n\nOpen app settings to turn these permissions on?'**
  String get permissionsDialogBody;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @permissionsDialogOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get permissionsDialogOpenSettings;

  /// No description provided for @homeProtectionStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Protection status'**
  String get homeProtectionStatusLabel;

  /// No description provided for @homeProtectionStatusProtected.
  ///
  /// In en, this message translates to:
  /// **'Protected'**
  String get homeProtectionStatusProtected;

  /// No description provided for @homeProtectionStatusPermissionsNeeded.
  ///
  /// In en, this message translates to:
  /// **'Permissions needed'**
  String get homeProtectionStatusPermissionsNeeded;

  /// No description provided for @homeEnableProtectionButton.
  ///
  /// In en, this message translates to:
  /// **'Enable protection'**
  String get homeEnableProtectionButton;

  /// Summary of today's suspicious messages with count.
  ///
  /// In en, this message translates to:
  /// **'{count} suspicious message(s) detected today.'**
  String homeTodayRiskSummaryWithCount(int count);

  /// No description provided for @homeTodayRiskSummaryNoRisk.
  ///
  /// In en, this message translates to:
  /// **'No suspicious activity today.'**
  String get homeTodayRiskSummaryNoRisk;

  /// No description provided for @homeTodayRiskTapToSeeMessages.
  ///
  /// In en, this message translates to:
  /// **'Tap to see messages'**
  String get homeTodayRiskTapToSeeMessages;

  /// No description provided for @commonView.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get commonView;

  /// No description provided for @homeAutoCheckInfo.
  ///
  /// In en, this message translates to:
  /// **'Elder Shield checks new messages automatically.'**
  String get homeAutoCheckInfo;

  /// Label for the big call trusted contact button.
  ///
  /// In en, this message translates to:
  /// **'Call {name}'**
  String homeCallTrustedButtonLabel(String name);

  /// No description provided for @homeCallTooltipText.
  ///
  /// In en, this message translates to:
  /// **'Tap here anytime you get a worrying message.'**
  String get homeCallTooltipText;

  /// No description provided for @homeAddTrustedIntro.
  ///
  /// In en, this message translates to:
  /// **'Add a trusted contact so you can call them quickly if you get a scary message.'**
  String get homeAddTrustedIntro;

  /// No description provided for @homeAddTrustedButton.
  ///
  /// In en, this message translates to:
  /// **'Add a trusted contact'**
  String get homeAddTrustedButton;

  /// No description provided for @homeWhyAddTrustedShow.
  ///
  /// In en, this message translates to:
  /// **'Why add a trusted contact?'**
  String get homeWhyAddTrustedShow;

  /// No description provided for @homeWhyAddTrustedHide.
  ///
  /// In en, this message translates to:
  /// **'Hide why'**
  String get homeWhyAddTrustedHide;

  /// No description provided for @homeWhyAddTrustedExplanation.
  ///
  /// In en, this message translates to:
  /// **'If you ever get a worrying message, you can tap one big button to call someone you trust instead of guessing what to do alone.'**
  String get homeWhyAddTrustedExplanation;

  /// No description provided for @homeTrustedContactsHeader.
  ///
  /// In en, this message translates to:
  /// **'Your trusted contacts'**
  String get homeTrustedContactsHeader;

  /// No description provided for @highRiskHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Danger: possible scam message'**
  String get highRiskHeaderTitle;

  /// No description provided for @highRiskHeaderBody.
  ///
  /// In en, this message translates to:
  /// **'Do not tap any links or share codes from this message.'**
  String get highRiskHeaderBody;

  /// No description provided for @highRiskWhyFlaggedTitle.
  ///
  /// In en, this message translates to:
  /// **'Why this was flagged:'**
  String get highRiskWhyFlaggedTitle;

  /// No description provided for @actionScam.
  ///
  /// In en, this message translates to:
  /// **'This is a Scam'**
  String get actionScam;

  /// No description provided for @actionSafe.
  ///
  /// In en, this message translates to:
  /// **'This is Safe'**
  String get actionSafe;

  /// No description provided for @actionTrustSender.
  ///
  /// In en, this message translates to:
  /// **'Trust this sender'**
  String get actionTrustSender;

  /// No description provided for @snackbarGenericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Try again.'**
  String get snackbarGenericError;

  /// No description provided for @snackbarMarkedScam.
  ///
  /// In en, this message translates to:
  /// **'Marked as scam. Thank you.'**
  String get snackbarMarkedScam;

  /// No description provided for @snackbarSenderTrusted.
  ///
  /// In en, this message translates to:
  /// **'Sender trusted — no more alerts from them.'**
  String get snackbarSenderTrusted;

  /// No description provided for @settingsTrustedSendersTitle.
  ///
  /// In en, this message translates to:
  /// **'Trusted Senders'**
  String get settingsTrustedSendersTitle;

  /// No description provided for @settingsTrustedSendersNone.
  ///
  /// In en, this message translates to:
  /// **'No trusted senders'**
  String get settingsTrustedSendersNone;

  /// No description provided for @settingsTrustedSendersCount.
  ///
  /// In en, this message translates to:
  /// **'{count} trusted sender(s)'**
  String settingsTrustedSendersCount(int count);

  /// No description provided for @settingsTrustedSendersExplanation.
  ///
  /// In en, this message translates to:
  /// **'These senders will not trigger any alerts. Tap \'Trust this sender\' on a warning to add them here.'**
  String get settingsTrustedSendersExplanation;

  /// No description provided for @settingsTrustedSendersRemoveDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove trusted sender?'**
  String get settingsTrustedSendersRemoveDialogTitle;

  /// No description provided for @settingsTrustedSendersRemoveDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Alerts will be shown again for messages from this sender.'**
  String get settingsTrustedSendersRemoveDialogBody;

  /// No description provided for @settingsTrustedSendersRemoveDialogRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get settingsTrustedSendersRemoveDialogRemove;

  /// No description provided for @highRiskSwipeUpForDetails.
  ///
  /// In en, this message translates to:
  /// **'Swipe up for more details'**
  String get highRiskSwipeUpForDetails;

  /// No description provided for @riskLowLabel.
  ///
  /// In en, this message translates to:
  /// **'Low risk'**
  String get riskLowLabel;

  /// No description provided for @riskMediumLabel.
  ///
  /// In en, this message translates to:
  /// **'Medium risk — review'**
  String get riskMediumLabel;

  /// No description provided for @riskHighLabel.
  ///
  /// In en, this message translates to:
  /// **'High risk — possible scam'**
  String get riskHighLabel;

  /// No description provided for @deleteMessageTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete message?'**
  String get deleteMessageTitle;

  /// No description provided for @deleteMessageBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure? This will remove the message from Elder Shield.'**
  String get deleteMessageBody;

  /// No description provided for @deleteMessageConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteMessageConfirm;

  /// No description provided for @deleteMessageDeletedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Removed from Elder Shield.'**
  String get deleteMessageDeletedSnackbar;

  /// No description provided for @languageSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSectionTitle;

  /// No description provided for @languageEnglishName.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglishName;

  /// No description provided for @languageBengaliName.
  ///
  /// In en, this message translates to:
  /// **'Bengali'**
  String get languageBengaliName;

  /// No description provided for @languageKannadaName.
  ///
  /// In en, this message translates to:
  /// **'Kannada'**
  String get languageKannadaName;

  /// No description provided for @languageHindiName.
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get languageHindiName;

  /// No description provided for @languageUrduName.
  ///
  /// In en, this message translates to:
  /// **'Urdu'**
  String get languageUrduName;

  /// No description provided for @languageAssameseName.
  ///
  /// In en, this message translates to:
  /// **'Assamese'**
  String get languageAssameseName;

  /// No description provided for @languageTamilName.
  ///
  /// In en, this message translates to:
  /// **'Tamil'**
  String get languageTamilName;

  /// No description provided for @languageMalayalamName.
  ///
  /// In en, this message translates to:
  /// **'Malayalam'**
  String get languageMalayalamName;

  /// No description provided for @languageTeluguName.
  ///
  /// In en, this message translates to:
  /// **'Telugu'**
  String get languageTeluguName;

  /// Subtitle showing currently selected language.
  ///
  /// In en, this message translates to:
  /// **'Current: {languageName}'**
  String languageSectionSubtitle(String languageName);

  /// No description provided for @snackbarUpdated.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get snackbarUpdated;

  /// No description provided for @settingsAppearanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearanceTitle;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeSystem;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// No description provided for @settingsTextSizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get settingsTextSizeTitle;

  /// No description provided for @settingsTextSizeDescription.
  ///
  /// In en, this message translates to:
  /// **'Adjust to see text larger or smaller. Changes apply immediately.'**
  String get settingsTextSizeDescription;

  /// No description provided for @settingsTextSizeSample.
  ///
  /// In en, this message translates to:
  /// **'Elder Shield keeps you safe from scam messages.'**
  String get settingsTextSizeSample;

  /// No description provided for @settingsLegalTitle.
  ///
  /// In en, this message translates to:
  /// **'Legal & information'**
  String get settingsLegalTitle;

  /// No description provided for @settingsPrivacyPolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get settingsPrivacyPolicyTitle;

  /// No description provided for @settingsPrivacyPolicySubtitle.
  ///
  /// In en, this message translates to:
  /// **'How we use your data'**
  String get settingsPrivacyPolicySubtitle;

  /// No description provided for @settingsPermissionsExplainedTitle.
  ///
  /// In en, this message translates to:
  /// **'Permissions explained'**
  String get settingsPermissionsExplainedTitle;

  /// No description provided for @settingsPermissionsExplainedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Why we need each permission'**
  String get settingsPermissionsExplainedSubtitle;

  /// No description provided for @settingsSensitivityTitle.
  ///
  /// In en, this message translates to:
  /// **'Sensitivity'**
  String get settingsSensitivityTitle;

  /// No description provided for @settingsSensitivityLabelConservative.
  ///
  /// In en, this message translates to:
  /// **'Fewer alerts'**
  String get settingsSensitivityLabelConservative;

  /// No description provided for @settingsSensitivityLabelBalanced.
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get settingsSensitivityLabelBalanced;

  /// No description provided for @settingsSensitivityLabelSensitive.
  ///
  /// In en, this message translates to:
  /// **'More alerts'**
  String get settingsSensitivityLabelSensitive;

  /// No description provided for @settingsSensitivityDescConservative.
  ///
  /// In en, this message translates to:
  /// **'Only very obvious scams. Good if you prefer fewer alerts.'**
  String get settingsSensitivityDescConservative;

  /// No description provided for @settingsSensitivityDescBalanced.
  ///
  /// In en, this message translates to:
  /// **'Good for most people. A balance of scams caught and noise.'**
  String get settingsSensitivityDescBalanced;

  /// No description provided for @settingsSensitivityDescSensitive.
  ///
  /// In en, this message translates to:
  /// **'Catches more scams but may sometimes flag safe messages.'**
  String get settingsSensitivityDescSensitive;

  /// No description provided for @settingsTrustedContactsTitle.
  ///
  /// In en, this message translates to:
  /// **'Trusted contacts'**
  String get settingsTrustedContactsTitle;

  /// No description provided for @settingsTrustedContactsNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get settingsTrustedContactsNone;

  /// No description provided for @settingsTrustedContactsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} contact(s)'**
  String settingsTrustedContactsCount(int count);

  /// No description provided for @settingsTrustedContactsExplanation.
  ///
  /// In en, this message translates to:
  /// **'You can call them with one tap from Home or when we show a scam warning. First in the list is used for the main \"Call\" button.'**
  String get settingsTrustedContactsExplanation;

  /// No description provided for @settingsTrustedContactsAddContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Add contact'**
  String get settingsTrustedContactsAddContactTitle;

  /// No description provided for @settingsTrustedContactsAddContactSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Type a name and phone number'**
  String get settingsTrustedContactsAddContactSubtitle;

  /// No description provided for @settingsTrustedContactsChooseFromContactsTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose from contacts'**
  String get settingsTrustedContactsChooseFromContactsTitle;

  /// No description provided for @settingsTrustedContactsChooseFromContactsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick a number from your phone'**
  String get settingsTrustedContactsChooseFromContactsSubtitle;

  /// No description provided for @settingsTrustedContactsPickerUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Device contact picker is not available yet on this preview build.'**
  String get settingsTrustedContactsPickerUnavailable;

  /// No description provided for @settingsTrustedContactsRemoveDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove trusted contact?'**
  String get settingsTrustedContactsRemoveDialogTitle;

  /// No description provided for @settingsTrustedContactsRemoveDialogBody.
  ///
  /// In en, this message translates to:
  /// **'This person will no longer appear in your trusted contacts or on the Home screen.'**
  String get settingsTrustedContactsRemoveDialogBody;

  /// No description provided for @settingsTrustedContactsRemoveDialogRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get settingsTrustedContactsRemoveDialogRemove;

  /// No description provided for @settingsAdvancedSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get settingsAdvancedSectionTitle;

  /// No description provided for @settingsDeleteAllHistoryButton.
  ///
  /// In en, this message translates to:
  /// **'Delete all history'**
  String get settingsDeleteAllHistoryButton;

  /// No description provided for @settingsRerunPermissionsButton.
  ///
  /// In en, this message translates to:
  /// **'Re-run permissions check'**
  String get settingsRerunPermissionsButton;

  /// No description provided for @settingsDeleteAllHistoryDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all history?'**
  String get settingsDeleteAllHistoryDialogTitle;

  /// No description provided for @settingsDeleteAllHistoryDialogBody.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete all analyzed messages and reasons from this device. You cannot undo this.'**
  String get settingsDeleteAllHistoryDialogBody;

  /// No description provided for @settingsDeleteAllHistoryDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete all'**
  String get settingsDeleteAllHistoryDialogConfirm;

  /// No description provided for @settingsHistoryDeletedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'History deleted'**
  String get settingsHistoryDeletedSnackbar;

  /// No description provided for @settingsRerunPermissionsSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Permission check done. Restart the app if you just granted access.'**
  String get settingsRerunPermissionsSnackbar;

  /// No description provided for @settingsOverlayTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency pop-up over other apps'**
  String get settingsOverlayTitle;

  /// No description provided for @settingsOverlaySubtitleEnabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled: high-risk warnings can appear above other apps. Recommended so we can warn you even when you’re in another app.'**
  String get settingsOverlaySubtitleEnabled;

  /// No description provided for @settingsOverlaySubtitleDisabled.
  ///
  /// In en, this message translates to:
  /// **'Off: tap to enable the Android overlay permission. Recommended so we can warn you even when you’re in another app.'**
  String get settingsOverlaySubtitleDisabled;

  /// No description provided for @settingsHowItWorksTitle.
  ///
  /// In en, this message translates to:
  /// **'How Elder Shield works'**
  String get settingsHowItWorksTitle;

  /// No description provided for @settingsHowItWorksSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What we check, when we alert, what to do'**
  String get settingsHowItWorksSubtitle;

  /// No description provided for @settingsAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Elder Shield'**
  String get settingsAboutTitle;

  /// No description provided for @settingsAddTrustedDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add trusted contact'**
  String get settingsAddTrustedDialogTitle;

  /// No description provided for @settingsAddTrustedDialogConsent.
  ///
  /// In en, this message translates to:
  /// **'They can be called with one tap from Home or when we show a scam warning.'**
  String get settingsAddTrustedDialogConsent;

  /// No description provided for @settingsAddTrustedDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get settingsAddTrustedDialogConfirm;

  /// No description provided for @settingsEditTrustedDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit trusted contact'**
  String get settingsEditTrustedDialogTitle;

  /// No description provided for @settingsEditTrustedDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get settingsEditTrustedDialogConfirm;

  /// No description provided for @settingsContactNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get settingsContactNameLabel;

  /// No description provided for @settingsContactNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. My son'**
  String get settingsContactNameHint;

  /// No description provided for @settingsContactNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get settingsContactNumberLabel;

  /// No description provided for @settingsContactNumberHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. +91 98765 43210'**
  String get settingsContactNumberHint;

  /// No description provided for @settingsContactDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settingsContactDialogCancel;

  /// No description provided for @settingsContactInvalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid phone number'**
  String get settingsContactInvalidNumber;

  /// No description provided for @howItWorksBulletWhatWeCheck.
  ///
  /// In en, this message translates to:
  /// **'What we check: We read your SMS and look for signs of scams — suspicious links, urgent language, requests for OTP or bank details, and messages that pretend to be your bank or a known service.'**
  String get howItWorksBulletWhatWeCheck;

  /// No description provided for @howItWorksBulletWhenWeAlert.
  ///
  /// In en, this message translates to:
  /// **'When we alert: If a message looks risky, we notify you. For high-risk messages we can show a pop-up even when the app is in the background, and list the message on the Messages tab.'**
  String get howItWorksBulletWhenWeAlert;

  /// No description provided for @howItWorksBulletWhatToDo.
  ///
  /// In en, this message translates to:
  /// **'What to do when you see a warning: Don’t tap any link in the message. You can mark it as \"This is a Scam\" or \"This is Safe\" to help us learn. Best step: call your trusted contact from the warning screen or from Home.'**
  String get howItWorksBulletWhatToDo;

  /// No description provided for @howItWorksBulletCallTrusted.
  ///
  /// In en, this message translates to:
  /// **'How to call your trusted contact: On the Home screen, tap the big \"Call [Name]\" button anytime — especially if you get a worrying message. You can also call from the warning screen when we show a possible scam.'**
  String get howItWorksBulletCallTrusted;

  /// No description provided for @howItWorksSeeWarningCta.
  ///
  /// In en, this message translates to:
  /// **'See what a warning looks like'**
  String get howItWorksSeeWarningCta;

  /// No description provided for @permissionsIntro.
  ///
  /// In en, this message translates to:
  /// **'Elder Shield only uses permissions for scam protection. You can deny any permission; protection will be limited but the app still works.'**
  String get permissionsIntro;

  /// No description provided for @permissionsSmsTitle.
  ///
  /// In en, this message translates to:
  /// **'Messages (SMS)'**
  String get permissionsSmsTitle;

  /// No description provided for @permissionsSmsBody.
  ///
  /// In en, this message translates to:
  /// **'We receive and read incoming SMS so we can analyse them for scam indicators (e.g. suspicious links, OTP phishing, bank-related wording) and show you warnings. No message content is sent off your device. You can delete all analysed history from Settings.'**
  String get permissionsSmsBody;

  /// No description provided for @permissionsPhoneStateTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone (read state)'**
  String get permissionsPhoneStateTitle;

  /// No description provided for @permissionsPhoneStateBody.
  ///
  /// In en, this message translates to:
  /// **'We need to know when you\'re on a call so we can raise the risk level when an OTP arrives during a call (a common scam pattern). We do not record calls, listen to audio, or access your call log.'**
  String get permissionsPhoneStateBody;

  /// No description provided for @permissionsPhoneCallTitle.
  ///
  /// In en, this message translates to:
  /// **'Phone (make calls)'**
  String get permissionsPhoneCallTitle;

  /// No description provided for @permissionsPhoneCallBody.
  ///
  /// In en, this message translates to:
  /// **'So you can tap \"Call trusted contact\" from Home or a warning. The app only starts a call when you tap the button, and only to numbers you have added as trusted contacts.'**
  String get permissionsPhoneCallBody;

  /// No description provided for @permissionsNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get permissionsNotificationsTitle;

  /// No description provided for @permissionsNotificationsBody.
  ///
  /// In en, this message translates to:
  /// **'To show you alerts when we detect a suspicious or high-risk message, so you can act quickly. You can turn off notifications in system settings; you will still be able to use the app.'**
  String get permissionsNotificationsBody;

  /// No description provided for @permissionsOverlayTitle.
  ///
  /// In en, this message translates to:
  /// **'Draw over other apps (optional)'**
  String get permissionsOverlayTitle;

  /// No description provided for @permissionsOverlayBody.
  ///
  /// In en, this message translates to:
  /// **'If you enable the Android overlay permission in Settings, Elder Shield can show an emergency warning above other apps when a high-risk message arrives. This is optional and intended for personal-use safety setups.'**
  String get permissionsOverlayBody;

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyTitle;

  /// No description provided for @privacySection1Title.
  ///
  /// In en, this message translates to:
  /// **'1. Who we are'**
  String get privacySection1Title;

  /// No description provided for @privacySection1Body.
  ///
  /// In en, this message translates to:
  /// **'Elder Shield is an Android app that helps protect elderly users from SMS- and call-related scams by analysing messages on the device and warning when something looks suspicious.'**
  String get privacySection1Body;

  /// No description provided for @privacySection2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Data we process'**
  String get privacySection2Title;

  /// No description provided for @privacySection2Paragraphs.
  ///
  /// In en, this message translates to:
  /// **'All processing happens on your device. We do not send your messages, call state, or any other personal data to our servers or to any third party.\n\nMessage data: When you receive an SMS, the app reads the sender, message body, and timestamp. This data is used only to run our on-device scam detection. Results are stored only on your device. You can delete all of this at any time from Settings → Delete all history.\n\nCall state: The app checks whether you\'re on a phone call. We do not record calls, listen to audio, or access your call log. Call state is used only to improve detection (e.g. warning when an OTP arrives during a call).\n\nSettings and trusted contacts: Stored only on your device in secure storage. Trusted contacts are used only so you can tap \"Call trusted contact\". We do not call or message them automatically.'**
  String get privacySection2Paragraphs;

  /// No description provided for @privacySection3Title.
  ///
  /// In en, this message translates to:
  /// **'3. What we do not do'**
  String get privacySection3Title;

  /// No description provided for @privacySection3Paragraphs.
  ///
  /// In en, this message translates to:
  /// **'We do not send your SMS content, call state, or contact list to the internet.\n\nWe do not sell, rent, or share your data with advertisers or data brokers.\n\nWe do not require an account or sign-in. The app works fully offline after permissions are granted.\n\nWe do not read or analyse RCS/chat messages; only standard SMS is supported.'**
  String get privacySection3Paragraphs;

  /// No description provided for @privacySection4Title.
  ///
  /// In en, this message translates to:
  /// **'4. Permissions and why we need them'**
  String get privacySection4Title;

  /// No description provided for @privacySection4Paragraphs.
  ///
  /// In en, this message translates to:
  /// **'SMS (receive/read): To receive and read incoming SMS so we can analyse them for scam patterns and show you warnings.\n\nPhone (read phone state): To know when you\'re on a call, so we can flag higher risk when an OTP arrives during a call. We do not record or listen to calls.\n\nPhone (make calls): So you can tap \"Call trusted contact\". We only call numbers you have added as trusted contacts.\n\nNotifications: To show you alerts when we detect a suspicious or high-risk message.\n\nThe app may open your device\'s messaging app when you choose \"Block this sender\"; the app does not send SMS itself.'**
  String get privacySection4Paragraphs;

  /// No description provided for @privacySection5Title.
  ///
  /// In en, this message translates to:
  /// **'5. Data retention and your choices'**
  String get privacySection5Title;

  /// No description provided for @privacySection5Paragraphs.
  ///
  /// In en, this message translates to:
  /// **'Analyzed messages and reasons: Kept only on your device until you choose Settings → Delete all history.\n\nSettings and trusted contacts: Stored on your device until you change or remove them, or uninstall the app.\n\nWe do not retain any copy of your data on our servers because we do not collect it.'**
  String get privacySection5Paragraphs;

  /// No description provided for @privacySection6Title.
  ///
  /// In en, this message translates to:
  /// **'6. Children and sensitive users'**
  String get privacySection6Title;

  /// No description provided for @privacySection6Paragraphs.
  ///
  /// In en, this message translates to:
  /// **'The app is intended to help elderly and other vulnerable users avoid scams. We do not knowingly collect data from children in a way that would require parental consent; the app does not send data off-device.\n\nIf you are a caregiver setting up the app for someone else, we recommend explaining the permissions and this policy to them.'**
  String get privacySection6Paragraphs;

  /// No description provided for @privacySection7Title.
  ///
  /// In en, this message translates to:
  /// **'7. Changes to this policy'**
  String get privacySection7Title;

  /// No description provided for @privacySection7Paragraphs.
  ///
  /// In en, this message translates to:
  /// **'If we change this policy (for example, if we add optional cloud features in a future version), we will update this document and, where required by law or store policy, notify you or ask for consent.'**
  String get privacySection7Paragraphs;

  /// No description provided for @privacySection8Title.
  ///
  /// In en, this message translates to:
  /// **'8. Contact'**
  String get privacySection8Title;

  /// No description provided for @privacySection8Body.
  ///
  /// In en, this message translates to:
  /// **'For privacy-related questions or requests about Elder Shield, please contact [insert your contact email or support URL here].'**
  String get privacySection8Body;

  /// No description provided for @privacyLastUpdatedNote.
  ///
  /// In en, this message translates to:
  /// **'Last updated: Block 10. Replace placeholders before release.'**
  String get privacyLastUpdatedNote;

  /// No description provided for @aboutTagline.
  ///
  /// In en, this message translates to:
  /// **'On-device scam protection for elderly users.'**
  String get aboutTagline;

  /// No description provided for @messagesAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messagesAppBarTitle;

  /// No description provided for @messagesFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get messagesFilterAll;

  /// No description provided for @messagesFilterHighRisk.
  ///
  /// In en, this message translates to:
  /// **'High Risk'**
  String get messagesFilterHighRisk;

  /// No description provided for @messagesFilterAllSemanticsLabel.
  ///
  /// In en, this message translates to:
  /// **'Show all messages'**
  String get messagesFilterAllSemanticsLabel;

  /// No description provided for @messagesFilterAllSemanticsHint.
  ///
  /// In en, this message translates to:
  /// **'Double tap to see all analyzed messages.'**
  String get messagesFilterAllSemanticsHint;

  /// No description provided for @messagesFilterHighRiskSemanticsLabel.
  ///
  /// In en, this message translates to:
  /// **'Show only high-risk messages'**
  String get messagesFilterHighRiskSemanticsLabel;

  /// No description provided for @messagesFilterHighRiskSemanticsHint.
  ///
  /// In en, this message translates to:
  /// **'Double tap to filter to the most serious warnings.'**
  String get messagesFilterHighRiskSemanticsHint;

  /// No description provided for @messagesErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while loading messages.'**
  String get messagesErrorTitle;

  /// No description provided for @messagesErrorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pull down to try again.'**
  String get messagesErrorSubtitle;

  /// No description provided for @messagesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No messages analyzed yet. Elder Shield will check new messages automatically.'**
  String get messagesEmptyTitle;

  /// No description provided for @messagesEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'When we find something suspicious, we\'ll notify you and you can open it here.'**
  String get messagesEmptySubtitle;

  /// No description provided for @messagesRefreshSnackbar.
  ///
  /// In en, this message translates to:
  /// **'List updated'**
  String get messagesRefreshSnackbar;

  /// No description provided for @messagesLoadingHeader.
  ///
  /// In en, this message translates to:
  /// **'Loading messages…'**
  String get messagesLoadingHeader;

  /// No description provided for @messagesDateToday.
  ///
  /// In en, this message translates to:
  /// **'Today, {time}'**
  String messagesDateToday(String time);

  /// No description provided for @messagesDateYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday, {time}'**
  String messagesDateYesterday(String time);

  /// No description provided for @messagesDateOther.
  ///
  /// In en, this message translates to:
  /// **'{month} {day}, {time}'**
  String messagesDateOther(String month, int day, String time);

  /// No description provided for @onboardingStepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {step} of {total}'**
  String onboardingStepOf(int step, int total);

  /// No description provided for @onboardingWelcomeBody1.
  ///
  /// In en, this message translates to:
  /// **'Elder Shield watches your messages and calls to warn you about scams.'**
  String get onboardingWelcomeBody1;

  /// No description provided for @onboardingWelcomeBody2.
  ///
  /// In en, this message translates to:
  /// **'You can call a trusted person with one tap if you’re ever unsure.'**
  String get onboardingWelcomeBody2;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingPermissionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Why we need access'**
  String get onboardingPermissionsTitle;

  /// No description provided for @onboardingPermissionsBulletMessages.
  ///
  /// In en, this message translates to:
  /// **'Messages: so we can read your texts and warn you if one looks like a scam.'**
  String get onboardingPermissionsBulletMessages;

  /// No description provided for @onboardingPermissionsBulletPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone: so we know when you are on a call. Scammers often ask for OTPs while you are on the phone.'**
  String get onboardingPermissionsBulletPhone;

  /// No description provided for @onboardingPermissionsBody1.
  ///
  /// In en, this message translates to:
  /// **'When you tap \"Allow Permissions\" below, your device will ask for: Messages, Phone, and Notifications (so we can alert you about possible scams even when the app is closed).'**
  String get onboardingPermissionsBody1;

  /// No description provided for @onboardingPermissionsBody2.
  ///
  /// In en, this message translates to:
  /// **'We never read your messages for anything except checking for scams.'**
  String get onboardingPermissionsBody2;

  /// No description provided for @onboardingPermissionsRetryWarning.
  ///
  /// In en, this message translates to:
  /// **'Some permissions were denied. Protection will be limited until you allow them.'**
  String get onboardingPermissionsRetryWarning;

  /// No description provided for @onboardingPermissionsPrimaryAllow.
  ///
  /// In en, this message translates to:
  /// **'Allow Permissions'**
  String get onboardingPermissionsPrimaryAllow;

  /// No description provided for @onboardingPermissionsPrimaryRetry.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get onboardingPermissionsPrimaryRetry;

  /// No description provided for @onboardingSkipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get onboardingSkipForNow;

  /// No description provided for @onboardingTrustedTitle.
  ///
  /// In en, this message translates to:
  /// **'Add a trusted contact'**
  String get onboardingTrustedTitle;

  /// No description provided for @onboardingTrustedBody1.
  ///
  /// In en, this message translates to:
  /// **'Pick someone you’d call if you got a worrying message — like a family member or close friend.'**
  String get onboardingTrustedBody1;

  /// No description provided for @onboardingTrustedBody2.
  ///
  /// In en, this message translates to:
  /// **'By adding them, you can call this person with one tap from the Home screen or when we show a scam warning.'**
  String get onboardingTrustedBody2;

  /// No description provided for @onboardingTrustedAddFromContacts.
  ///
  /// In en, this message translates to:
  /// **'Add from contacts'**
  String get onboardingTrustedAddFromContacts;

  /// No description provided for @onboardingTrustedAddFromContactsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Device contact picker is not available yet on this preview build.'**
  String get onboardingTrustedAddFromContactsUnavailable;

  /// No description provided for @onboardingTrustedOrEnterManually.
  ///
  /// In en, this message translates to:
  /// **'Or enter manually:'**
  String get onboardingTrustedOrEnterManually;

  /// No description provided for @onboardingTrustedDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get onboardingTrustedDone;

  /// No description provided for @onboardingTrustedSeeWarningCta.
  ///
  /// In en, this message translates to:
  /// **'See what a warning looks like'**
  String get onboardingTrustedSeeWarningCta;

  /// No description provided for @onboardingTrustedMissingFields.
  ///
  /// In en, this message translates to:
  /// **'Please enter both name and number'**
  String get onboardingTrustedMissingFields;

  /// No description provided for @launchGateChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking…'**
  String get launchGateChecking;

  /// No description provided for @exampleWarningBanner.
  ///
  /// In en, this message translates to:
  /// **'This is an example. No real message or action.'**
  String get exampleWarningBanner;

  /// No description provided for @exampleWarningSnackbar.
  ///
  /// In en, this message translates to:
  /// **'This was an example. No action was taken.'**
  String get exampleWarningSnackbar;

  /// No description provided for @exampleWarningButton.
  ///
  /// In en, this message translates to:
  /// **'Got it — this was an example'**
  String get exampleWarningButton;

  /// No description provided for @exampleWarningSenderUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get exampleWarningSenderUnknown;

  /// No description provided for @exampleWarningBody.
  ///
  /// In en, this message translates to:
  /// **'Your bank account will be blocked within 24 hours. Click here to verify: http://secure-bank-verify.com. Do not share this with anyone.'**
  String get exampleWarningBody;

  /// No description provided for @exampleWarningReasonSuspiciousLink.
  ///
  /// In en, this message translates to:
  /// **'Contains a suspicious link'**
  String get exampleWarningReasonSuspiciousLink;

  /// No description provided for @exampleWarningReasonPretendBank.
  ///
  /// In en, this message translates to:
  /// **'Pretends to be your bank'**
  String get exampleWarningReasonPretendBank;

  /// No description provided for @exampleWarningReasonUrgentLanguage.
  ///
  /// In en, this message translates to:
  /// **'Uses urgent or threatening language'**
  String get exampleWarningReasonUrgentLanguage;

  /// No description provided for @reasonShortUrl.
  ///
  /// In en, this message translates to:
  /// **'Contains a shortened or suspicious link'**
  String get reasonShortUrl;

  /// No description provided for @reasonOtpMention.
  ///
  /// In en, this message translates to:
  /// **'Asks for or mentions a one-time code (OTP)'**
  String get reasonOtpMention;

  /// No description provided for @reasonUrgentLanguage.
  ///
  /// In en, this message translates to:
  /// **'Uses urgent or threatening language'**
  String get reasonUrgentLanguage;

  /// No description provided for @reasonBankKyc.
  ///
  /// In en, this message translates to:
  /// **'Mentions bank account, KYC, or payment details'**
  String get reasonBankKyc;

  /// No description provided for @reasonPaymentRequest.
  ///
  /// In en, this message translates to:
  /// **'Asks you to send or approve a payment'**
  String get reasonPaymentRequest;

  /// No description provided for @reasonPrizeLottery.
  ///
  /// In en, this message translates to:
  /// **'Looks like a prize or lottery reward scam'**
  String get reasonPrizeLottery;

  /// No description provided for @reasonParcelDelivery.
  ///
  /// In en, this message translates to:
  /// **'Mentions a suspicious parcel or delivery issue'**
  String get reasonParcelDelivery;

  /// No description provided for @reasonCryptoInvestment.
  ///
  /// In en, this message translates to:
  /// **'Mentions risky crypto investment or guaranteed returns'**
  String get reasonCryptoInvestment;

  /// No description provided for @reasonSenderSuspicious.
  ///
  /// In en, this message translates to:
  /// **'Sender name looks unusual or suspicious'**
  String get reasonSenderSuspicious;

  /// No description provided for @reasonInCallOtp.
  ///
  /// In en, this message translates to:
  /// **'An OTP arrived while you are on a phone call — common scam pattern'**
  String get reasonInCallOtp;

  /// No description provided for @messageFromLabel.
  ///
  /// In en, this message translates to:
  /// **'From: {sender}'**
  String messageFromLabel(String sender);

  /// No description provided for @fullScreenWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Possible scam'**
  String get fullScreenWarningTitle;

  /// No description provided for @fullScreenWarningClosingNote.
  ///
  /// In en, this message translates to:
  /// **'Closing this screen does not delete the message from your phone.'**
  String get fullScreenWarningClosingNote;

  /// No description provided for @fullScreenWarningDeleteAction.
  ///
  /// In en, this message translates to:
  /// **'Delete message'**
  String get fullScreenWarningDeleteAction;

  /// No description provided for @fullScreenWarningDeleteSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Removed from Elder Shield. Opening messaging app so you can delete it from your phone.'**
  String get fullScreenWarningDeleteSnackbar;

  /// No description provided for @fullScreenWarningBlockSender.
  ///
  /// In en, this message translates to:
  /// **'Block this sender (opens messaging app)'**
  String get fullScreenWarningBlockSender;

  /// Guardian Plan monthly price
  ///
  /// In en, this message translates to:
  /// **'₹{price}/month'**
  String guardianPlanMonthlyPrice(String price);

  /// Guardian Plan yearly price
  ///
  /// In en, this message translates to:
  /// **'₹{price}/year'**
  String guardianPlanYearlyPrice(String price);

  /// No description provided for @guardianPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Guardian Plan'**
  String get guardianPlanTitle;

  /// No description provided for @guardianPlanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notified when your family member receives a suspicious message'**
  String get guardianPlanSubtitle;

  /// No description provided for @guardianPlanWhatYouGet.
  ///
  /// In en, this message translates to:
  /// **'What you get'**
  String get guardianPlanWhatYouGet;

  /// No description provided for @guardianPlanBenefitAlerts.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp/SMS alerts when suspicious messages arrive'**
  String get guardianPlanBenefitAlerts;

  /// No description provided for @guardianPlanBenefitHeartbeat.
  ///
  /// In en, this message translates to:
  /// **'Daily check-in: know their phone is active and protected'**
  String get guardianPlanBenefitHeartbeat;

  /// No description provided for @guardianPlanBenefitSummary.
  ///
  /// In en, this message translates to:
  /// **'Weekly summary of threats blocked'**
  String get guardianPlanBenefitSummary;

  /// No description provided for @guardianPlanBenefitFamily.
  ///
  /// In en, this message translates to:
  /// **'Protect up to 3 family members'**
  String get guardianPlanBenefitFamily;

  /// No description provided for @guardianPlanMonthlyFallback.
  ///
  /// In en, this message translates to:
  /// **'Monthly plan'**
  String get guardianPlanMonthlyFallback;

  /// No description provided for @guardianPlanYearlyFallback.
  ///
  /// In en, this message translates to:
  /// **'Yearly plan — Save 33%'**
  String get guardianPlanYearlyFallback;

  /// No description provided for @guardianPlanYearlySaveBadge.
  ///
  /// In en, this message translates to:
  /// **'Save 33%'**
  String get guardianPlanYearlySaveBadge;

  /// No description provided for @guardianPlanRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get guardianPlanRestore;

  /// No description provided for @guardianPlanMaybeLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get guardianPlanMaybeLater;

  /// No description provided for @guardianPlanTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get guardianPlanTerms;

  /// No description provided for @guardianPlanPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get guardianPlanPrivacy;

  /// No description provided for @guardianPlanActiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Guardian alerts, daily heartbeat, weekly summary'**
  String get guardianPlanActiveSubtitle;

  /// No description provided for @guardianPlanUpgradeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get alerts when your family member gets a suspicious message'**
  String get guardianPlanUpgradeSubtitle;

  /// No description provided for @guardianPlanActiveBadge.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get guardianPlanActiveBadge;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['as', 'bn', 'en', 'hi', 'kn', 'ml', 'ta', 'te', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'as': return AppLocalizationsAs();
    case 'bn': return AppLocalizationsBn();
    case 'en': return AppLocalizationsEn();
    case 'hi': return AppLocalizationsHi();
    case 'kn': return AppLocalizationsKn();
    case 'ml': return AppLocalizationsMl();
    case 'ta': return AppLocalizationsTa();
    case 'te': return AppLocalizationsTe();
    case 'ur': return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
