// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'এল্ডার শিল্ড';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get homeAppBarTitle => 'এল্ডার শিল্ড';

  @override
  String get homePostOnboardingTitle => 'আপনি এখন সুরক্ষিত';

  @override
  String homePostOnboardingBody(String contactName) {
    return 'হোম থেকে আপনি যখন খুশি $contactName-কে ফোন করতে পারবেন।';
  }

  @override
  String get commonGotIt => 'ঠিক আছে';

  @override
  String get homeTrustedContactFallbackName => 'আপনার ভরসার মানুষ';

  @override
  String get permissionsDialogTitle => 'সুরক্ষা চালু করতে সেটিংসে যান';

  @override
  String get permissionsDialogBody => 'স্ক্যাম মেসেজ ধরতে এল্ডার শিল্ড‑এর এসএমএস এবং ফোন অ্যাক্সেস দরকার।\n\nএই অনুমতিগুলো চালু করতে কি অ্যাপ সেটিংস খুলবেন?';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get permissionsDialogOpenSettings => 'সেটিংস খুলুন';

  @override
  String get homeProtectionStatusLabel => 'সুরক্ষার অবস্থা';

  @override
  String get homeProtectionStatusProtected => 'সুরক্ষিত';

  @override
  String get homeProtectionStatusPermissionsNeeded => 'অনুমতি প্রয়োজন';

  @override
  String get homeEnableProtectionButton => 'সুরক্ষা চালু করুন';

  @override
  String homeTodayRiskSummaryWithCount(int count) {
    return 'আজ $count‑টি সন্দেহজনক মেসেজ ধরা হয়েছে।';
  }

  @override
  String get homeTodayRiskSummaryNoRisk => 'আজ কোনো সন্দেহজনক কার্যকলাপ নেই।';

  @override
  String get homeTodayRiskTapToSeeMessages => 'মেসেজগুলো দেখতে ট্যাপ করুন';

  @override
  String get commonView => 'দেখুন';

  @override
  String get homeAutoCheckInfo => 'এল্ডার শিল্ড নতুন মেসেজ নিজে থেকেই পরীক্ষা করে।';

  @override
  String homeCallTrustedButtonLabel(String name) {
    return '$name-কে ফোন করুন';
  }

  @override
  String get homeCallTooltipText => 'কোনো চিন্তার মেসেজ এলে এখানেই ট্যাপ করুন।';

  @override
  String get homeAddTrustedIntro => 'একজন ভরসার মানুষ যোগ করুন যাতে ভয়ানক মেসেজ এলে এক ট্যাপে তাকে ফোন করতে পারেন।';

  @override
  String get homeAddTrustedButton => 'ভরসার মানুষ যোগ করুন';

  @override
  String get homeWhyAddTrustedShow => 'ভরসার মানুষ কেন যোগ করব?';

  @override
  String get homeWhyAddTrustedHide => 'কারণ লুকোন';

  @override
  String get homeWhyAddTrustedExplanation => 'কখনও যদি কোনো উদ্বেগজনক মেসেজ আসে, তখন একা সিদ্ধান্ত না নিয়ে আপনি একটা বড় বোতাম ট্যাপ করে ভরসার কারও সঙ্গে কথা বলতে পারবেন।';

  @override
  String get homeTrustedContactsHeader => 'আপনার ভরসার মানুষ';

  @override
  String get highRiskHeaderTitle => 'সতর্কতা: এটা স্ক্যাম মেসেজ হতে পারে';

  @override
  String get highRiskHeaderBody => 'এই মেসেজের কোনো লিঙ্কে ট্যাপ করবেন না, আর কোনো কোড শেয়ার করবেন না।';

  @override
  String get highRiskWhyFlaggedTitle => 'এটা কেন ধরা হয়েছে:';

  @override
  String get actionScam => 'এটা স্ক্যাম';

  @override
  String get actionSafe => 'এটা নিরাপদ';

  @override
  String get actionTrustSender => 'Trust this sender';

  @override
  String get snackbarGenericError => 'কিছু ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get snackbarMarkedScam => 'স্ক্যাম হিসেবে চিহ্নিত করা হয়েছে। ধন্যবাদ।';

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
  String get highRiskSwipeUpForDetails => 'আরো বিস্তারিত দেখতে উপরে সোয়াইপ করুন';

  @override
  String get riskLowLabel => 'কম ঝুঁকি';

  @override
  String get riskMediumLabel => 'মাঝারি ঝুঁকি — দেখে নিন';

  @override
  String get riskHighLabel => 'উচ্চ ঝুঁকি — স্ক্যাম হতে পারে';

  @override
  String get deleteMessageTitle => 'মেসেজ মুছবেন?';

  @override
  String get deleteMessageBody => 'আপনি কি নিশ্চিত? এতে মেসেজটি এল্ডার শিল্ড থেকে মুছে যাবে।';

  @override
  String get deleteMessageConfirm => 'মুছুন';

  @override
  String get deleteMessageDeletedSnackbar => 'এল্ডার শিল্ড থেকে মুছে দেওয়া হয়েছে।';

  @override
  String get languageSectionTitle => 'ভাষা';

  @override
  String get languageEnglishName => 'ইংরেজি';

  @override
  String get languageBengaliName => 'বাংলা';

  @override
  String get languageKannadaName => 'কন্নড়';

  @override
  String get languageHindiName => 'হিন্দি';

  @override
  String get languageUrduName => 'উর্দু';

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
    return 'বর্তমান ভাষা: $languageName';
  }

  @override
  String get snackbarUpdated => 'আপডেট হয়েছে';

  @override
  String get settingsAppearanceTitle => 'দেখতে কেমন';

  @override
  String get settingsThemeSystem => 'সিস্টেম';

  @override
  String get settingsThemeLight => 'লাইট';

  @override
  String get settingsThemeDark => 'ডার্ক';

  @override
  String get settingsTextSizeTitle => 'হরফের আকার';

  @override
  String get settingsTextSizeDescription => 'বড় বা ছোট করে আরামদায়ক আকারে লেখাগুলো দেখুন। পরিবর্তন সঙ্গে সঙ্গে প্রযোজ্য হবে।';

  @override
  String get settingsTextSizeSample => 'এল্ডার শিল্ড আপনাকে স্ক্যাম মেসেজ থেকে সুরক্ষিত রাখে।';

  @override
  String get settingsLegalTitle => 'আইনগত ও তথ্য';

  @override
  String get settingsPrivacyPolicyTitle => 'গোপনীয়তার নীতি';

  @override
  String get settingsPrivacyPolicySubtitle => 'আপনার ডেটা আমরা কীভাবে ব্যবহার করি';

  @override
  String get settingsPermissionsExplainedTitle => 'পারমিশন নিয়ে তথ্য';

  @override
  String get settingsPermissionsExplainedSubtitle => 'প্রতিটি অনুমতি কেন দরকার';

  @override
  String get settingsSensitivityTitle => 'সংবেদনশীলতা';

  @override
  String get settingsSensitivityLabelConservative => 'কম সতর্কবার্তা';

  @override
  String get settingsSensitivityLabelBalanced => 'সামঞ্জস্যপূর্ণ';

  @override
  String get settingsSensitivityLabelSensitive => 'বেশি সতর্কবার্তা';

  @override
  String get settingsSensitivityDescConservative => 'শুধু খুব স্পষ্ট স্ক্যামগুলো ধরা হবে। যদি আপনি কম সতর্কবার্তা পছন্দ করেন, এটা ভালো।';

  @override
  String get settingsSensitivityDescBalanced => 'বেশিরভাগ মানুষের জন্য ভালো। স্ক্যাম ধরা আর অপ্রয়োজনীয় সতর্কবার্তার মধ্যে ভারসাম্য রাখে।';

  @override
  String get settingsSensitivityDescSensitive => 'আরও বেশি স্ক্যাম ধরবে, তবে কখনও কখনও নিরাপদ মেসেজকেও ভুল করে চিহ্নিত করতে পারে।';

  @override
  String get settingsTrustedContactsTitle => 'ভরসার মানুষ';

  @override
  String get settingsTrustedContactsNone => 'কেউ নেই';

  @override
  String settingsTrustedContactsCount(int count) {
    return '$count জন';
  }

  @override
  String get settingsTrustedContactsExplanation => 'হোম স্ক্রিন বা স্ক্যাম সতর্কবার্তার সময় এক ট্যাপে তাদের ফোন করতে পারবেন। তালিকার প্রথম জনকে মূল \"কল\" বোতামে দেখানো হবে।';

  @override
  String get settingsTrustedContactsAddContactTitle => 'নাম্বার যোগ করুন';

  @override
  String get settingsTrustedContactsAddContactSubtitle => 'একটি নাম ও ফোন নম্বর লিখুন';

  @override
  String get settingsTrustedContactsChooseFromContactsTitle => 'কনট্যাক্ট থেকে বাছুন';

  @override
  String get settingsTrustedContactsChooseFromContactsSubtitle => 'আপনার ফোনের কনট্যাক্ট থেকে একটি নম্বর নিন';

  @override
  String get settingsTrustedContactsPickerUnavailable => 'এই প্রিভিউ সংস্করণে ডিভাইস কনট্যাক্ট পিকার এখনো চালু হয়নি।';

  @override
  String get settingsTrustedContactsRemoveDialogTitle => 'ভরসার মানুষ মুছবেন?';

  @override
  String get settingsTrustedContactsRemoveDialogBody => 'এই মানুষটি আর ভরসার মানুষের তালিকা বা হোম স্ক্রিনে দেখানো হবে না।';

  @override
  String get settingsTrustedContactsRemoveDialogRemove => 'মুছে দিন';

  @override
  String get settingsAdvancedSectionTitle => 'অ্যাডভান্সড';

  @override
  String get settingsDeleteAllHistoryButton => 'সব হিস্ট্রি মুছে দিন';

  @override
  String get settingsRerunPermissionsButton => 'পারমিশন আবার পরীক্ষা করুন';

  @override
  String get settingsDeleteAllHistoryDialogTitle => 'সব হিস্ট্রি মুছে ফেলবেন?';

  @override
  String get settingsDeleteAllHistoryDialogBody => 'এতে এই ডিভাইস থেকে সব স্ক্যান করা মেসেজ এবং কারণ স্থায়ীভাবে মুছে যাবে। এটা আর ফিরিয়ে আনা যাবে না।';

  @override
  String get settingsDeleteAllHistoryDialogConfirm => 'সব মুছে দিন';

  @override
  String get settingsHistoryDeletedSnackbar => 'হিস্ট্রি মুছে ফেলা হয়েছে';

  @override
  String get settingsRerunPermissionsSnackbar => 'পারমিশন পরীক্ষা শেষ। এখনই অনুমতি দিলে অ্যাপটি একবার রিস্টার্ট করে নিন।';

  @override
  String get settingsOverlayTitle => 'অন্যান্য অ্যাপের উপর জরুরি সতর্কবার্তা';

  @override
  String get settingsOverlaySubtitleEnabled => 'চালু আছে: উচ্চ ঝুঁকির সতর্কবার্তা অন্য অ্যাপের ওপরে ভেসে উঠতে পারবে। আপনি অন্য অ্যাপে থাকলেও সতর্ক করার জন্য এটা প্রয়োজনীয়।';

  @override
  String get settingsOverlaySubtitleDisabled => 'বন্ধ আছে: অ্যান্ড্রয়েডে ওভারলে পারমিশনটি চালু করতে এখানে ট্যাপ করুন। আপনি অন্য অ্যাপে থাকলেও সতর্ক করার জন্য এটা প্রয়োজনীয়।';

  @override
  String get settingsHowItWorksTitle => 'এল্ডার শিল্ড কীভাবে কাজ করে';

  @override
  String get settingsHowItWorksSubtitle => 'আমরা কী দেখি, কখন সতর্ক করি, তখন কী করবেন';

  @override
  String get settingsAboutTitle => 'এল্ডার শিল্ড সম্পর্কে';

  @override
  String get settingsAddTrustedDialogTitle => 'ভরসার মানুষ যোগ করুন';

  @override
  String get settingsAddTrustedDialogConsent => 'হোম স্ক্রিন বা স্ক্যাম সতর্কবার্তার সময় এক ট্যাপে তাদের ফোন করতে পারবেন।';

  @override
  String get settingsAddTrustedDialogConfirm => 'যোগ করুন';

  @override
  String get settingsEditTrustedDialogTitle => 'ভরসার মানুষ সম্পাদনা করুন';

  @override
  String get settingsEditTrustedDialogConfirm => 'সেভ করুন';

  @override
  String get settingsContactNameLabel => 'নাম';

  @override
  String get settingsContactNameHint => 'যেমনঃ আমার ছেলে';

  @override
  String get settingsContactNumberLabel => 'ফোন নম্বর';

  @override
  String get settingsContactNumberHint => 'যেমনঃ +৯১ ৯৮৭৬৫ ৪৩২১০';

  @override
  String get settingsContactDialogCancel => 'বাতিল';

  @override
  String get settingsContactInvalidNumber => 'একটি সঠিক ফোন নম্বর লিখুন';

  @override
  String get howItWorksBulletWhatWeCheck => 'আমরা কী দেখি: আমরা আপনার এসএমএস পড়ে স্ক্যামের লক্ষণ খুঁজি — সন্দেহজনক লিঙ্ক, খুব তাড়াহুড়ো বা ভয় দেখানো ভাষা, ওটিপি বা ব্যাংক তথ্য চাওয়া, আর এমন বার্তা যা আপনার ব্যাংক বা কোনো পরিচিত সার্ভিস সেজে আসে।';

  @override
  String get howItWorksBulletWhenWeAlert => 'কখন সতর্ক করি: কোনো মেসেজ ঝুঁকিপূর্ণ দেখালে আমরা আপনাকে জানাই। খুব বেশি ঝুঁকির মেসেজ এলে আমরা অ্যাপ ব্যাকগ্রাউন্ডে থাকলেও পপ-আপ দেখাতে পারি এবং মেসেজটি মেসেজেস ট্যাবে দেখাই।';

  @override
  String get howItWorksBulletWhatToDo => 'সতর্কবার্তা দেখলে কী করবেন: মেসেজের কোনো লিঙ্কে ট্যাপ করবেন না। \"এটা স্ক্যাম\" বা \"এটা নিরাপদ\" বেছে নিয়ে আমাদের শেখাতে সাহায্য করতে পারেন। সবচেয়ে ভালো পদক্ষেপ: সতর্কবার্তা স্ক্রিন বা হোম থেকে আপনার ভরসার মানুষকে ফোন করুন।';

  @override
  String get howItWorksBulletCallTrusted => 'ভরসার মানুষকে কীভাবে ফোন করবেন: হোম স্ক্রিনে বড় \"কল [নাম]\" বোতামে ট্যাপ করুন — বিশেষ করে কোনো চিন্তাজনক মেসেজ এলে। আমরা যখন সম্ভাব্য স্ক্যাম দেখাই, তখনও সতর্কবার্তা স্ক্রিন থেকে ফোন করতে পারেন।';

  @override
  String get howItWorksSeeWarningCta => 'সতর্কবার্তা দেখতে কেমন হয়, দেখুন';

  @override
  String get permissionsIntro => 'এল্ডার শিল্ড শুধু স্ক্যাম থেকে বাঁচানোর জন্যই পারমিশন ব্যবহার করে। আপনি চাইলে কোনো পারমিশন না-ও দিতে পারেন; তাতে সুরক্ষা কিছুটা কমবে, কিন্তু অ্যাপ কাজ করবে।';

  @override
  String get permissionsSmsTitle => 'মেসেজ (এসএমএস)';

  @override
  String get permissionsSmsBody => 'স্ক্যামের লক্ষণ খুঁজতে আমরা ইনকামিং এসএমএস পড়ি — যেমন সন্দেহজনক লিঙ্ক, ওটিপি চাওয়া, ব্যাংক সংক্রান্ত লেখা ইত্যাদি — এবং প্রয়োজনে আপনাকে সতর্ক করি। কোনো মেসেজের লেখা আপনার ডিভাইসের বাইরে পাঠানো হয় না। সেটিংস থেকে চাইলে সব বিশ্লেষিত হিস্ট্রি মুছে দিতে পারেন।';

  @override
  String get permissionsPhoneStateTitle => 'ফোন (অবস্থা পড়া)';

  @override
  String get permissionsPhoneStateBody => 'আপনি কখন ফোনে কথা বলছেন তা জানা দরকার, যাতে কলের মধ্যেই কোনো ওটিপি এলে আমরা ঝুঁকি বাড়াতে পারি (এটা খুব সাধারণ স্ক্যাম প্যাটার্ন)। আমরা কল রেকর্ড করি না, অডিও শুনি না, বা কল লগ দেখি না।';

  @override
  String get permissionsPhoneCallTitle => 'ফোন (কল করা)';

  @override
  String get permissionsPhoneCallBody => 'হোম বা সতর্কবার্তা স্ক্রিন থেকে আপনি যেন \"ভরসার মানুষকে কল\" বোতামে ট্যাপ করে দ্রুত ফোন করতে পারেন, তার জন্য এই অনুমতি দরকার। শুধু আপনি ট্যাপ করলে এবং শুধু আপনার যোগ করা ভরসার নাম্বারেই কল করা হয়।';

  @override
  String get permissionsNotificationsTitle => 'নোটিফিকেশন';

  @override
  String get permissionsNotificationsBody => 'সন্দেহজনক বা উচ্চ ঝুঁকির মেসেজ ধরা পড়লে যাতে আপনাকে দ্রুত জানাতে পারি, তার জন্য নোটিফিকেশন দরকার। চাইলে সিস্টেম সেটিংস থেকে নোটিফিকেশন বন্ধ করতে পারেন; তবুও অ্যাপ ব্যবহার করতে পারবেন।';

  @override
  String get permissionsOverlayTitle => 'অন্যান্য অ্যাপের উপর দেখানো (ঐচ্ছিক)';

  @override
  String get permissionsOverlayBody => 'যদি সেটিংস থেকে অ্যান্ড্রয়েডের ওভারলে পারমিশন চালু করেন, তাহলে কোনো উচ্চ ঝুঁকির মেসেজ এলে এল্ডার শিল্ড অন্য অ্যাপের ওপরেও জরুরি সতর্কবার্তা দেখাতে পারবে। এটা সম্পূর্ণ ঐচ্ছিক এবং ব্যক্তিগত নিরাপত্তার জন্য।';

  @override
  String get privacyTitle => 'গোপনীয়তার নীতি';

  @override
  String get privacySection1Title => '১. আমরা কারা';

  @override
  String get privacySection1Body => 'এল্ডার শিল্ড একটি অ্যান্ড্রয়েড অ্যাপ, যা এসএমএস এবং কল-সম্পর্কিত স্ক্যাম থেকে বাঁচতে বয়স্ক ব্যবহারকারীদের সাহায্য করার জন্য বানানো হয়েছে। আমরা ডিভাইসেই মেসেজ বিশ্লেষণ করি এবং সন্দেহজনক কিছু দেখলে আপনাকে সতর্ক করি।';

  @override
  String get privacySection2Title => '২. আমরা কোন ডেটা প্রক্রিয়া করি';

  @override
  String get privacySection2Paragraphs => 'সব প্রক্রিয়াকরণ আপনার ডিভাইসেই হয়। আমরা আপনার মেসেজ, কলের অবস্থা বা অন্য কোনো ব্যক্তিগত তথ্য আমাদের সার্ভার বা তৃতীয় পক্ষের কাছে পাঠাই না।\n\nমেসেজ ডেটা: আপনি কোনো এসএমএস পেলে অ্যাপটি সেই মেসেজের প্রেরক, লেখা এবং সময় দেখে। এই ডেটা শুধু আমাদের অন-ডিভাইস স্ক্যাম ডিটেকশন চালানোর জন্য ব্যবহার হয়। ফলাফল শুধু আপনার ডিভাইসেই থাকে। চাইলে যেকোনো সময় সেটিংস → সব হিস্ট্রি মুছুন থেকে এগুলো মুছে দিতে পারেন।\n\nকল অবস্থা: অ্যাপটি দেখে আপনি বর্তমানে ফোন কল করছেন কি না। আমরা কল রেকর্ড করি না, অডিও শুনি না, কিংবা কল লগ দেখি না। কলের অবস্থা শুধু ডিটেকশন উন্নত করতে ব্যবহার হয় (যেমন কল চলার সময় ওটিপি এলে আপনাকে অতিরিক্ত সতর্ক করা)।\n\nসেটিংস এবং ভরসার মানুষ: এগুলো আপনার ডিভাইসের সিকিওর স্টোরেজে রাখা হয়। ভরসার মানুষ শুধু যেন আপনি \"ভরসার মানুষকে কল\" বোতামে ট্যাপ করে দ্রুত ফোন করতে পারেন, সেই কাজেই ব্যবহৃত হয়। আমরা কখনো তাদের স্বয়ংক্রিয়ভাবে কল বা মেসেজ করি না।';

  @override
  String get privacySection3Title => '৩. আমরা কী করি না';

  @override
  String get privacySection3Paragraphs => 'আমরা আপনার এসএমএসের লেখা, কলের অবস্থা বা কনট্যাক্ট লিস্ট ইন্টারনেটে পাঠাই না।\n\nআমরা আপনার ডেটা বিজ্ঞাপনদাতা বা ডেটা ব্রোকারদের কাছে বিক্রি, ভাড়া বা শেয়ার করি না।\n\nঅ্যাকাউন্ট বা সাইন-ইন ছাড়াই অ্যাপ কাজ করে। প্রয়োজনীয় পারমিশন দেওয়ার পরেও অ্যাপ সম্পূর্ণ অফলাইন-ভাবেই কাজ করতে পারে।\n\nআমরা আরসিএস/চ্যাট মেসেজ পড়ি বা বিশ্লেষণ করি না; শুধু সাধারণ এসএমএস সমর্থিত।';

  @override
  String get privacySection4Title => '৪. পারমিশন ও কেন দরকার';

  @override
  String get privacySection4Paragraphs => 'এসএমএস (রিসিভ/রিড): ইনকামিং এসএমএস পড়ে স্ক্যাম-প্যাটার্ন খুঁজে বের করার জন্য, এবং প্রয়োজনে আপনাকে সতর্ক করার জন্য এই অনুমতি লাগে।\n\nফোন (কলের অবস্থা পড়া): আপনি কখন কল করছেন তা জানার জন্য, যাতে কলের মধ্যেই কোনো ওটিপি এলে সেটিকে বেশি ঝুঁকি হিসেবে দেখাতে পারি। আমরা কোনো কল রেকর্ড বা শুনি না।\n\nফোন (কল করা): আপনি যেন \"ভরসার মানুষকে কল\" বোতামে ট্যাপ করে দ্রুত ফোন করতে পারেন, তার জন্য। আমরা শুধু আপনার যোগ করা ভরসার নাম্বারগুলোতেই এবং শুধু আপনি ট্যাপ করলে কল করি।\n\nনোটিফিকেশন: সন্দেহজনক বা উচ্চ ঝুঁকির মেসেজ ধরা পড়লে দ্রুত আপনাকে জানাতে।\n\nআপনি \"এই প্রেরককে ব্লক করুন\" বেছে নিলে অ্যাপ আপনার ডিফল্ট মেসেজিং অ্যাপ খুলতে পারে; এল্ডার শিল্ড নিজে থেকে এসএমএস পাঠায় না।';

  @override
  String get privacySection5Title => '৫. ডেটা কতদিন থাকে এবং আপনার পছন্দ';

  @override
  String get privacySection5Paragraphs => 'বিশ্লেষিত মেসেজ ও কারণ: শুধু আপনার ডিভাইসেই থাকে, যতদিন না আপনি সেটিংস → সব হিস্ট্রি মুছুন বেছে নেন।\n\nসেটিংস এবং ভরসার মানুষ: আপনি পরিবর্তন করা, মুছে ফেলা, বা অ্যাপ আনইনস্টল করা পর্যন্ত ডিভাইসেই থাকে।\n\nআমরা কোনো ডেটা আমাদের সার্ভারে জমা রাখি না, কারণ আমরা তা সংগ্রহই করি না।';

  @override
  String get privacySection6Title => '৬. শিশু ও সংবেদনশীল ব্যবহারকারী';

  @override
  String get privacySection6Paragraphs => 'অ্যাপটি মূলত বয়স্ক এবং অন্য ঝুঁকিপূর্ণ ব্যবহারকারীদের স্ক্যাম থেকে বাঁচাতে সাহায্য করার জন্য বানানো। আমরা এমনভাবে শিশুদের ডেটা সংগ্রহ করি না যাতে আলাদা প্যারেন্টাল কনসেন্ট লাগে; কারণ অ্যাপ কোনো ডেটা ডিভাইসের বাইরে পাঠায় না।\n\nআপনি যদি কারও (যেমন বাবা-মা বা অভিভাব্য ব্যক্তির) জন্য এই অ্যাপ সেট-আপ করেন, তাহলে তাদের সাথে পারমিশন আর এই নীতি সম্পর্কে সহজ ভাষায় কথা বলার পরামর্শ দিই।';

  @override
  String get privacySection7Title => '৭. এই নীতির পরিবর্তন';

  @override
  String get privacySection7Paragraphs => 'আমরা যদি এই নীতি বদলাই (যেমন ভবিষ্যতে কোনো ঐচ্ছিক ক্লাউড ফিচার যোগ করি), তাহলে এই ডকুমেন্ট আপডেট করব এবং প্রয়োজন হলে আইন বা স্টোর নীতিমালা অনুযায়ী আপনাকে জানাব বা সম্মতি নেব।';

  @override
  String get privacySection8Title => '৮. যোগাযোগ';

  @override
  String get privacySection8Body => 'গোপনীয়তা সংক্রান্ত কোনো প্রশ্ন বা এল্ডার শিল্ড নিয়ে কোনো অনুরোধ থাকলে, দয়া করে আমাদের সাথে যোগাযোগ করুন: [এখানে আপনার ইমেল বা সাপোর্ট URL লিখুন]।';

  @override
  String get privacyLastUpdatedNote => 'সর্বশেষ আপডেট: ব্লক ১০। রিলিজের আগে প্লেসহোল্ডারগুলো ঠিক করে নিন।';

  @override
  String get aboutTagline => 'বয়স্ক ব্যবহারকারীদের জন্য ডিভাইসে স্ক্যাম থেকে সুরক্ষা।';

  @override
  String get messagesAppBarTitle => 'মেসেজ';

  @override
  String get messagesFilterAll => 'সব';

  @override
  String get messagesFilterHighRisk => 'উচ্চ ঝুঁকি';

  @override
  String get messagesFilterAllSemanticsLabel => 'সব মেসেজ দেখান';

  @override
  String get messagesFilterAllSemanticsHint => 'সব বিশ্লেষিত মেসেজ দেখতে ডাবল ট্যাপ করুন।';

  @override
  String get messagesFilterHighRiskSemanticsLabel => 'শুধু উচ্চ ঝুঁকির মেসেজ দেখান';

  @override
  String get messagesFilterHighRiskSemanticsHint => 'সবচেয়ে গুরুতর সতর্কবার্তাগুলো দেখতে ডাবল ট্যাপ করুন।';

  @override
  String get messagesErrorTitle => 'মেসেজ লোড করতে সমস্যা হয়েছে।';

  @override
  String get messagesErrorSubtitle => 'আবার চেষ্টা করতে নিচে টেনে ছেড়ে দিন।';

  @override
  String get messagesEmptyTitle => 'এখনও কোনো মেসেজ বিশ্লেষণ করা হয়নি। এল্ডার শিল্ড নতুন মেসেজ নিজে থেকেই পরীক্ষা করবে।';

  @override
  String get messagesEmptySubtitle => 'আমরা কিছু সন্দেহজনক পেলে আপনাকে জানাব, আর আপনি এখান থেকে তা খুলে দেখতে পারবেন।';

  @override
  String get messagesRefreshSnackbar => 'তালিকা আপডেট হয়েছে';

  @override
  String get messagesLoadingHeader => 'মেসেজ লোড হচ্ছে…';

  @override
  String messagesDateToday(String time) {
    return 'আজ, $time';
  }

  @override
  String messagesDateYesterday(String time) {
    return 'গতকাল, $time';
  }

  @override
  String messagesDateOther(String month, int day, String time) {
    return '$month $day, $time';
  }

  @override
  String onboardingStepOf(int step, int total) {
    return 'ধাপ $step / $total';
  }

  @override
  String get onboardingWelcomeBody1 => 'এল্ডার শিল্ড আপনার মেসেজ আর কলের ওপর নজর রাখে, যেন স্ক্যাম হলে আপনাকে আগে থেকেই সতর্ক করতে পারে।';

  @override
  String get onboardingWelcomeBody2 => 'আপনি কখনও দ্বিধায় পড়লে এক ট্যাপে ভরসার মানুষের সঙ্গে কথা বলতে পারবেন।';

  @override
  String get onboardingGetStarted => 'শুরু করি';

  @override
  String get onboardingPermissionsTitle => 'কেন এই অনুমতিগুলো দরকার';

  @override
  String get onboardingPermissionsBulletMessages => 'মেসেজ: যেন আমরা আপনার এসএমএস পড়ে স্ক্যামের মতো কিছু দেখলে আপনাকে সতর্ক করতে পারি।';

  @override
  String get onboardingPermissionsBulletPhone => 'ফোন: যেন বুঝতে পারি আপনি কখন কল করছেন। স্ক্যামাররা প্রায়ই কল চলার সময় ওটিপি চাইতে পারে।';

  @override
  String get onboardingPermissionsBody1 => 'নিচের \"পারমিশন দিন\" বোতামে ট্যাপ করলে আপনার ডিভাইস মেসেজ, ফোন আর নোটিফিকেশনের অনুমতি চাইবে (যাতে অ্যাপ বন্ধ থাকলেও সম্ভাব্য স্ক্যামের ব্যাপারে আপনাকে জানাতে পারি)।';

  @override
  String get onboardingPermissionsBody2 => 'আমরা কখনোই স্ক্যাম চেক করা ছাড়া অন্য কাজে আপনার মেসেজ পড়ি না।';

  @override
  String get onboardingPermissionsRetryWarning => 'কিছু পারমিশন দেওয়া হয়নি। আপনি না দেওয়া পর্যন্ত সুরক্ষা সীমিত থাকবে।';

  @override
  String get onboardingPermissionsPrimaryAllow => 'পারমিশন দিন';

  @override
  String get onboardingPermissionsPrimaryRetry => 'আবার চেষ্টা করুন';

  @override
  String get onboardingSkipForNow => 'এখন থাক';

  @override
  String get onboardingTrustedTitle => 'একজন ভরসার মানুষ যোগ করুন';

  @override
  String get onboardingTrustedBody1 => 'এমন কাউকে বেছে নিন, যাকে আপনি কোনো চিন্তার মেসেজ পেলে ফোন করতে চাইবেন — যেমন পরিবারের কেউ বা ঘনিষ্ঠ বন্ধু।';

  @override
  String get onboardingTrustedBody2 => 'তাদের যোগ করলে হোম স্ক্রিন বা স্ক্যাম সতর্কবার্তা থেকে এক ট্যাপে এই মানুষটিকে ফোন করতে পারবেন।';

  @override
  String get onboardingTrustedAddFromContacts => 'কনট্যাক্ট থেকে যোগ করুন';

  @override
  String get onboardingTrustedAddFromContactsUnavailable => 'এই প্রিভিউ সংস্করণে ডিভাইস কনট্যাক্ট পিকার এখনো চালু হয়নি।';

  @override
  String get onboardingTrustedOrEnterManually => 'অথবা নাম্বার লিখে দিন:';

  @override
  String get onboardingTrustedDone => 'হয়ে গেছে';

  @override
  String get onboardingTrustedSeeWarningCta => 'সতর্কবার্তা দেখতে কেমন হয়, দেখুন';

  @override
  String get onboardingTrustedMissingFields => 'অনুগ্রহ করে নাম আর নম্বর দুটোই লিখুন';

  @override
  String get launchGateChecking => 'পরীক্ষা করা হচ্ছে…';

  @override
  String get exampleWarningBanner => 'এটা শুধু একটি উদাহরণ। আসল কোনো মেসেজ বা কাজ হচ্ছে না।';

  @override
  String get exampleWarningSnackbar => 'এটা শুধু উদাহরণ ছিল। কোনো কাজ করা হয়নি।';

  @override
  String get exampleWarningButton => 'বুঝেছি — এটা শুধু উদাহরণ';

  @override
  String get exampleWarningSenderUnknown => 'অজানা';

  @override
  String get exampleWarningBody => 'আপনার ব্যাঙ্ক অ্যাকাউন্ট ২৪ ঘন্টার মধ্যে ব্লক করা হবে। যাচাই করতে এখানে ক্লিক করুন: http://secure-bank-verify.com. এই তথ্য কারও সঙ্গে শেয়ার করবেন না।';

  @override
  String get exampleWarningReasonSuspiciousLink => 'সন্দেহজনক একটি লিঙ্ক আছে';

  @override
  String get exampleWarningReasonPretendBank => 'ব্যাঙ্ক সেজে কথা বলছে';

  @override
  String get exampleWarningReasonUrgentLanguage => 'খুব তাড়াহুড়ো বা ভয় দেখানো ভাষা ব্যবহার করেছে';

  @override
  String get reasonShortUrl => 'একটি সংক্ষিপ্ত বা সন্দেহজনক লিঙ্ক রয়েছে';

  @override
  String get reasonOtpMention => 'ওটিপি বা একবার-ব্যবহারের কোড চাইছে বা উল্লেখ করেছে';

  @override
  String get reasonUrgentLanguage => 'খুব তাড়াহুড়ো বা ভয় দেখানো ভাষা ব্যবহার করেছে';

  @override
  String get reasonBankKyc => 'ব্যাঙ্ক অ্যাকাউন্ট, কে ওয়াই সি (KYC) বা পেমেন্টের বিবরণ নিয়ে কথা বলছে';

  @override
  String get reasonPaymentRequest => 'আপনাকে টাকা পাঠাতে বা পেমেন্ট অনুমোদন করতে বলছে';

  @override
  String get reasonPrizeLottery => 'লটারি/পুরস্কার জেতার মতো প্রলোভন দেখাচ্ছে';

  @override
  String get reasonParcelDelivery => 'সন্দেহজনক পার্সেল বা ডেলিভারি সমস্যার কথা বলছে';

  @override
  String get reasonCryptoInvestment => 'ঝুঁকিপূর্ণ ক্রিপ্টো বিনিয়োগ বা নিশ্চিত লাভের প্রতিশ্রুতি দিচ্ছে';

  @override
  String get reasonSenderSuspicious => 'প্রেরকের নাম অস্বাভাবিক বা সন্দেহজনক দেখাচ্ছে';

  @override
  String get reasonInCallOtp => 'আপনি ফোনে কথা বলার সময়ই একটি ওটিপি এসেছে — এটি খুব সাধারণ স্ক্যাম প্যাটার্ন';

  @override
  String messageFromLabel(String sender) {
    return 'প্রেরক: $sender';
  }

  @override
  String get fullScreenWarningTitle => 'সম্ভাব্য স্ক্যাম';

  @override
  String get fullScreenWarningClosingNote => 'এই স্ক্রিন বন্ধ করলে আপনার ফোন থেকে মেসেজটি মুছে যাবে না।';

  @override
  String get fullScreenWarningDeleteAction => 'মেসেজ মুছুন';

  @override
  String get fullScreenWarningDeleteSnackbar => 'এল্ডার শিল্ড থেকে মুছে দেওয়া হয়েছে। এখন আপনার মেসেজিং অ্যাপ খুলছি, সেখান থেকেও চাইলে মুছে দিতে পারবেন।';

  @override
  String get fullScreenWarningBlockSender => 'এই প্রেরককে ব্লক করুন (মেসেজিং অ্যাপ খুলবে)';

  @override
  String guardianPlanMonthlyPrice(String price) {
    return '₹$price';
  }

  @override
  String guardianPlanYearlyPrice(String price) {
    return '₹$price';
  }

  @override
  String get guardianPlanTitle => 'গার্ডিয়ান প্ল্যান';

  @override
  String get guardianPlanSubtitle => 'পরিবারের সদস্য সন্দেহজনক বার্তা পেলে জানুন';

  @override
  String get guardianPlanWhatYouGet => 'আপনি কী পাবেন';

  @override
  String get guardianPlanBenefitAlerts => 'সন্দেহজনক বার্তায় WhatsApp/SMS অ্যালার্ট';

  @override
  String get guardianPlanBenefitHeartbeat => 'দৈনিক চেক-ইন: তাদের ফোন সক্রিয় জানুন';

  @override
  String get guardianPlanBenefitSummary => 'সাপ্তাহিক হুমকি সারাংশ';

  @override
  String get guardianPlanBenefitFamily => '৩ জন পরিবারের সুরক্ষা';

  @override
  String get guardianPlanMonthlyFallback => 'মাসিক পরিকল্পনা';

  @override
  String get guardianPlanYearlyFallback => 'বার্ষিক পরিকল্পনা — ৩৩% সাশ্রয়';

  @override
  String get guardianPlanYearlySaveBadge => '৩৩% সাশ্রয়';

  @override
  String get guardianPlanRestore => 'কেনাকাটা পুনরুদ্ধার করুন';

  @override
  String get guardianPlanMaybeLater => 'পরে';

  @override
  String get guardianPlanTerms => 'সেবার শর্তাবলী';

  @override
  String get guardianPlanPrivacy => 'গোপনীয়তা নীতি';

  @override
  String get guardianPlanActiveSubtitle => 'গার্ডিয়ান অ্যালার্ট, দৈনিক চেক-ইন, সাপ্তাহিক সারাংশ';

  @override
  String get guardianPlanUpgradeSubtitle => 'পরিবারের সদস্য সন্দেহজনক বার্তা পেলে অ্যালার্ট পান';

  @override
  String get guardianPlanActiveBadge => 'সক্রিয়';
}
