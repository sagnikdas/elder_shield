// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'ایلڈر شیلڈ';

  @override
  String get settingsTitle => 'سیٹنگز';

  @override
  String get homeAppBarTitle => 'ایلڈر شیلڈ';

  @override
  String get homePostOnboardingTitle => 'اب آپ محفوظ ہیں';

  @override
  String homePostOnboardingBody(String contactName) {
    return 'ہوم اسکرین سے آپ کسی بھی وقت $contactName کو کال کر سکتے ہیں۔';
  }

  @override
  String get commonGotIt => 'ٹھیک ہے';

  @override
  String get homeTrustedContactFallbackName => 'آپ کا قابلِ بھروسہ رابطہ';

  @override
  String get permissionsDialogTitle => 'سیٹنگز میں حفاظت آن کریں';

  @override
  String get permissionsDialogBody => 'ایلڈر شیلڈ کو آپ کے پیغامات میں اسکیم کی جانچ کے لیے ایس ایم ایس اور فون کی اجازت درکار ہے۔\n\nکیا آپ یہ اجازتیں آن کرنے کے لیے ایپ سیٹنگز کھولنا چاہتے ہیں؟';

  @override
  String get commonCancel => 'منسوخ کریں';

  @override
  String get permissionsDialogOpenSettings => 'سیٹنگز کھولیں';

  @override
  String get homeProtectionStatusLabel => 'حفاظتی اسٹیٹس';

  @override
  String get homeProtectionStatusProtected => 'محفوظ';

  @override
  String get homeProtectionStatusPermissionsNeeded => 'اجازتیں درکار ہیں';

  @override
  String get homeEnableProtectionButton => 'حفاظت آن کریں';

  @override
  String homeTodayRiskSummaryWithCount(int count) {
    return 'آج $count مشتبہ پیغام ملا ہے۔';
  }

  @override
  String get homeTodayRiskSummaryNoRisk => 'آج کوئی مشتبہ سرگرمی نہیں۔';

  @override
  String get homeTodayRiskTapToSeeMessages => 'پیغامات دیکھنے کے لیے ٹیپ کریں';

  @override
  String get commonView => 'دیکھیں';

  @override
  String get homeAutoCheckInfo => 'ایلڈر شیلڈ آپ کے نئے پیغامات خودکار طور پر چیک کرتا ہے۔';

  @override
  String homeCallTrustedButtonLabel(String name) {
    return '$name کو کال کریں';
  }

  @override
  String get homeCallTooltipText => 'جب بھی کوئی پریشان کن پیغام آئے، یہاں ٹیپ کریں۔';

  @override
  String get homeAddTrustedIntro => 'ایسا قابلِ بھروسہ رابطہ شامل کریں جسے ڈراؤنا پیغام آنے پر آپ فوراً کال کر سکیں۔';

  @override
  String get homeAddTrustedButton => 'قابلِ بھروسہ رابطہ شامل کریں';

  @override
  String get homeWhyAddTrustedShow => 'قابلِ بھروسہ رابطہ کیوں شامل کریں؟';

  @override
  String get homeWhyAddTrustedHide => 'وجہ چھپائیں';

  @override
  String get homeWhyAddTrustedExplanation => 'اگر کبھی کوئی فکرمند کرنے والا پیغام آئے تو آپ اکیلے اندازہ لگانے کے بجائے ایک بڑے بٹن پر ٹیپ کر کے کسی بھروسہ مند شخص کو کال کر سکیں، اسی لیے۔';

  @override
  String get homeTrustedContactsHeader => 'آپ کے قابلِ بھروسہ رابطے';

  @override
  String get highRiskHeaderTitle => 'خبردار: یہ اسکیم پیغام ہو سکتا ہے';

  @override
  String get highRiskHeaderBody => 'اس پیغام کے کسی بھی لنک پر ٹیپ نہ کریں اور کوئی کوڈ شیئر نہ کریں۔';

  @override
  String get highRiskWhyFlaggedTitle => 'یہ کیوں نشان زد ہوا:';

  @override
  String get actionScam => 'یہ اسکیم ہے';

  @override
  String get actionSafe => 'یہ محفوظ ہے';

  @override
  String get actionTrustSender => 'Trust this sender';

  @override
  String get snackbarGenericError => 'کچھ غلط ہو گیا۔ دوبارہ کوشش کریں۔';

  @override
  String get snackbarMarkedScam => 'اسکیم کے طور پر نشان زد کر دیا گیا۔ شکریہ۔';

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
  String get highRiskSwipeUpForDetails => 'مزید تفصیل کے لیے اوپر کی طرف سوائپ کریں';

  @override
  String get riskLowLabel => 'کم خطرہ';

  @override
  String get riskMediumLabel => 'درمیانہ خطرہ — جانچیں';

  @override
  String get riskHighLabel => 'زیادہ خطرہ — ممکنہ اسکیم';

  @override
  String get deleteMessageTitle => 'پیغام مٹائیں؟';

  @override
  String get deleteMessageBody => 'کیا آپ پُریقین ہیں؟ یہ صرف ایلڈر شیلڈ سے پیغام ہٹا دے گا۔';

  @override
  String get deleteMessageConfirm => 'مٹائیں';

  @override
  String get deleteMessageDeletedSnackbar => 'ایلڈر شیلڈ سے ہٹا دیا گیا۔';

  @override
  String get languageSectionTitle => 'زبان';

  @override
  String get languageEnglishName => 'انگریزی';

  @override
  String get languageBengaliName => 'بنگلہ';

  @override
  String get languageKannadaName => 'کنڑ';

  @override
  String get languageHindiName => 'ہندی';

  @override
  String get languageUrduName => 'اردو';

  @override
  String get languageAssameseName => 'آسامی';

  @override
  String get languageTamilName => 'تامل';

  @override
  String get languageMalayalamName => 'ملیالم';

  @override
  String get languageTeluguName => 'تیلگو';

  @override
  String languageSectionSubtitle(String languageName) {
    return 'موجودہ: $languageName';
  }

  @override
  String get snackbarUpdated => 'اپ ڈیٹ ہو گیا';

  @override
  String get settingsAppearanceTitle => 'ظاہری شکل';

  @override
  String get settingsThemeSystem => 'سسٹم';

  @override
  String get settingsThemeLight => 'لائٹ';

  @override
  String get settingsThemeDark => 'ڈارک';

  @override
  String get settingsTextSizeTitle => 'متن کا سائز';

  @override
  String get settingsTextSizeDescription => 'متن کو بڑا یا چھوٹا دیکھنے کے لیے ایڈجسٹ کریں۔ تبدیلی فوراً لاگو ہو گی۔';

  @override
  String get settingsTextSizeSample => 'ایلڈر شیلڈ آپ کو اسکیم پیغامات سے محفوظ رکھتا ہے۔';

  @override
  String get settingsLegalTitle => 'قانونی و معلومات';

  @override
  String get settingsPrivacyPolicyTitle => 'پرائیویسی پالیسی';

  @override
  String get settingsPrivacyPolicySubtitle => 'ہم آپ کا ڈیٹا کیسے استعمال کرتے ہیں';

  @override
  String get settingsPermissionsExplainedTitle => 'اجازتوں کی وضاحت';

  @override
  String get settingsPermissionsExplainedSubtitle => 'ہمیں ہر اجازت کیوں چاہیے';

  @override
  String get settingsSensitivityTitle => 'حساسیت';

  @override
  String get settingsSensitivityLabelConservative => 'کم चेतावنیاں';

  @override
  String get settingsSensitivityLabelBalanced => 'متوازن';

  @override
  String get settingsSensitivityLabelSensitive => 'زیادہ चेतावنیاں';

  @override
  String get settingsSensitivityDescConservative => 'صرف بہت واضح اسکیم پیغامات۔ اگر آپ کم चेतावنیاں پسند کرتے ہیں تو یہ بہتر ہے۔';

  @override
  String get settingsSensitivityDescBalanced => 'زیادہ تر لوگوں کے لیے مناسب۔ اسکیم پکڑنے اور شور کے درمیان संतुलन۔';

  @override
  String get settingsSensitivityDescSensitive => 'زیادہ اسکیم پکڑتا ہے لیکن کبھی کبھار محفوظ پیغامات کو بھی فلیگ کر سکتا ہے۔';

  @override
  String get settingsTrustedContactsTitle => 'قابلِ بھروسہ رابطے';

  @override
  String get settingsTrustedContactsNone => 'کوئی نہیں';

  @override
  String settingsTrustedContactsCount(int count) {
    return '$count رابطہ';
  }

  @override
  String get settingsTrustedContactsExplanation => 'آپ ہوم اسکرین یا اسکیم وارننگ کے وقت ایک ٹیپ سے اِنہیں کال کر سکتے ہیں۔ فہرست میں سب سے پہلا رابطہ مرکزی \"کال\" بٹن کے لیے استعمال ہوتا ہے۔';

  @override
  String get settingsTrustedContactsAddContactTitle => 'رابطہ شامل کریں';

  @override
  String get settingsTrustedContactsAddContactSubtitle => 'نام اور فون نمبر ٹائپ کریں';

  @override
  String get settingsTrustedContactsChooseFromContactsTitle => 'رابطوں میں سے منتخب کریں';

  @override
  String get settingsTrustedContactsChooseFromContactsSubtitle => 'اپنے فون کے رابطوں میں سے نمبر منتخب کریں';

  @override
  String get settingsTrustedContactsPickerUnavailable => 'اس پری ویو بلڈ میں ڈیوائس کانٹیکٹ پِکر ابھی دستیاب نہیں۔';

  @override
  String get settingsTrustedContactsRemoveDialogTitle => 'قابلِ بھروسہ رابطہ ہٹائیں؟';

  @override
  String get settingsTrustedContactsRemoveDialogBody => 'یہ شخص اب قابلِ بھروسہ رابطوں کی فہرست یا ہوم اسکرین پر نہیں دکھے گا۔';

  @override
  String get settingsTrustedContactsRemoveDialogRemove => 'ہٹائیں';

  @override
  String get settingsAdvancedSectionTitle => 'ایڈوانسڈ';

  @override
  String get settingsDeleteAllHistoryButton => 'تمام ہسٹری مٹائیں';

  @override
  String get settingsRerunPermissionsButton => 'اجازتوں کی دوبارہ جانچ کریں';

  @override
  String get settingsDeleteAllHistoryDialogTitle => 'تمام ہسٹری مٹائیں؟';

  @override
  String get settingsDeleteAllHistoryDialogBody => 'اس ڈیوائس سے تمام تجزیہ شدہ پیغامات اور اسباب مستقل طور پر مٹ جائیں گے۔ اسے واپس نہیں لایا جا سکتا۔';

  @override
  String get settingsDeleteAllHistoryDialogConfirm => 'سب مٹائیں';

  @override
  String get settingsHistoryDeletedSnackbar => 'ہسٹری مٹا دی گئی';

  @override
  String get settingsRerunPermissionsSnackbar => 'اجازتوں کی جانچ مکمل ہوئی۔ اگر آپ نے ابھی اجازت دی ہے تو ایپ کو دوبارہ شروع کریں۔';

  @override
  String get settingsOverlayTitle => 'دیگر ایپس کے اوپر ایمرجنسی پاپ اپ';

  @override
  String get settingsOverlaySubtitleEnabled => 'آن: زیادہ خطرے والی चेतावنیاں دیگر ایپس کے اوپر بھی دکھ سکتی ہیں۔ تاکہ ہم آپ کو اُس وقت بھی خبردار کر سکیں جب آپ کسی اور ایپ میں ہوں۔';

  @override
  String get settingsOverlaySubtitleDisabled => 'آف: اینڈروئیڈ اوورلے اجازت آن کرنے کے لیے یہاں ٹیپ کریں۔ تاکہ آپ کو دیگر ایپس استعمال کرتے وقت بھی चेतावنیاں مل سکیں، اسے آن رکھنا بہتر ہے۔';

  @override
  String get settingsHowItWorksTitle => 'ایلڈر شیلڈ کیسے کام کرتا ہے';

  @override
  String get settingsHowItWorksSubtitle => 'ہم کیا چیک کرتے ہیں، کب चेतावनी دیتے ہیں، اور آپ کو کیا کرنا ہے';

  @override
  String get settingsAboutTitle => 'ایلڈر شیلڈ کے بارے میں';

  @override
  String get settingsAddTrustedDialogTitle => 'قابلِ بھروسہ رابطہ شامل کریں';

  @override
  String get settingsAddTrustedDialogConsent => 'انہیں ہوم اسکرین یا اسکیم وارننگ سے ایک ٹیپ میں کال کیا جا سکتا ہے۔';

  @override
  String get settingsAddTrustedDialogConfirm => 'شامل کریں';

  @override
  String get settingsEditTrustedDialogTitle => 'قابلِ بھروسہ رابطہ ترمیم کریں';

  @override
  String get settingsEditTrustedDialogConfirm => 'محفوظ کریں';

  @override
  String get settingsContactNameLabel => 'نام';

  @override
  String get settingsContactNameHint => 'مثلاً: میرا بیٹا';

  @override
  String get settingsContactNumberLabel => 'فون نمبر';

  @override
  String get settingsContactNumberHint => 'مثلاً: +92 300 123 4567';

  @override
  String get settingsContactDialogCancel => 'منسوخ کریں';

  @override
  String get settingsContactInvalidNumber => 'براہِ کرم درست فون نمبر درج کریں';

  @override
  String get howItWorksBulletWhatWeCheck => 'ہم کیا چیک کرتے ہیں: ہم آپ کے ایس ایم ایس پڑھتے ہیں اور اسکیم کے اشارے تلاش کرتے ہیں — مشتبہ لنکس، بہت تیز یا دھمکی آمیز زبان، او ٹی پی یا بینک کی تفصیل مانگنے والے پیغامات، اور ایسے پیغامات جو آپ کے بینک یا کسی جانی پہچانی سروس کی نقالی کرتے ہیں۔';

  @override
  String get howItWorksBulletWhenWeAlert => 'ہم کب चेतावनी دیتے ہیں: اگر کوئی پیغام خطرناک لگے تو ہم آپ کو مطلع کرتے ہیں۔ بہت زیادہ خطرے والے پیغامات کے لیے ہم ایپ بیک گراؤنڈ میں ہونے پر بھی پاپ اپ دکھا سکتے ہیں اور اسے پیغامات کی فہرست میں نمایاں کر سکتے ہیں۔';

  @override
  String get howItWorksBulletWhatToDo => 'چेतावنی دکھنے پر کیا کریں: پیغام کے کسی بھی لنک پر ٹیپ نہ کریں۔ آپ \"یہ اسکیم ہے\" یا \"یہ محفوظ ہے\" منتخب کر کے ہمیں سیکھنے میں مدد دے سکتے ہیں۔ سب سے بہتر قدم: चेतावنی اسکرین یا ہوم سے اپنے قابلِ بھروسہ رابطے کو کال کریں۔';

  @override
  String get howItWorksBulletCallTrusted => 'قابلِ بھروسہ رابطے کو کیسے کال کریں: ہوم اسکرین پر بڑے \"کال [نام]\" بٹن پر جب چاہیں ٹیپ کریں — خاص طور پر جب کوئی پریشان کن پیغام آئے۔ جب ہم ممکنہ اسکیم دکھائیں، تب بھی آپ चेतावنی اسکرین سے کال کر سکتے ہیں۔';

  @override
  String get howItWorksSeeWarningCta => 'دیکھیں चेतावنی کیسی نظر آتی ہے';

  @override
  String get permissionsIntro => 'ایلڈر شیلڈ اجازتوں کا استعمال صرف اسکیم سے حفاظت کے لیے کرتا ہے۔ آپ چاہیں تو کوئی اجازت نہ بھی دیں؛ حفاظت کچھ کم ہو جائے گی، لیکن ایپ پھر بھی کام کرے گی۔';

  @override
  String get permissionsSmsTitle => 'پیغامات (SMS)';

  @override
  String get permissionsSmsBody => 'ہم آنے والے ایس ایم ایس حاصل کر کے انہیں اسکیم کے اشاروں (جیسے مشتبہ لنکس، او ٹی پی فِشنگ، بینک سے متعلق عبارت) کے لیے چیک کرتے ہیں اور ضرورت پڑنے پر آپ کو चेतावनी دکھاتے ہیں۔ کوئی بھی پیغام آپ کے ڈیوائس سے باہر نہیں بھیجا جاتا۔ آپ سیٹنگز سے تمام تجزیہ شدہ ہسٹری مٹا سکتے ہیں۔';

  @override
  String get permissionsPhoneStateTitle => 'فون (اسٹیٹس پڑھنا)';

  @override
  String get permissionsPhoneStateBody => 'ہمیں یہ جاننے کی ضرورت ہوتی ہے کہ آپ کب کال پر ہیں، تاکہ کال کے دوران او ٹی پی آنے پر ہم خطرے کی سطح بڑھا سکیں (یہ ایک عام اسکیم پیٹرن ہے)۔ ہم کال ریکارڈ نہیں کرتے، آڈیو نہیں سنتے اور نہ ہی آپ کا کال لاگ پڑھتے ہیں۔';

  @override
  String get permissionsPhoneCallTitle => 'فون (کال کرنا)';

  @override
  String get permissionsPhoneCallBody => 'تاکہ آپ ہوم یا चेतावनी اسکرین سے \"قابلِ بھروسہ رابطے کو کال کریں\" بٹن پر ٹیپ کر سکیں۔ ایپ صرف اُس وقت کال شروع کرتی ہے جب آپ بٹن دباتے ہیں، اور صرف اُن نمبروں پر جنہیں آپ نے قابلِ بھروسہ رابطے کے طور پر شامل کیا ہے۔';

  @override
  String get permissionsNotificationsTitle => 'نوٹیفکیشن';

  @override
  String get permissionsNotificationsBody => 'جب ہم کوئی مشتبہ یا زیادہ خطرے والا پیغام پاتے ہیں تو آپ کو فوراً باخبر کرنے کے لیے۔ آپ سسٹم سیٹنگز میں نوٹیفکیشن بند کر سکتے ہیں؛ پھر بھی آپ ایپ استعمال کر سکیں گے۔';

  @override
  String get permissionsOverlayTitle => 'دیگر ایپس کے اوپر دکھانا (اختیاری)';

  @override
  String get permissionsOverlayBody => 'اگر آپ سیٹنگز میں اینڈروئیڈ اوورلے اجازت آن کرتے ہیں تو زیادہ خطرے والا پیغام آنے پر ایلڈر شیلڈ دیگر ایپس کے اوپر بھی ایمرجنسی चेतावنی دکھا سکتا ہے۔ یہ مکمل طور پر اختیاری ہے اور ذاتی حفاظت کے لیے ہے۔';

  @override
  String get privacyTitle => 'پرائیویسی پالیسی';

  @override
  String get privacySection1Title => '1. ہم کون ہیں';

  @override
  String get privacySection1Body => 'ایلڈر شیلڈ ایک اینڈروئیڈ ایپ ہے جو ڈیوائس پر ہی پیغامات کا تجزیہ کر کے اور مشتبہ لگنے پر चेतावنی دے کر، بزرگ صارفین کو ایس ایم ایس اور کال سے جڑے اسکیمز سے بچانے میں مدد کرتی ہے۔';

  @override
  String get privacySection2Title => '2. ہم کون سا ڈیٹا پراسیس کرتے ہیں';

  @override
  String get privacySection2Paragraphs => 'سارا پراسیسنگ آپ کے ڈیوائس پر ہی ہوتا ہے۔ ہم آپ کے پیغامات، کال اسٹیٹس یا کسی بھی ذاتی ڈیٹا کو اپنے سرور یا کسی تیسرے فریق کو نہیں بھیجتے۔\n\nپیغام کا ڈیٹا: جب آپ کو ایس ایم ایس ملتا ہے، ایپ بھیجنے والے، پیغام کا متن اور وقت کو پڑھتی ہے۔ یہ ڈیٹا صرف ہمارے آن ڈیوائس اسکیم ڈیٹیکشن کو چلانے کے لیے استعمال ہوتا ہے۔ نتائج صرف آپ کے ڈیوائس پر محفوظ رہتے ہیں۔ آپ کسی بھی وقت سیٹنگز → تمام ہسٹری مٹائیں سے انہیں حذف کر سکتے ہیں۔\n\nکال اسٹیٹس: ایپ یہ چیک کرتی ہے کہ آپ کال پر ہیں یا نہیں۔ ہم کال ریکارڈ نہیں کرتے، آڈیو نہیں سنتے، اور کال لاگ تک رسائی نہیں رکھتے۔ کال اسٹیٹس صرف ڈیٹیکشن کو بہتر بنانے (جیسے کال کے دوران او ٹی پی آنے پر चेतावनी دینے) کے لیے استعمال ہوتا ہے۔\n\nسیٹنگز اور قابلِ بھروسہ رابطے: صرف آپ کے ڈیوائس کے محفوظ اسٹوریج میں محفوظ رہتے ہیں۔ قابلِ بھروسہ رابطے صرف اس لیے استعمال ہوتے ہیں کہ آپ \"قابلِ بھروسہ رابطے کو کال کریں\" بٹن پر ٹیپ کر سکیں۔ ہم انہیں خودکار طریقے سے کال یا پیغام نہیں بھیجتے۔';

  @override
  String get privacySection3Title => '3. ہم کیا نہیں کرتے';

  @override
  String get privacySection3Paragraphs => 'ہم آپ کے ایس ایم ایس کا متن، کال اسٹیٹس یا رابطہ فہرست کو انٹرنیٹ پر نہیں بھیجتے۔\n\nہم آپ کا ڈیٹا اشتہاری کمپنیوں یا ڈیٹا بروکرز کو نہیں بیچتے، کرائے پر نہیں دیتے اور شیئر نہیں کرتے۔\n\nہم آپ سے اکاؤنٹ بنانے یا سائن اِن کرنے کا تقاضا نہیں کرتے۔ ضروری اجازتیں ملنے کے بعد ایپ مکمل طور پر آف لائن کام کر سکتی ہے۔\n\nہم RCS/چیٹ پیغامات نہیں پڑھتے یا تجزیہ کرتے؛ صرف عام ایس ایم ایس کی سپورٹ ہے۔';

  @override
  String get privacySection4Title => '4. اجازتیں اور وہ کیوں ضروری ہیں';

  @override
  String get privacySection4Paragraphs => 'ایس ایم ایس (وصول/پڑھنا): آنے والے ایس ایم ایس کو پڑھنے کے لیے تاکہ ہم اسکیم پیٹرن کا پتہ لگا سکیں اور آپ کو चेतावنی دکھا سکیں۔\n\nفون (کال اسٹیٹس پڑھنا): یہ جاننے کے لیے کہ آپ کب کال پر ہیں، تاکہ کال کے دوران او ٹی پی آنے پر ہم زیادہ خطرہ دکھا سکیں۔ ہم کال ریکارڈ نہیں کرتے یا سنتے نہیں۔\n\nفون (کال کرنا): تاکہ آپ \"قابلِ بھروسہ رابطے کو کال کریں\" بٹن پر ٹیپ کر سکیں۔ ہم صرف اُن نمبروں پر کال کرتے ہیں جنہیں آپ نے قابلِ بھروسہ رابطہ بنایا ہے اور صرف جب آپ بٹن دباتے ہیں۔\n\nنوٹیفکیشن: جب ہم کوئی مشتبہ یا زیادہ خطرے والا پیغام پائیں تو آپ کو خبردار کرنے کے لیے۔\n\nجب آپ \"اس بھیجنے والے کو بلاک کریں\" منتخب کرتے ہیں، ایپ آپ کے ڈیوائس کا میسیجنگ ایپ کھول سکتی ہے؛ خود ایلڈر شیلڈ ایس ایم ایس نہیں بھیجتا۔';

  @override
  String get privacySection5Title => '5. ڈیٹا کتنی دیر تک رکھا جاتا ہے اور آپ کے اختیارات';

  @override
  String get privacySection5Paragraphs => 'تجزیہ شدہ پیغامات اور اسباب: یہ صرف آپ کے ڈیوائس پر اُس وقت تک رہتے ہیں جب تک آپ سیٹنگز → تمام ہسٹری مٹائیں نہیں منتخب کرتے۔\n\nسیٹنگز اور قابلِ بھروسہ رابطے: جب تک آپ انہیں تبدیل یا حذف نہیں کرتے، یا ایپ ان اِن اسٹال نہیں کرتے، تب تک آپ کے ڈیوائس پر موجود رہتے ہیں۔\n\nہم آپ کے کسی بھی ڈیٹا کی کاپی اپنے سرور پر محفوظ نہیں رکھتے کیونکہ ہم اسے جمع ہی نہیں کرتے۔';

  @override
  String get privacySection6Title => '6. بچے اور حساس صارفین';

  @override
  String get privacySection6Paragraphs => 'یہ ایپ بنیادی طور پر بزرگ اور دیگر حساس صارفین کو اسکیم سے بچانے میں مدد کے لیے بنائی گئی ہے۔ ہم بچوں کا ڈیٹا اس طرح جمع نہیں کرتے کہ جس کے لیے والدین کی قانونی اجازت درکار ہو؛ ایپ کوئی ڈیٹا ڈیوائس کے باہر نہیں بھیجتی۔\n\nاگر آپ کسی اور (مثلاً کسی بزرگ رشتہ دار) کے لیے یہ ایپ سیٹ کر رہے ہیں، تو ہم مشورہ دیتے ہیں کہ آپ انہیں سادہ زبان میں اجازتوں اور اس پالیسی کے بارے میں سمجھا دیں۔';

  @override
  String get privacySection7Title => '7. اس پالیسی میں تبدیلیاں';

  @override
  String get privacySection7Paragraphs => 'اگر ہم اس پالیسی میں تبدیلی کریں (مثلاً مستقبل کے ورژن میں اختیاری کلاؤڈ فیچرز شامل کریں)، تو ہم اس دستاویز کو اپ ڈیٹ کریں گے اور ضرورت پڑنے پر قانون یا اسٹور پالیسی کے مطابق آپ کو مطلع کریں گے یا اجازت طلب کریں گے۔';

  @override
  String get privacySection8Title => '8. رابطہ';

  @override
  String get privacySection8Body => 'ایلڈر شیلڈ کے بارے میں پرائیویسی سے متعلق سوالات یا درخواستوں کے لیے براہِ کرم یہاں رابطہ کریں: [یہاں اپنا رابطہ ای میل یا سپورٹ URL درج کریں]۔';

  @override
  String get privacyLastUpdatedNote => 'آخری اپ ڈیٹ: بلاک 10۔ ریلیز سے پہلے اِن پلیس ہولڈرز کو اصلی معلومات سے بدل دیں۔';

  @override
  String get aboutTagline => 'بزرگ صارفین کے لیے ڈیوائس پر ہی اسکیم سے حفاظت۔';

  @override
  String get messagesAppBarTitle => 'پیغامات';

  @override
  String get messagesFilterAll => 'سب';

  @override
  String get messagesFilterHighRisk => 'زیادہ خطرہ';

  @override
  String get messagesFilterAllSemanticsLabel => 'تمام پیغامات دکھائیں';

  @override
  String get messagesFilterAllSemanticsHint => 'تمام تجزیہ شدہ پیغامات دیکھنے کے لیے ڈبل ٹیپ کریں۔';

  @override
  String get messagesFilterHighRiskSemanticsLabel => 'صرف زیادہ خطرے والے پیغامات دکھائیں';

  @override
  String get messagesFilterHighRiskSemanticsHint => 'سب سے سنگین चेतावنیوں کو دیکھنے کے لیے ڈبل ٹیپ کریں۔';

  @override
  String get messagesErrorTitle => 'پیغامات لوڈ کرتے وقت کچھ غلط ہو گیا۔';

  @override
  String get messagesErrorSubtitle => 'دوبارہ کوشش کے لیے نیچے کھینچیں۔';

  @override
  String get messagesEmptyTitle => 'ابھی تک کوئی پیغام تجزیہ نہیں ہوا۔ ایلڈر شیلڈ نئے پیغامات خود چیک کرے گا۔';

  @override
  String get messagesEmptySubtitle => 'جب ہمیں کچھ مشتبہ ملے گا تو ہم آپ کو بتائیں گے اور آپ اسے یہاں کھول کر دیکھ سکیں گے۔';

  @override
  String get messagesRefreshSnackbar => 'فہرست اپ ڈیٹ ہو گئی';

  @override
  String get messagesLoadingHeader => 'پیغامات لوڈ ہو رہے ہیں…';

  @override
  String messagesDateToday(String time) {
    return 'آج، $time';
  }

  @override
  String messagesDateYesterday(String time) {
    return 'کل، $time';
  }

  @override
  String messagesDateOther(String month, int day, String time) {
    return '$month $day, $time';
  }

  @override
  String onboardingStepOf(int step, int total) {
    return 'مرحلہ $step / $total';
  }

  @override
  String get onboardingWelcomeBody1 => 'ایلڈر شیلڈ آپ کے پیغامات اور کالز پر نظر رکھتا ہے تاکہ اسکیم ہونے پر آپ کو پہلے ہی चेतावनी دے سکے۔';

  @override
  String get onboardingWelcomeBody2 => 'اگر آپ کبھی کنفیوز ہوں تو ایک ٹیپ سے کسی قابلِ بھروسہ شخص کو کال کر سکتے ہیں۔';

  @override
  String get onboardingGetStarted => 'شروع کریں';

  @override
  String get onboardingPermissionsTitle => 'ہمیں ایکسیس کیوں چاہیے';

  @override
  String get onboardingPermissionsBulletMessages => 'پیغامات: تاکہ ہم آپ کے ٹیکسٹ پڑھ سکیں اور کوئی اسکیم جیسا لگے تو آپ کو चेतावनी دے سکیں۔';

  @override
  String get onboardingPermissionsBulletPhone => 'فون: تاکہ ہمیں معلوم ہو آپ کب کال پر ہیں۔ اسکیم کرنے والے اکثر کال کے دوران او ٹی پی مانگتے ہیں۔';

  @override
  String get onboardingPermissionsBody1 => 'نیچے \"اجازتیں دیں\" پر ٹیپ کرنے پر آپ کا ڈیوائس اِن اجازتوں کے لیے پوچھے گا: پیغامات، فون اور نوٹیفکیشنز (تاکہ ہم ایپ بند ہونے پر بھی ممکنہ اسکیم کے بارے میں آپ کو चेतावनी دے سکیں)۔';

  @override
  String get onboardingPermissionsBody2 => 'ہم آپ کے پیغامات صرف اسکیم چیک کرنے کے لیے پڑھتے ہیں، کسی اور مقصد کے لیے نہیں۔';

  @override
  String get onboardingPermissionsRetryWarning => 'کچھ اجازتوں کو مسترد کر دیا گیا۔ جب تک آپ انہیں اجازت نہیں دیتے، حفاظت محدود رہے گی۔';

  @override
  String get onboardingPermissionsPrimaryAllow => 'اجازتیں دیں';

  @override
  String get onboardingPermissionsPrimaryRetry => 'دوبارہ کوشش کریں';

  @override
  String get onboardingSkipForNow => 'فی الحال چھوڑ دیں';

  @override
  String get onboardingTrustedTitle => 'قابلِ بھروسہ رابطہ شامل کریں';

  @override
  String get onboardingTrustedBody1 => 'ایسے شخص کو منتخب کریں جسے آپ پریشان کن پیغام آنے پر کال کرنا چاہیں — مثلاً کوئی گھر والا یا قریبی دوست۔';

  @override
  String get onboardingTrustedBody2 => 'انہیں شامل کرنے کے بعد، آپ ہوم اسکرین یا جب ہم اسکیم चेतावنی دکھائیں، اُس وقت ایک ٹیپ سے اس شخص کو کال کر سکتے ہیں۔';

  @override
  String get onboardingTrustedAddFromContacts => 'رابطوں سے شامل کریں';

  @override
  String get onboardingTrustedAddFromContactsUnavailable => 'اس پری ویو ورژن میں ڈیوائس کا کانٹیکٹ پِکر ابھی دستیاب نہیں ہے۔';

  @override
  String get onboardingTrustedOrEnterManually => 'یا نمبر خود درج کریں:';

  @override
  String get onboardingTrustedDone => 'ہو گیا';

  @override
  String get onboardingTrustedSeeWarningCta => 'دیکھیں चेतावनी کیسی نظر آتی ہے';

  @override
  String get onboardingTrustedMissingFields => 'براہِ کرم نام اور نمبر دونوں درج کریں';

  @override
  String get launchGateChecking => 'چیک ہو رہا ہے…';

  @override
  String get exampleWarningBanner => 'یہ صرف ایک مثال ہے۔ کوئی اصل پیغام یا کارروائی نہیں ہو رہی۔';

  @override
  String get exampleWarningSnackbar => 'یہ صرف مثال تھی۔ کوئی کارروائی نہیں کی گئی۔';

  @override
  String get exampleWarningButton => 'سمجھ گیا — یہ صرف مثال تھی';

  @override
  String get exampleWarningSenderUnknown => 'نامعلوم';

  @override
  String get exampleWarningBody => 'آپ کا بینک اکاؤنٹ 24 گھنٹے کے اندر بلاک کر دیا جائے گا۔ تصدیق کے لیے یہاں کلک کریں: http://secure-bank-verify.com. اسے کسی کے ساتھ شیئر نہ کریں۔';

  @override
  String get exampleWarningReasonSuspiciousLink => 'مشتبہ لنک موجود ہے';

  @override
  String get exampleWarningReasonPretendBank => 'آپ کے بینک کا روپ دھار رہا ہے';

  @override
  String get exampleWarningReasonUrgentLanguage => 'بہت تیزی یا دھمکی آمیز زبان استعمال کی گئی ہے';

  @override
  String get reasonShortUrl => 'کسی مختصر یا مشتبہ لنک کو شامل کرتا ہے';

  @override
  String get reasonOtpMention => 'او ٹی پی یا ایک بار استعمال ہونے والا کوڈ مانگتا ہے یا اس کا ذکر کرتا ہے';

  @override
  String get reasonUrgentLanguage => 'تیز یا دھمکی آمیز زبان استعمال کرتا ہے';

  @override
  String get reasonBankKyc => 'بینک اکاؤنٹ، کے وائی سی یا ادائیگی کی تفصیل کا ذکر کرتا ہے';

  @override
  String get reasonPaymentRequest => 'آپ سے رقم بھیجنے یا ادائیگی کی منظوری دینے کو کہتا ہے';

  @override
  String get reasonPrizeLottery => 'انعام یا لاٹری اسکیم جیسا لگتا ہے';

  @override
  String get reasonParcelDelivery => 'کسی مشتبہ پارسل یا ڈیلیوری مسئلے کا ذکر کرتا ہے';

  @override
  String get reasonCryptoInvestment => 'خطرناک کرپٹو سرمایہ کاری یا پکے منافع کا وعدہ کرتا ہے';

  @override
  String get reasonSenderSuspicious => 'بھیجنے والے کا نام غیر معمولی یا مشتبہ لگتا ہے';

  @override
  String get reasonInCallOtp => 'جب آپ فون کال پر تھے اسی دوران او ٹی پی آیا — یہ عام اسکیم پیٹرن ہے';

  @override
  String messageFromLabel(String sender) {
    return 'بھیجنے والا: $sender';
  }

  @override
  String get fullScreenWarningTitle => 'ممکنہ اسکیم';

  @override
  String get fullScreenWarningClosingNote => 'اس اسکرین کو بند کرنے سے آپ کے فون سے پیغام نہیں مٹے گا۔';

  @override
  String get fullScreenWarningDeleteAction => 'پیغام مٹائیں';

  @override
  String get fullScreenWarningDeleteSnackbar => 'ایلڈر شیلڈ سے ہٹا دیا گیا۔ اب ہم آپ کا میسیجنگ ایپ کھولیں گے تاکہ آپ وہاں سے بھی اسے مٹا سکیں۔';

  @override
  String get fullScreenWarningBlockSender => 'اس بھیجنے والے کو بلاک کریں (میسیجنگ ایپ کھلے گی)';
}
