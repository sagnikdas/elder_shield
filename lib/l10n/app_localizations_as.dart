// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Assamese (`as`).
class AppLocalizationsAs extends AppLocalizations {
  AppLocalizationsAs([String locale = 'as']) : super(locale);

  @override
  String get appTitle => 'এল্ডাৰ শিল্ড';

  @override
  String get settingsTitle => 'ছেটিংছ';

  @override
  String get homeAppBarTitle => 'এল্ডাৰ শিল্ড';

  @override
  String get homePostOnboardingTitle => 'আপুনি এতিয়া সুৰক্ষিত';

  @override
  String homePostOnboardingBody(String contactName) {
    return 'হোম স্ক্ৰিনৰ পৰা যিকোনো সময়ত আপুনি $contactNameক কল কৰিব পাৰে।';
  }

  @override
  String get commonGotIt => 'বুজিলো';

  @override
  String get homeTrustedContactFallbackName => 'আপোনাৰ ভৰসাযোগ্য যোগাযোগ';

  @override
  String get permissionsDialogTitle => 'ছেটিংছত সুৰক্ষা অন কৰক';

  @override
  String get permissionsDialogBody => 'এল্ডাৰ শিল্ডে আপোনাৰ বাৰ্তাত স্কেম আছে নে নাই চাবলৈ SMS আৰু ফোনৰ অনুমতিৰ প্ৰয়োজন।\n\nএই অনুমতিসমূহ অন কৰিবলৈ আপুনি এপ ছেটিংছ খুলিব নে?';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get permissionsDialogOpenSettings => 'ছেটিংছ খোলক';

  @override
  String get homeProtectionStatusLabel => 'সুৰক্ষাৰ অৱস্থা';

  @override
  String get homeProtectionStatusProtected => 'সুৰক্ষিত';

  @override
  String get homeProtectionStatusPermissionsNeeded => 'অনুমতিৰ প্ৰয়োজন';

  @override
  String get homeEnableProtectionButton => 'সুৰক্ষা অন কৰক';

  @override
  String homeTodayRiskSummaryWithCount(int count) {
    return 'আজি $countটা সন্দেহজনক বাৰ্তা পোৱা গৈছে।';
  }

  @override
  String get homeTodayRiskSummaryNoRisk => 'আজি কোনো সন্দেহজনক কাৰ্যকলাপ নাই।';

  @override
  String get homeTodayRiskTapToSeeMessages => 'বাৰ্তাসমূহ চাবলৈ টেপ কৰক';

  @override
  String get commonView => 'চাওক';

  @override
  String get homeAutoCheckInfo => 'এল্ডাৰ শিল্ডে নতুন বাৰ্তাসমূহ স্বয়ংক্ৰিয়ভাৱে পৰীক্ষা কৰে।';

  @override
  String homeCallTrustedButtonLabel(String name) {
    return '$nameক কল কৰক';
  }

  @override
  String get homeCallTooltipText => 'যেতিয়া বেছি চিন্তাজনক বাৰ্তা আহে, তেতিয়া ইয়াত টেপ কৰক।';

  @override
  String get homeAddTrustedIntro => 'এজন ভৰসাযোগ্য যোগাযোগ যোগ কৰক, যাতে ভয়লগা বাৰ্তা পালে আপুনি সহস্ৰে তেখেতক কল কৰিব পাৰে।';

  @override
  String get homeAddTrustedButton => 'ভৰসাযোগ্য যোগাযোগ যোগ কৰক';

  @override
  String get homeWhyAddTrustedShow => 'ভৰসাযোগ্য যোগাযোগ কিয় যোগ কৰিব?';

  @override
  String get homeWhyAddTrustedHide => 'কাৰণ লুকুৱাওক';

  @override
  String get homeWhyAddTrustedExplanation => 'যদি কেতিয়াবা চিন্তাজনক বাৰ্তা আহে, তেন্তে আপুনি একেলগে সিদ্ধান্ত লৈ অহোৰাত্র চিন্তা নকৰাকৈ এটা ডাঙৰ বুটাম টেপ কৰি ভৰসাযোগ্য ব্যক্তিজনক কল কৰিব পাৰে — এই বাবেই।';

  @override
  String get homeTrustedContactsHeader => 'আপোনাৰ ভৰসাযোগ্য যোগাযোগসমূহ';

  @override
  String get highRiskHeaderTitle => 'সাৱধান: এইটো স্কেম বাৰ্তা হ\'ব পাৰে';

  @override
  String get highRiskHeaderBody => 'এই বাৰ্তাৰ কোনো লিঙ্কত টেপ নকৰিব, কোনো কোড অপূৰ্ণ ভাগ নকৰিব।';

  @override
  String get highRiskWhyFlaggedTitle => 'কিয় চিহ্নিত কৰা হৈছে:';

  @override
  String get actionScam => 'ই এটা স্কেম';

  @override
  String get actionSafe => 'ই সুৰক্ষিত';

  @override
  String get actionTrustSender => 'Trust this sender';

  @override
  String get snackbarGenericError => 'কিছুতো ভুল হ’ল। পুনৰ চেষ্টা কৰক।';

  @override
  String get snackbarMarkedScam => 'স্কেম হিচাপে চিহ্নিত কৰা হ’ল। ধন্যবাদ।';

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
  String get highRiskSwipeUpForDetails => 'অধিক বিৱৰণ চাবলৈ ওপৰৰ ফালে সুইপ কৰক';

  @override
  String get riskLowLabel => 'অল্প ঝুঁকি';

  @override
  String get riskMediumLabel => 'মধ্যম ঝুঁকি — পৰীক্ষা কৰক';

  @override
  String get riskHighLabel => 'উচ্চ ঝুঁকি — সম্ভাব্য স্কেম';

  @override
  String get deleteMessageTitle => 'বাৰ্তা মচি পেলাব নে?';

  @override
  String get deleteMessageBody => 'আপুনি নিশ্চিত নে? ইয়াতকৈ কেৱল এল্ডাৰ শিল্ডৰ পৰা এই বাৰ্তা আঁতৰোৱা হ’ব।';

  @override
  String get deleteMessageConfirm => 'মচি পেলাওক';

  @override
  String get deleteMessageDeletedSnackbar => 'এল্ডাৰ শিল্ডৰ পৰা আঁতৰোৱা হ’ল।';

  @override
  String get languageSectionTitle => 'ভাষা';

  @override
  String get languageEnglishName => 'ইংৰাজী';

  @override
  String get languageBengaliName => 'বাংলা';

  @override
  String get languageKannadaName => 'কন্নড়';

  @override
  String get languageHindiName => 'হিন্দী';

  @override
  String get languageUrduName => 'উৰ্দু';

  @override
  String get languageAssameseName => 'অসমীয়া';

  @override
  String get languageTamilName => 'তামিল';

  @override
  String get languageMalayalamName => 'মালয়ালম';

  @override
  String get languageTeluguName => 'তেলুগু';

  @override
  String languageSectionSubtitle(String languageName) {
    return 'বৰ্তমান: $languageName';
  }

  @override
  String get snackbarUpdated => 'আপডেট সম্পূৰ্ণ';

  @override
  String get settingsAppearanceTitle => 'দেখাত কেনেকুৱা';

  @override
  String get settingsThemeSystem => 'চিষ্টেম';

  @override
  String get settingsThemeLight => 'লাইট';

  @override
  String get settingsThemeDark => 'ডাৰ্ক';

  @override
  String get settingsTextSizeTitle => 'আখৰৰ আকাৰ';

  @override
  String get settingsTextSizeDescription => 'আখৰ ডাঙৰ বা সৰু কৰি সুবিধাজনক আকাৰলৈ ঠিক কৰক। সলনি তৎক্ষণাৎ প্ৰযোজ্য হ’ব।';

  @override
  String get settingsTextSizeSample => 'এল্ডাৰ শিল্ডে আপোনাক স্কেম বাৰ্তাৰ পৰা সুৰক্ষিত ৰাখে।';

  @override
  String get settingsLegalTitle => 'আইনী ও তথ্য';

  @override
  String get settingsPrivacyPolicyTitle => 'গোপনীয়তা নীতি';

  @override
  String get settingsPrivacyPolicySubtitle => 'আপোনাৰ তথ্য আমি কেনেকৈ ব্যৱহাৰ কৰোঁ';

  @override
  String get settingsPermissionsExplainedTitle => 'অনুমতিৰ বিৱৰণ';

  @override
  String get settingsPermissionsExplainedSubtitle => 'প্ৰত্যেক অনুমতি কিয় প্ৰয়োজন';

  @override
  String get settingsSensitivityTitle => 'সংবেদনশীলতা';

  @override
  String get settingsSensitivityLabelConservative => 'কম সতৰ্কবাৰ্তা';

  @override
  String get settingsSensitivityLabelBalanced => 'সন্তুলিত';

  @override
  String get settingsSensitivityLabelSensitive => 'বেশি সতৰ্কবাৰ্তা';

  @override
  String get settingsSensitivityDescConservative => 'কেৱল অতি স্পষ্ট স্কেমসমূহ ধৰা পৰে। আপুনি যদি কম সতৰ্কবাৰ্তা পছন্দ কৰে, তেন্তে ই ভাল।';

  @override
  String get settingsSensitivityDescBalanced => 'বেশিৰভাগ লোকৰ বাবে ভাল। ধৰা পোৱা স্কেম আৰু অপ্রয়োজনীয় সতৰ্কবাৰ্তাৰ মাজত এটা ভাল সন্তুলন।';

  @override
  String get settingsSensitivityDescSensitive => 'বেশি স্কেম ধৰে, কিন্তু কেতিয়াবা সুৰক্ষিত বাৰ্তাকো ফ্লেগ কৰিব পাৰে।';

  @override
  String get settingsTrustedContactsTitle => 'ভৰসাযোগ্য যোগাযোগ';

  @override
  String get settingsTrustedContactsNone => 'কোনো নাই';

  @override
  String settingsTrustedContactsCount(int count) {
    return '$countটা যোগাযোগ';
  }

  @override
  String get settingsTrustedContactsExplanation => 'আপুনি হোম স্ক্ৰিন বা স্কেম সতর্কতা দেখুওৱা স্ক্ৰিনৰ পৰা এটা টেপতেই এইসকলক কল কৰিব পাৰে। সূচীৰ প্ৰথম যোগাযোগজন মূল \"কল\" বুটামত দেখুওৱা হয়।';

  @override
  String get settingsTrustedContactsAddContactTitle => 'যোগাযোগ যোগ কৰক';

  @override
  String get settingsTrustedContactsAddContactSubtitle => 'নাম আৰু ফোন নম্বৰ লিখক';

  @override
  String get settingsTrustedContactsChooseFromContactsTitle => 'যোগাযোগৰ পৰা বাছনি কৰক';

  @override
  String get settingsTrustedContactsChooseFromContactsSubtitle => 'আপোনাৰ ফোনৰ যোগাযোগৰ পৰা নম্বৰ বাছনি কৰক';

  @override
  String get settingsTrustedContactsPickerUnavailable => 'এই প্ৰিভিউ বিল্ডত ডিভাইচ কন্টেক্ট পিকাৰ এতিয়াও উপলব্ধ নহয়।';

  @override
  String get settingsTrustedContactsRemoveDialogTitle => 'ভৰসাযোগ্য যোগাযোগ আঁতৰাব নে?';

  @override
  String get settingsTrustedContactsRemoveDialogBody => 'এই ব্যক্তিজন আরু ভৰসাযোগ্য যোগাযোগৰ তালিকা বা হোম স্ক্ৰিনত দেখা নাপাব।';

  @override
  String get settingsTrustedContactsRemoveDialogRemove => 'আঁতৰাওক';

  @override
  String get settingsAdvancedSectionTitle => 'এডভান্সড';

  @override
  String get settingsDeleteAllHistoryButton => 'সমস্ত হিস্টৰি মচি পেলাওক';

  @override
  String get settingsRerunPermissionsButton => 'অনুমতি পুনৰ চেক কৰক';

  @override
  String get settingsDeleteAllHistoryDialogTitle => 'সমস্ত হিস্টৰি মচি পেলাব নে?';

  @override
  String get settingsDeleteAllHistoryDialogBody => 'এই ডিভাইচৰ পৰা সকলো বিশ্লেষণ কৰা বাৰ্তা আৰু কারণ স্থায়ীভাৱে মচি পেলোৱা হ’ব। ই ঘূৰাই আনিব নোৱাৰি।';

  @override
  String get settingsDeleteAllHistoryDialogConfirm => 'সকলো মচি পেলাওক';

  @override
  String get settingsHistoryDeletedSnackbar => 'হিস্টৰি মচি পেলোৱা হ’ল';

  @override
  String get settingsRerunPermissionsSnackbar => 'অনুমতিৰ চেক সম্পূৰ্ণ। যদি আপুনি এতিয়া অনুমতি দিলে, তেন্তে এপখন পুনৰ আৰম্ভ কৰক।';

  @override
  String get settingsOverlayTitle => 'অন্য এপৰ ওপৰত ইমাৰ্জেঞ্চি পপ-আপ';

  @override
  String get settingsOverlaySubtitleEnabled => 'অন: উচ্চ ঝুঁকিৰ সতর্কতা অন্য এপৰ ওপৰতো দেখা যাব। আপুনি অন্য এপত থাকোতে সতৰ্ক কৰিবলৈ ই সুপারিশকৃত।';

  @override
  String get settingsOverlaySubtitleDisabled => 'অফ: এণ্ড্ৰয়েড ওভাৰলে অনুমতি অন কৰিবৰ বাবে ইয়াত টেপ কৰক। আপুনি অন্য এপ ব্যৱহাৰ কৰোঁতে সতৰ্ক হোৱা বাবে ই অন ৰখা ভাল।';

  @override
  String get settingsHowItWorksTitle => 'এল্ডাৰ শিল্ডে কেনেকৈ কাম কৰে';

  @override
  String get settingsHowItWorksSubtitle => 'আমি কি চাওঁ, কেতিয়া সতর্ক কৰোঁ, আৰু আপুনি কি কৰিব';

  @override
  String get settingsAboutTitle => 'এল্ডাৰ শিল্ড সম্বন্ধে';

  @override
  String get settingsAddTrustedDialogTitle => 'ভৰসাযোগ্য যোগাযোগ যোগ কৰক';

  @override
  String get settingsAddTrustedDialogConsent => 'তেওঁলোকক হোম স্ক্ৰিন বা স্কেম সতর্কতা স্ক্ৰিনৰ পৰা একে টেপতে কল কৰিব পৰা যায়।';

  @override
  String get settingsAddTrustedDialogConfirm => 'যোগ কৰক';

  @override
  String get settingsEditTrustedDialogTitle => 'ভৰসাযোগ্য যোগাযোগ সম্পাদনা কৰক';

  @override
  String get settingsEditTrustedDialogConfirm => 'ছেভ কৰক';

  @override
  String get settingsContactNameLabel => 'নাম';

  @override
  String get settingsContactNameHint => 'যেনে: মোৰ ল’ৰা';

  @override
  String get settingsContactNumberLabel => 'ফোন নম্বৰ';

  @override
  String get settingsContactNumberHint => 'যেনে: +91 98765 43210';

  @override
  String get settingsContactDialogCancel => 'বাতিল';

  @override
  String get settingsContactInvalidNumber => 'অনুগ্ৰহ কৰি এটা বৈধ ফোন নম্বৰ লিখক';

  @override
  String get howItWorksBulletWhatWeCheck => 'আমি কি চাওঁ: আমি আপোনাৰ SMS পঢ়োঁ আৰু স্কেমৰ লক্ষণ বিচাৰোঁ — সন্দেহজনক লিঙ্ক, অতি তাড়াহুড়া বা ভয় দেখুৱা ভাষা, OTP বা বেংক তথ্য বিচৰা, আৰু এনে বাৰ্তা যি আপোনাৰ বেংক বা পৰিচিত সেৱাৰ দৰে সাজি আহে।';

  @override
  String get howItWorksBulletWhenWeAlert => 'আমি কেতিয়া সতর্ক কৰোঁ: যদি কোনো বাৰ্তা ঝুঁকিপূৰ্ণ দেখায়, আমি আপোনাক জনাওঁ। অতি উচ্চ ঝুঁকিৰ বাৰ্তাৰ বাবে এপ বেকগ্ৰাউণ্ডত থাকিলেও পপ-আপ দেখুৱাব পাৰো আৰু বাৰ্তাটো \"মেছেজ\" টেবত দেখুওৱা হয়।';

  @override
  String get howItWorksBulletWhatToDo => 'সতর্কতা দেখিলে কি কৰিব: বাৰ্তাৰ কোনো লিঙ্কত টেপ নকৰিব। আপুনি \"ই স্কেম\" বা \"ই সুৰক্ষিত\" বাছি আমি কেনেকৈ শিখোঁতে সহায় কৰিব পাৰে। সৰ্বশ্ৰেষ্ঠ পদক্ষেপ: সতর্কতা স্ক্ৰিন বা হোমৰ পৰা আপোনাৰ ভৰসাযোগ্য যোগাযোগক কল কৰক।';

  @override
  String get howItWorksBulletCallTrusted => 'ভৰসাযোগ্য যোগাযোগক কেনেকৈ কল কৰিব: হোম স্ক্ৰিনৰ ডাঙৰ \"কল [নাম]\" বুটামত যিকোনো সময়ত টেপ কৰক — বিশেষকৈ যেতিয়া চিন্তাজনক বাৰ্তা আহে। আমি সম্ভাব্য স্কেম দেখুওৱা সতর্কতা স্ক্ৰিনৰপৰােও আপুনি কল কৰিব পাৰে।';

  @override
  String get howItWorksSeeWarningCta => 'সতর্কতা কেনেকুৱা দেখা যায় চাওক';

  @override
  String get permissionsIntro => 'এল্ডাৰ শিল্ডে অনুমতিসমূহ কেৱল স্কেমৰ পৰা ৰক্ষাৰ বাবে ব্যৱহাৰ কৰে। আপুনি যিকোনো অনুমতি নো দিবও পাৰে; তেনে হ’লে সুৰক্ষা অলপ কম হ’ব, কিন্তু এপ চলি থাকিব।';

  @override
  String get permissionsSmsTitle => 'বাৰ্তা (SMS)';

  @override
  String get permissionsSmsBody => 'আমি ইনকামিং SMS গ্ৰহণ কৰি তাত স্কেমৰ লক্ষণ (যেনে সন্দেহজনক লিঙ্ক, OTP ফিশিং, বেংক-সংক্রান্ত শব্দ) আছে নে নাই চাওঁ আৰু প্ৰয়োজন হ’লে আপোনাক সতর্ক কৰোঁ। কোনো বাৰ্তাৰ বিষয়বস্তু আপোনাৰ ডিভাইচৰ বাহিৰলৈ নাপঠোৱা হয়। আপুনি ছেটিংছৰ পৰা সকলো বিশ্লেষণ কৰা হিস্টৰি মচি পেলাব পাৰে।';

  @override
  String get permissionsPhoneStateTitle => 'ফোন (অৱস্থা পঢ়া)';

  @override
  String get permissionsPhoneStateBody => 'আমি জানিব লাগিছে আপুনি কেতিয়া কলত আছে, যাতে কল চলি থকা অৱস্থাত OTP আহিলে ঝুঁকিৰ স্তৰ বঢ়াব পাৰোঁ (এইটো এটা সাধাৰণ স্কেম পেটাৰ্ণ)। আমি কল ৰেকৰ্ড নকৰোঁ, অডিঅ’ নুশুঁ, আৰু কল লগ নাপঢ়োঁ।';

  @override
  String get permissionsPhoneCallTitle => 'ফোন (কল কৰা)';

  @override
  String get permissionsPhoneCallBody => 'যাতে আপুনি হোম বা সতর্কতা স্ক্ৰিনৰ পৰা \"ভৰসাযোগ্য যোগাযোগক কল কৰক\" বুটাম টেপ কৰিব পাৰে। এপ কেৱল তেতিয়াহে কল আৰম্ভ কৰে যেতিয়া আপুনি বুটাম টেপ কৰে, আৰু কেৱল সেই নম্বৰত যাক আপুনি ভৰসাযোগ্য যোগাযোগ হিচাপে যোগ কৰিছে।';

  @override
  String get permissionsNotificationsTitle => 'নোটিফিকেশন';

  @override
  String get permissionsNotificationsBody => 'যেতিয়া আমি সন্দেহজনক বা উচ্চ ঝুঁকিপূৰ্ণ বাৰ্তা পাঁও, তেতিয়া আপুনি যাতে সোনকালে জানিব পাৰে সেয়া নিশ্চিত কৰোঁ। আপুনি চিস্টেম ছেটিংছত নোটিফিকেশন অফ কৰিব পাৰে; তেতিয়াও আপুনি এপ ব্যৱহাৰ কৰিব পাৰিব।';

  @override
  String get permissionsOverlayTitle => 'অন্য এপৰ ওপৰত দেখা দেখুৱানো (ঐচ্ছিক)';

  @override
  String get permissionsOverlayBody => 'যদি আপুনি ছেটিংছত এণ্ড্ৰয়েড ওভাৰলে অনুমতি অন কৰে, তেন্তে উচ্চ ঝুঁকিৰ বাৰ্তা আহিলে এল্ডাৰ শিল্ডে অন্য এপৰ ওপৰতো ইমাৰ্জেঞ্চি সতর্কতা দেখুৱাব পাৰিব। এইটো সম্পূৰ্ণভাবে ঐচ্ছিক আৰু ব্যক্তিগত সুৰক্ষাৰ বাবে।';

  @override
  String get privacyTitle => 'গোপনীয়তা নীতি';

  @override
  String get privacySection1Title => '1. আমি কোন';

  @override
  String get privacySection1Body => 'এল্ডাৰ শিল্ড এটা এণ্ড্ৰয়েড এপ, যিয়ে ডিভাইচতেই বাৰ্তাসমূহ বিশ্লেষণ কৰি আৰু সন্দেহজনক লাগিলে সতর্ক কৰি, বয়োজ্যেষ্ঠ ব্যৱহাৰকাৰীক SMS আৰু কল-সংক্রান্ত স্কেমৰ পৰা বাচিবলৈ সহায় কৰে।';

  @override
  String get privacySection2Title => '2. আমি কোন ধৰণৰ তথ্য প্ৰসেচিং কৰোঁ';

  @override
  String get privacySection2Paragraphs => 'সকলো প্ৰসেচিং আপোনাৰ ডিভাইচতেই হয়। আমি আপোনাৰ বাৰ্তা, কলৰ অৱস্থা বা অন্য কোনো ব্যক্তিগত তথ্য আমাৰ ছাৰ্ভাৰ বা তৃতীয় পক্ষলৈ পঠাই নাপঠাও।\n\nবাৰ্তা তথ্য: আপুনি SMS পালে, এপে সেই বাৰ্তাৰ প্ৰেৰণকাৰী, মূল পাঠ আৰু সময় পঢ়ে। এই তথ্য কেৱল ডিভাইচত চলা স্কেম ডিটেকশ্বনৰ বাবে ব্যৱহাৰ হয়। ফলাফল কেৱল আপোনাৰ ডিভাইচত সংৰক্ষণ হৈ থাকে। আপুনি যিকোনো সময়ত ছেটিংছ → সমস্ত হিস্টৰি মচি পেলাওক বাছি এইবোৰ আঁতৰাব পাৰে।\n\nক’ল অৱস্থা: এপে চায় আপুনি বৰ্তমানে কলত আছেনে নাই। আমি কল ৰেকৰ্ড নকৰোঁ, অডিঅ’ নুশুঁ, বা কল লগ নাপঢ়োঁ। কল অৱস্থা কেৱল ডিটেকশ্বন উন্নত কৰিবলৈ (যেনে কল চলি থকা অৱস্থাত OTP আহিলে আপনাক বেছি সতৰ্ক ক’বলৈ) ব্যৱহাৰ হয়।\n\nছেটিংছ আৰু ভৰসাযোগ্য যোগাযোগ: এইসকল কেৱল আপোনাৰ ডিভাইচৰ ছিকিউৰ ষ্ট’ৰেজত ৰখা হয়। ভৰসাযোগ্য যোগাযোগ কেৱল যাতে আপুনি \"ভৰসাযোগ্য যোগাযোগক কল কৰক\" বুটাম টেপ কৰি দ্রুত কল কৰিব পাৰে সেই উদ্দেশ্যে ব্যৱহাৰ হয়। আমি কেতিয়াও স্বয়ংক্ৰিয়ভাৱে তেখেতসকলক কল বা বাৰ্তা নাপঠাও।';

  @override
  String get privacySection3Title => '3. আমি কি নকৰোঁ';

  @override
  String get privacySection3Paragraphs => 'আমি আপোনাৰ SMSৰ পাঠ, কলৰ অৱস্থা বা কন্টেক্ট লিষ্ট ইণ্টাৰনেটলৈ পঠাই নাপঠাও।\n\nআমি আপোনাৰ তথ্য বিজ्ञাপন দাতা বা ডেটা ব্ৰ’কাৰে বিক্ৰী, ভাড়া বা শ্বেয়াৰ নকৰোঁ।\n\nএপ ব্যৱহাৰ কৰিবলৈ আপোনাক একাউন্ট খুলিবলৈ বা ছাইন ইন কৰিবলৈ বাধ্য নকৰোঁ। প্ৰয়োজনীয় অনুমতি দিয়াৰ পিছতো এপ সম্পূৰ্ণভাবে অফলাইন চলি থাকিব পাৰে।\n\nআমি RCS/চেট বাৰ্তা নপঢ়োঁ বা বিশ্লেষণ নকৰোঁ; কেৱল সাধাৰণ SMS সমৰ্থিত।';

  @override
  String get privacySection4Title => '4. অনুমতি আৰু সেইবোৰ কিয় প্ৰয়োজন';

  @override
  String get privacySection4Paragraphs => 'SMS (ৰিচিভ/ৰিড): ইনকামিং SMS পঢ়ি স্কেম পেটাৰ্ণ চিনাক্ত কৰি আৰু প্ৰয়োজন হ’লে আপনাক সতর্ক কৰাটো নিশ্চিত কৰিবলৈ।\n\nফোন (কল অৱস্থা পঢ়া): আপুনি কেতিয়া কলত আছেনে, সেইটো জানিবলৈ; যাতে কল চলি থাকোতে OTP আহিলে ই উচ্চ ঝুঁকি হিচাপে চিহ্নিত কৰিব পাৰোঁ। আমি কোনো কল ৰেকৰ্ড বা শুনা নকৰোঁ।\n\nফোন (কল কৰা): যাতে আপুনি \"ভৰসাযোগ্য যোগাযোগক কল কৰক\" বুটাম টেপ কৰি দ্রুত কল কৰিবলৈ সক্ষম হয়। আমি কেৱল আপুনি ভৰসাযোগ্য যোগাযোগ হিচাপে যোগ কৰা নম্বৰতহে আৰু কেৱল আপুনি বুটাম টেপ কৰিলে কল কৰোঁ।\n\nনোটিফিকেশন: সন্দেহজনক বা উচ্চ ঝুঁকিপূৰ্ণ বাৰ্তা পোৱা গেলে আপনাক সোনকালে জনাবলৈ।\n\nআপুনি \"এই প্ৰেৰণকাৰীক ব্লক কৰক\" বাছি ল’লে, এপে আপোনাৰ ডিফ’ল্ট মেছেজিং এপ খুলিব পাৰে; এল্ডাৰ শিল্ডে নিজে এপৰ পৰা কোনো SMS নাপঠায়।';

  @override
  String get privacySection5Title => '5. তথ্য কিমান দিন ৰখা হয় আৰু আপোনাৰ বিকল্প';

  @override
  String get privacySection5Paragraphs => 'বিশ্লেষণ কৰা বাৰ্তা আৰু কাৰণ: এইসকল কেৱল আপোনাৰ ডিভাইচতে থাকে, যেতিয়ালৈ আপুনি ছেটিংছ → সমস্ত হিস্টৰি মচি পেলাওক নাছানিত।\n\nছেটিংছ আৰু ভৰসাযোগ্য যোগাযোগ: আপুনি সলনি, আঁতৰোৱা বা এপ আনইনষ্টল নকৰালৈকে ডিভাইচতেই থাকে।\n\nআমি আপোনাৰ কোনো তথ্যৰ কপি ছাৰ্ভাৰত জমা নেৰাখো, কিয়নো আমি ই একেটোৱেও সংগ্ৰহ নকৰো।';

  @override
  String get privacySection6Title => '6. শিশুসকল আৰু সংবেদনশীল ব্যৱহাৰকাৰী';

  @override
  String get privacySection6Paragraphs => 'এই এপ মূলত বয়োজ্যেষ্ঠ আৰু অন্য সংবেদনশীল ব্যৱহাৰকাৰীক স্কেমৰ পৰা বাচিবলৈ সহায় কৰিবলৈ ডিজাইন কৰা হৈছে। আমি শিশুসমূহৰ তথ্য এনে ধৰণে সংগ্ৰহ নকৰোঁ যাৰ বাবে আইনগতভাবে পিতৃ-মাতৃৰ সম্মতিৰ প্ৰয়োজন হ’ব; এপে কোনো তথ্য ডিভাইচৰ বাহিৰলৈ নেপঠায়।\n\nআপুনি যদি কোনো অন্যলোকৰ (যেনে মাতাপিতাৰ) বাবে এই এপ ছেটআপ কৰি আছে, তেন্তে অনুমতি আৰু এই নীতিৰ বিষয়ে সৰল ভাষাত ব্যাখ্যা কৰিবৰ বাবে আমি সুপারিশ কৰোঁ।';

  @override
  String get privacySection7Title => '7. এই নীতিত পৰিবর্তন';

  @override
  String get privacySection7Paragraphs => 'আমি যদি এই নীতিত পৰিবর্তন কৰোঁ (যেনে ভৱিষ্যতৰ সংস্কৰণত ঐচ্ছিক ক্লাউড ফিচাৰ যোগ কৰোঁ), তেন্তে আমি এই নথিপত্ৰ আপডেট কৰিম আৰু আইন বা ষ্ট’ৰ নীতিমালা অনুসৰি প্ৰয়োজন হ’লে আপনাক জনাম বা অনুমতি বিচাৰিম।';

  @override
  String get privacySection8Title => '8. যোগাযোগ';

  @override
  String get privacySection8Body => 'এল্ডাৰ শিল্ড সম্পৰ্কিত গোপনীয়তা-সংক্রান্ত কোনো প্ৰশ্ন বা অনুৰোধ থাকিলে, অনুগ্ৰহ কৰি ইয়াত যোগাযোগ কৰক: [ইয়াত আপোনাৰ ইমেইল বা ছাপোৰ্ট URL লিখক]।';

  @override
  String get privacyLastUpdatedNote => 'সর্বশেষ আপডেট: ব্লক 10। ৰিলিজৰ আগতে এই প্লেচহোল্ডাৰবোৰ বাস্তৱ তথ্যৰে সলনি কৰক।';

  @override
  String get aboutTagline => 'বয়োজ্যেষ্ঠ ব্যৱহাৰকাৰীৰ বাবে ডিভাইচতে স্কেমৰ পৰা সুৰক্ষা।';

  @override
  String get messagesAppBarTitle => 'বাৰ্তা';

  @override
  String get messagesFilterAll => 'সকলো';

  @override
  String get messagesFilterHighRisk => 'উচ্চ ঝুঁকি';

  @override
  String get messagesFilterAllSemanticsLabel => 'সকলো বাৰ্তা দেখুৱাওক';

  @override
  String get messagesFilterAllSemanticsHint => 'সকলো বিশ্লেষণ কৰা বাৰ্তা চাবলৈ ডাবল-টেপ কৰক।';

  @override
  String get messagesFilterHighRiskSemanticsLabel => 'কেৱল উচ্চ ঝুঁকিৰ বাৰ্তা দেখুৱাওক';

  @override
  String get messagesFilterHighRiskSemanticsHint => 'সৰ্বাধিক গুৰুত্বপূর্ণ সতর্কতাসমূহ চাবলৈ ডাবল-টেপ কৰক।';

  @override
  String get messagesErrorTitle => 'বাৰ্তা লোড কৰোঁতে সমস্যাৰ সৃষ্টি হ’ল।';

  @override
  String get messagesErrorSubtitle => 'পুনৰ চেষ্টা কৰিবলৈ তললৈ টানি ছাড়ক।';

  @override
  String get messagesEmptyTitle => 'এতিয়ালৈকে কোনো বাৰ্তা বিশ্লেষণ কৰা হোৱা নাই। এল্ডাৰ শিল্ডে নতুন বাৰ্তা স্বয়ংক্ৰিয়ভাৱে চাব।';

  @override
  String get messagesEmptySubtitle => 'যেতিয়া আমি কিবা সন্দেহজনক পাম, আমি আপোনাক জনাম আৰু আপুনি ইয়াৰ পৰা সেই বাৰ্তা খুলি চাব পাৰিব।';

  @override
  String get messagesRefreshSnackbar => 'তালিকা আপডেট হ’ল';

  @override
  String get messagesLoadingHeader => 'বাৰ্তা লোড হৈ আছে…';

  @override
  String messagesDateToday(String time) {
    return 'আজি, $time';
  }

  @override
  String messagesDateYesterday(String time) {
    return 'যোৱাকালী, $time';
  }

  @override
  String messagesDateOther(String month, int day, String time) {
    return '$month $day, $time';
  }

  @override
  String onboardingStepOf(int step, int total) {
    return 'পদক্ষেপ $step / $total';
  }

  @override
  String get onboardingWelcomeBody1 => 'এল্ডাৰ শিল্ডে আপোনাৰ বাৰ্তা আৰু কলসমূহত নজৰ ৰাখে, যাতে স্কেম হ’লে আগতেই আপোনাক সতর্ক কৰিব পাৰে।';

  @override
  String get onboardingWelcomeBody2 => 'যদি আপুনি কেতিয়াবা নিশ্চিন্ত নহয়, তেন্তে এটা টেপতে ভৰসাযোগ্য ব্যক্তিজনক কল কৰিব পাৰে।';

  @override
  String get onboardingGetStarted => 'আৰম্ভ কৰক';

  @override
  String get onboardingPermissionsTitle => 'আমাক এক্সেছ কিয় লাগিব';

  @override
  String get onboardingPermissionsBulletMessages => 'বাৰ্তা: যাতে আমি আপোনাৰ লেখা পঢ়ি স্কেম যেন লাগিলে আপোনাক সতর্ক কৰিব পাৰোঁ।';

  @override
  String get onboardingPermissionsBulletPhone => 'ফোন: যাতে আমি জানো আপুনি কেতিয়া কলত আছে। স্কেমৰ লোকসকল সাধাৰণতে কল চলি থাকোতে OTP বিচাৰে।';

  @override
  String get onboardingPermissionsBody1 => 'তলৰ \"অনুমতি দিয়ক\" বুটাম টেপ কৰিলে, আপোনাৰ ডিভাইছে এইবোৰৰ অনুমতি বিচাৰিব: বাৰ্তা, ফোন আৰু নোটিফিকেশ্বন (এপ বন্ধ থকা সময়তো সম্ভাব্য স্কেমৰ বিষয়ে আপনাক জনাবলৈ)।';

  @override
  String get onboardingPermissionsBody2 => 'আমিও আপোনাৰ বাৰ্তা কেৱল স্কেম পৰীক্ষণৰ বাবে পঢ়ো, অন্য কোনো কাৰণতে নহয়।';

  @override
  String get onboardingPermissionsRetryWarning => 'কিছুমান অনুমতি নাকচ কৰা হৈছে। আপুনি অনুমতি নিদিয়া পৰ্যন্ত সুৰক্ষা সীমিত থাকিব।';

  @override
  String get onboardingPermissionsPrimaryAllow => 'অনুমতি দিয়ক';

  @override
  String get onboardingPermissionsPrimaryRetry => 'পুনৰ চেষ্টা কৰক';

  @override
  String get onboardingSkipForNow => 'এতিয়ালৈ এৰক';

  @override
  String get onboardingTrustedTitle => 'এজন ভৰসাযোগ্য যোগাযোগ যোগ কৰক';

  @override
  String get onboardingTrustedBody1 => 'এনে এজনক বাছনি কৰক, যাক আপুনি চিন্তাজনক বাৰ্তা পালে কল কৰিব বিচাৰে — যেনে, পৰিয়ালৰ এজন সদস্য বা ওচৰৰ বন্ধু।';

  @override
  String get onboardingTrustedBody2 => 'তেওঁলোকক যোগ কৰাৰ পিছত, আপুনি হোম স্ক্ৰিন বা আমি স্কেম সতর্কতা দেখুওৱা স্ক্ৰিনৰ পৰা এটাহে টেপত এই ব্যক্তিজনক কল কৰিব পাৰে।';

  @override
  String get onboardingTrustedAddFromContacts => 'যোগাযোগৰ পৰা যোগ কৰক';

  @override
  String get onboardingTrustedAddFromContactsUnavailable => 'এই প্ৰিভিউ সংস্কৰণত ডিভাইচ কন্টেক্ট পিকাৰ এতিয়াও উপলব্ধ নহয়।';

  @override
  String get onboardingTrustedOrEnterManually => 'নহ’লে নম্বৰ হাতেহাতে লিখক:';

  @override
  String get onboardingTrustedDone => 'হৈ গ’ল';

  @override
  String get onboardingTrustedSeeWarningCta => 'সতর্কতা কেনেকুৱা দেখা যায় চাওক';

  @override
  String get onboardingTrustedMissingFields => 'অনুগ্ৰহ কৰি নাম আৰু নম্বৰ দুয়োটা লিখক';

  @override
  String get launchGateChecking => 'পৰীক্ষা কৰি আছে…';

  @override
  String get exampleWarningBanner => 'ই কেৱল এটা উদাহৰণ। কোনো বাস্তৱ বাৰ্তা বা এক্সন ন’হোৱা।';

  @override
  String get exampleWarningSnackbar => 'ই কেৱল উদাহৰণ আছিল। কোনো এক্সন লোৱা হোৱা নাই।';

  @override
  String get exampleWarningButton => 'বুজিলো — ই কেৱল উদাহৰণ আছিল';

  @override
  String get exampleWarningSenderUnknown => 'অজ্ঞাত';

  @override
  String get exampleWarningBody => 'আপোনাৰ বেংক একাউণ্ট 24 ঘণ্টাৰ ভিতৰত ব্লক কৰা হ’ব। ভেৰিফাই কৰিবলৈ ইয়াত ক্লিক কৰক: http://secure-bank-verify.com. এই তথ্য আন কোনোবাৰ সৈতে ভাগ নকৰিব।';

  @override
  String get exampleWarningReasonSuspiciousLink => 'এটা সন্দেহজনক লিঙ্ক আছে';

  @override
  String get exampleWarningReasonPretendBank => 'আপোনাৰ বেংকৰ দৰে সাজি কথা কৰিছে';

  @override
  String get exampleWarningReasonUrgentLanguage => 'অতি তাড়াহুড়া বা ডাঙৰ ভয় দেখুওৱা ভাষা ব্যৱহাৰ কৰিছে';

  @override
  String get reasonShortUrl => 'এটা সৰু বা সন্দেহজনক লিঙ্ক আছে';

  @override
  String get reasonOtpMention => 'OTP বা এবাৰ ব্যৱহাৰযোগ্য কোড বিচাৰে বা উল্লেখ কৰিছে';

  @override
  String get reasonUrgentLanguage => 'তাড়াহুড়া বা ভয় দেখুওৱা ভাষা ব্যৱহাৰ কৰিছে';

  @override
  String get reasonBankKyc => 'বেংক একাউণ্ট, KYC বা পেমেণ্ট ডিটেইলৰ কথা কৈছে';

  @override
  String get reasonPaymentRequest => 'আপোনাক ধন পঠিয়াবলৈ বা পেমেণ্ট অনুমোদন কৰিবলৈ ক‘ছে';

  @override
  String get reasonPrizeLottery => 'ইনাম/লটাৰী স্কেম যেন লাগিছে';

  @override
  String get reasonParcelDelivery => 'সন্দেহজনক পাৰ্সেল বা ডেলিভাৰী সমস্যাৰ কথা কৈছে';

  @override
  String get reasonCryptoInvestment => 'বিপদজনক ক্ৰিপ্ত’ বিনিয়োগ বা নিশ্চিত লাভৰ প্রতিশ্ৰুতি দিছে';

  @override
  String get reasonSenderSuspicious => 'প্ৰেৰণকাৰীৰ নাম অস্বাভাবিক বা সন্দেহজনক দেখি লাগে';

  @override
  String get reasonInCallOtp => 'আপুনি কলত থকা ভিতৰতে OTP আহিছে — এইটো অতি সাধাৰণ স্কেম পেটাৰ্ণ';

  @override
  String messageFromLabel(String sender) {
    return 'প্ৰেৰণকাৰী: $sender';
  }

  @override
  String get fullScreenWarningTitle => 'সম্ভাব্য স্কেম';

  @override
  String get fullScreenWarningClosingNote => 'এই স্ক্ৰিন বন্ধ কৰিলে আপোনাৰ ফোনৰ পৰা বাৰ্তাটো নোমচে।';

  @override
  String get fullScreenWarningDeleteAction => 'বাৰ্তা মচি পেলাওক';

  @override
  String get fullScreenWarningDeleteSnackbar => 'এল্ডাৰ শিল্ডৰ পৰা আঁতৰোৱা হ’ল। এতিয়া আপোনাৰ মেছেজিং এপ খুলি আছে যাতে আপুনি তাতেও ইচ্ছা কৰিলে মচি পেলাব পাৰে।';

  @override
  String get fullScreenWarningBlockSender => 'এই প্ৰেৰণকাৰীক ব্লক কৰক (মেছেজিং এপ খোলিব)';

  @override
  String get roleSelectionTitle => 'এইটো কাৰ বাবে ছেটআপ কৰিছে?';

  @override
  String get roleSelectionSubtitle => 'এইটোৱে অভিজ্ঞতা ব্যক্তিগতকৰণ কৰাত সহায় কৰে।';

  @override
  String get caregiverOption => 'মই মোৰ অভিভাৱক / পৰিয়ালৰ সদস্যৰ বাবে ছেটআপ কৰিছো';

  @override
  String get selfProtectionOption => 'মই নিজকে সুৰক্ষিত কৰিব বিচাৰো';

  @override
  String get namePersonTitle => 'আপুনি কাক সুৰক্ষিত কৰিছে?';

  @override
  String get namePersonSubtitle => 'এটা নাম বাছনি কৰক বা নিজে টাইপ কৰক।';

  @override
  String get presetNameMaa => 'মা';

  @override
  String get presetNamePapa => 'দেউতা';

  @override
  String get presetNameDadi => 'আইতা';

  @override
  String get presetNameDada => 'ককা';

  @override
  String get presetNameNani => 'নানি';

  @override
  String get presetNameNana => 'নানা';

  @override
  String get namePersonCustomHint => 'বা এটা নাম টাইপ কৰক';

  @override
  String get namePersonContinue => 'আগবাঢ়ক';

  @override
  String get namePersonValidation => 'অনুগ্ৰহ কৰি নাম বাছনি বা প্ৰৱেশ কৰক';

  @override
  String get guardianTitle => 'নিজকে গাৰ্ডিয়ান হিচাপে যোগ কৰক';

  @override
  String get guardianSubtitle => 'তেওঁলোকৰ ফোনত সন্দেহজনক বাৰ্তা আহিলে আমি আপোনাক জনাম।';

  @override
  String get guardianNameLabel => 'আপোনাৰ নাম';

  @override
  String get guardianNameHint => 'যেনে ৰাহুল';

  @override
  String get guardianPhoneLabel => 'আপোনাৰ WhatsApp / ফোন নম্বৰ';

  @override
  String get guardianPhoneHint => 'যেনে +91 98765 43210';

  @override
  String get guardianContinue => 'আগবাঢ়ক';

  @override
  String get guardianValidation => 'অনুগ্ৰহ কৰি আপোনাৰ নাম আৰু ফোন নম্বৰ প্ৰৱেশ কৰক';

  @override
  String get yourNameTitle => 'আপোনাৰ নাম কি?';

  @override
  String get yourNameSubtitle => 'যাতে আমি আপোনাৰ সুৰক্ষা ব্যক্তিগতকৰণ কৰিব পাৰো।';

  @override
  String get yourNameHint => 'আপোনাৰ নাম প্ৰৱেশ কৰক';

  @override
  String get yourNameContinue => 'আগবাঢ়ক';

  @override
  String get yourNameValidation => 'অনুগ্ৰহ কৰি আপোনাৰ নাম প্ৰৱেশ কৰক';

  @override
  String get addGuardianOptional => 'পৰিয়ালৰ কোনো মানুহ চিন্তিত আছেনে? এজন গাৰ্ডিয়ান যোগ কৰক';

  @override
  String get addGuardianOptionalSubtitle => 'আপুনি সন্দেহজনক বাৰ্তা পালে তেওঁলোকক জনাব পৰা যায়।';

  @override
  String get onboardingFinish => 'ছেটআপ সম্পূৰ্ণ কৰক';

  @override
  String guardianPlanMonthlyPrice(String price) {
    return '₹$price';
  }

  @override
  String guardianPlanYearlyPrice(String price) {
    return '₹$price';
  }

  @override
  String get guardianPlanTitle => 'গাৰ্ডিয়ান প্লান';

  @override
  String get guardianPlanSubtitle => 'পৰিয়ালৰ সদস্যক সন্দেহজনক বাৰ্তা আহিলে জানক';

  @override
  String get guardianPlanWhatYouGet => 'আপুনি কি পাব';

  @override
  String get guardianPlanBenefitAlerts => 'সন্দেহজনক বাৰ্তাত WhatsApp/SMS সতৰ্কবাৰ্তা';

  @override
  String get guardianPlanBenefitHeartbeat => 'দৈনিক চেক-ইন: তেওঁলোকৰ ফোন সুৰক্ষিত জানক';

  @override
  String get guardianPlanBenefitSummary => 'সাপ্তাহিক ভাবুকি সাৰাংশ';

  @override
  String get guardianPlanBenefitFamily => '3 পৰিয়ালৰ সদস্য সুৰক্ষিত কৰক';

  @override
  String get guardianPlanMonthlyFallback => 'মাহেকীয়া পৰিকল্পনা';

  @override
  String get guardianPlanYearlyFallback => 'বাৰ্ষিক পৰিকল্পনা — 33% সঞ্চয়';

  @override
  String get guardianPlanYearlySaveBadge => '33% সঞ্চয়';

  @override
  String get guardianPlanRestore => 'ক্ৰয় পুনৰুদ্ধাৰ কৰক';

  @override
  String get guardianPlanMaybeLater => 'পিছত';

  @override
  String get guardianPlanTerms => 'সেৱাৰ চৰ্ত';

  @override
  String get guardianPlanPrivacy => 'গোপনীয়তা নীতি';

  @override
  String get guardianPlanActiveSubtitle => 'গাৰ্ডিয়ান সতৰ্কবাৰ্তা, দৈনিক চেক-ইন, সাপ্তাহিক সাৰাংশ';

  @override
  String get guardianPlanUpgradeSubtitle => 'পৰিয়ালৰ সদস্যক সন্দেহজনক বাৰ্তা আহিলে জাননী পাওক';

  @override
  String get guardianPlanActiveBadge => 'সক্রিয়';
}
