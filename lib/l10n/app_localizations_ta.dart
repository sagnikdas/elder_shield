// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'எல்டர் ஷீல்ட்';

  @override
  String get settingsTitle => 'அமைப்புகள்';

  @override
  String get homeAppBarTitle => 'எல்டர் ஷீல்ட்';

  @override
  String get homePostOnboardingTitle => 'நீங்கள் இப்போது பாதுகாக்கப்பட்டுள்ளீர்கள்';

  @override
  String homePostOnboardingBody(String contactName) {
    return 'முகப்பு திரையிலிருந்து எந்த நேரத்திலும் $contactNameஐ அழைக்கலாம்.';
  }

  @override
  String get commonGotIt => 'புரிந்தது';

  @override
  String get homeTrustedContactFallbackName => 'உங்கள் நம்பிக்கைத் தொடர்பு';

  @override
  String get permissionsDialogTitle => 'அமைப்புகளில் பாதுகாப்பை இயக்கவும்';

  @override
  String get permissionsDialogBody => 'எல்டர் ஷீல்ட் மோசடி சோதனைக்கு உங்கள் செய்திகளுக்கு SMS மற்றும் தொலைபேசி அணுகல் தேவை.\n\nஇந்த அனுமதிகளை இயக்க ஆப் அமைப்புகளைத் திறக்க விரும்புகிறீர்களா?';

  @override
  String get commonCancel => 'ரத்து';

  @override
  String get permissionsDialogOpenSettings => 'அமைப்புகளைத் திற';

  @override
  String get homeProtectionStatusLabel => 'பாதுகாப்பு நிலை';

  @override
  String get homeProtectionStatusProtected => 'பாதுகாக்கப்பட்டது';

  @override
  String get homeProtectionStatusPermissionsNeeded => 'அனுமதிகள் தேவை';

  @override
  String get homeEnableProtectionButton => 'பாதுகாப்பை இயக்கு';

  @override
  String homeTodayRiskSummaryWithCount(int count) {
    return 'இன்று $count சந்தேகத்திற்குரிய செய்தி(கள்) கண்டறியப்பட்டது.';
  }

  @override
  String get homeTodayRiskSummaryNoRisk => 'இன்று சந்தேகத்திற்குரிய செயல்பாடு இல்லை.';

  @override
  String get homeTodayRiskTapToSeeMessages => 'செய்திகளைப் பார்க்க தட்டவும்';

  @override
  String get commonView => 'பார்க்க';

  @override
  String get homeAutoCheckInfo => 'எல்டர் ஷீல்ட் புதிய செய்திகளை தானாக சோதிக்கும்.';

  @override
  String homeCallTrustedButtonLabel(String name) {
    return '$nameஐ அழைக்கவும்';
  }

  @override
  String get homeCallTooltipText => 'கவலை தரும் செய்தி வரும்போதெல்லாம் இங்கே தட்டவும்.';

  @override
  String get homeAddTrustedIntro => 'பயமுறுத்தும் செய்தி வந்தால் உடனடியாக அழைக்கக்கூடிய நம்பிக்கைத் தொடர்பைச் சேர்க்கவும்.';

  @override
  String get homeAddTrustedButton => 'நம்பிக்கைத் தொடர்பைச் சேர்';

  @override
  String get homeWhyAddTrustedShow => 'நம்பிக்கைத் தொடர்பை ஏன் சேர்க்க வேண்டும்?';

  @override
  String get homeWhyAddTrustedHide => 'காரணத்தை மறை';

  @override
  String get homeWhyAddTrustedExplanation => 'கவலை தரும் செய்தி வந்தால், தனியாக யூகிக்காமல் ஒரு பெரிய பொத்தானைத் தட்டி நம்பிக்கையான நபரை அழைக்க இது உதவும்.';

  @override
  String get homeTrustedContactsHeader => 'உங்கள் நம்பிக்கைத் தொடர்புகள்';

  @override
  String get highRiskHeaderTitle => 'எச்சரிக்கை: இது மோசடி செய்தியாக இருக்கலாம்';

  @override
  String get highRiskHeaderBody => 'இந்த செய்தியின் எந்த இணைப்பையும் தட்டாதீர்கள், எந்த குறியீடும் பகிராதீர்கள்.';

  @override
  String get highRiskWhyFlaggedTitle => 'ஏன் குறிக்கப்பட்டது:';

  @override
  String get actionScam => 'இது மோசடி';

  @override
  String get actionSafe => 'இது பாதுகாப்பானது';

  @override
  String get actionTrustSender => 'Trust this sender';

  @override
  String get snackbarGenericError => 'ஏதோ தவறு நடந்தது. மீண்டும் முயற்சிக்கவும்.';

  @override
  String get snackbarMarkedScam => 'மோசடியாகக் குறிக்கப்பட்டது. நன்றி.';

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
  String get highRiskSwipeUpForDetails => 'மேலும் விவரங்களுக்கு மேலே ஸ்வைப் செய்யவும்';

  @override
  String get riskLowLabel => 'குறைந்த அபாயம்';

  @override
  String get riskMediumLabel => 'நடுத்தர அபாயம் — மறுபரிசீலனை';

  @override
  String get riskHighLabel => 'உயர் அபாயம் — சாத்தியமான மோசடி';

  @override
  String get deleteMessageTitle => 'செய்தியை நீக்கவா?';

  @override
  String get deleteMessageBody => 'நிச்சயமாகவா? இது செய்தியை எல்டர் ஷீல்டிலிருந்து மட்டுமே அகற்றும்.';

  @override
  String get deleteMessageConfirm => 'நீக்கு';

  @override
  String get deleteMessageDeletedSnackbar => 'எல்டர் ஷீல்டிலிருந்து அகற்றப்பட்டது.';

  @override
  String get languageSectionTitle => 'மொழி';

  @override
  String get languageEnglishName => 'ஆங்கிலம்';

  @override
  String get languageBengaliName => 'வங்காளம்';

  @override
  String get languageKannadaName => 'கன்னடம்';

  @override
  String get languageHindiName => 'இந்தி';

  @override
  String get languageUrduName => 'உருது';

  @override
  String get languageAssameseName => 'அசாமியம்';

  @override
  String get languageTamilName => 'தமிழ்';

  @override
  String get languageMalayalamName => 'മലയാളം';

  @override
  String get languageTeluguName => 'தெலுங்கு';

  @override
  String languageSectionSubtitle(String languageName) {
    return 'தற்போது: $languageName';
  }

  @override
  String get snackbarUpdated => 'புதுப்பிக்கப்பட்டது';

  @override
  String get settingsAppearanceTitle => 'தோற்றம்';

  @override
  String get settingsThemeSystem => 'கணினி';

  @override
  String get settingsThemeLight => 'வெளிச்சம்';

  @override
  String get settingsThemeDark => 'இருள்';

  @override
  String get settingsTextSizeTitle => 'எழுத்து அளவு';

  @override
  String get settingsTextSizeDescription => 'எழுத்தை பெரியதாக அல்லது சிறியதாக பார்க்க சரிசெய்யவும். மாற்றங்கள் உடனடியாக பொருந்தும்.';

  @override
  String get settingsTextSizeSample => 'எல்டர் ஷீல்ட் மோசடி செய்திகளிலிருந்து உங்களைப் பாதுகாக்கும்.';

  @override
  String get settingsLegalTitle => 'சட்டம் மற்றும் தகவல்';

  @override
  String get settingsPrivacyPolicyTitle => 'தனியுரிமைக் கொள்கை';

  @override
  String get settingsPrivacyPolicySubtitle => 'உங்கள் தரவை எவ்வாறு பயன்படுத்துகிறோம்';

  @override
  String get settingsPermissionsExplainedTitle => 'அனுமதிகள் விளக்கம்';

  @override
  String get settingsPermissionsExplainedSubtitle => 'ஒவ்வொரு அனுமதியும் ஏன் தேவை';

  @override
  String get settingsSensitivityTitle => 'உணர்திறன்';

  @override
  String get settingsSensitivityLabelConservative => 'குறைந்த எச்சரிக்கைகள்';

  @override
  String get settingsSensitivityLabelBalanced => 'சமநிலை';

  @override
  String get settingsSensitivityLabelSensitive => 'அதிக எச்சரிக்கைகள்';

  @override
  String get settingsSensitivityDescConservative => 'மிகத் தெளிவான மோசடிகள만. குறைந்த எச்சரிக்கை விரும்பினால் பொருத்தம்.';

  @override
  String get settingsSensitivityDescBalanced => 'பெரும்பாலானோருக்கு ஏற்றது. பிடிபட்ட மோசடிகளும் சத்தமும் சமநிலை.';

  @override
  String get settingsSensitivityDescSensitive => 'அதிக மோசடிகளைப் பிடிக்கும்; சிலசமயம் பாதுகாப்பான செய்திகளையும் குறிக்கலாம்.';

  @override
  String get settingsTrustedContactsTitle => 'நம்பிக்கைத் தொடர்புகள்';

  @override
  String get settingsTrustedContactsNone => 'இல்லை';

  @override
  String settingsTrustedContactsCount(int count) {
    return '$count தொடர்பு(கள்)';
  }

  @override
  String get settingsTrustedContactsExplanation => 'முகப்பு திரை அல்லது மோசடி எச்சரிக்கை காட்டும்போது ஒரு தட்டில் இவர்களை அழைக்கலாம். பட்டியலில் முதல் தொடர்பு முதன்மை \"அழைப்பு\" பொத்தானில் பயன்படும்.';

  @override
  String get settingsTrustedContactsAddContactTitle => 'தொடர்பைச் சேர்';

  @override
  String get settingsTrustedContactsAddContactSubtitle => 'பெயர் மற்றும் தொலைபேசி எண்ணை தட்டச்சு செய்யவும்';

  @override
  String get settingsTrustedContactsChooseFromContactsTitle => 'தொடர்புகளிலிருந்து தேர்ந்தெடு';

  @override
  String get settingsTrustedContactsChooseFromContactsSubtitle => 'உங்கள் தொலைபேசியிலிருந்து எண்ணைத் தேர்ந்தெடுக்கவும்';

  @override
  String get settingsTrustedContactsPickerUnavailable => 'இந்த முன்னோட்ட கட்டமைப்பில் சாதனத் தொடர்பு தேர்வி இன்னும் கிடைக்கவில்லை.';

  @override
  String get settingsTrustedContactsRemoveDialogTitle => 'நம்பிக்கைத் தொடர்பை நீக்கவா?';

  @override
  String get settingsTrustedContactsRemoveDialogBody => 'இந்த நபர் இனி நம்பிக்கைத் தொடர்புகள் அல்லது முகப்பு திரையில் காணப்பட மாட்டார்.';

  @override
  String get settingsTrustedContactsRemoveDialogRemove => 'நீக்கு';

  @override
  String get settingsAdvancedSectionTitle => 'மேம்பட்டது';

  @override
  String get settingsDeleteAllHistoryButton => 'அனைத்து வரலாறையும் நீக்கு';

  @override
  String get settingsRerunPermissionsButton => 'அனுமதி சோதனையை மீண்டும் இயக்கு';

  @override
  String get settingsDeleteAllHistoryDialogTitle => 'அனைத்து வரலாறையும் நீக்கவா?';

  @override
  String get settingsDeleteAllHistoryDialogBody => 'இந்த சாதனத்திலிருந்து அனைத்து பகுப்பாய்வு செய்த செய்திகளும் காரணங்களும் நிரந்தரமாக நீக்கப்படும். மீளமுடியாது.';

  @override
  String get settingsDeleteAllHistoryDialogConfirm => 'அனைத்தும் நீக்கு';

  @override
  String get settingsHistoryDeletedSnackbar => 'வரலாறு நீக்கப்பட்டது';

  @override
  String get settingsRerunPermissionsSnackbar => 'அனுமதி சோதனை முடிந்தது. அனுமதி கொடுத்திருந்தால் ஆப்பை மறுதொடக்கம் செய்யவும்.';

  @override
  String get settingsOverlayTitle => 'மற்ற ஆப்புகள் மீது அவசர பாப்-அப்';

  @override
  String get settingsOverlaySubtitleEnabled => 'இயக்கப்பட்டது: உயர் அபாய எச்சரிக்கைகள் மற்ற ஆப்புகள் மீது தோன்றலாம். மற்ற ஆப்பில் இருந்தாலும் எச்சரிக்க விரும்பினால் இது பரிந்துரைக்கப்படுகிறது.';

  @override
  String get settingsOverlaySubtitleDisabled => 'அணை: ஆண்ட்ராய்ட் ஓவர்லே அனுமதியை இயக்க இங்கே தட்டவும். மற்ற ஆப் பயன்படுத்தும்போதும் எச்சரிக்க இது இயக்க இருக்க நல்லது.';

  @override
  String get settingsHowItWorksTitle => 'எல்டர் ஷீல்ட் எவ்வாறு செயல்படுகிறது';

  @override
  String get settingsHowItWorksSubtitle => 'என்ன சோதிக்கிறோம், எப்போது எச்சரிக்கிறோம், நீங்கள் என்ன செய்ய வேண்டும்';

  @override
  String get settingsAboutTitle => 'எல்டர் ஷீல்ட் பற்றி';

  @override
  String get settingsAddTrustedDialogTitle => 'நம்பிக்கைத் தொடர்பைச் சேர்';

  @override
  String get settingsAddTrustedDialogConsent => 'முகப்பு திரை அல்லது மோசடி எச்சரிக்கை திரையிலிருந்து ஒரு தட்டில் அழைக்கலாம்.';

  @override
  String get settingsAddTrustedDialogConfirm => 'சேர்';

  @override
  String get settingsEditTrustedDialogTitle => 'நம்பிக்கைத் தொடர்பைத் திருத்து';

  @override
  String get settingsEditTrustedDialogConfirm => 'சேமி';

  @override
  String get settingsContactNameLabel => 'பெயர்';

  @override
  String get settingsContactNameHint => 'எ.கா: என் மகன்';

  @override
  String get settingsContactNumberLabel => 'தொலைபேசி எண்';

  @override
  String get settingsContactNumberHint => 'எ.கா: +91 98765 43210';

  @override
  String get settingsContactDialogCancel => 'ரத்து';

  @override
  String get settingsContactInvalidNumber => 'செல்லுபடியான தொலைபேசி எண்ணை உள்ளிடவும்';

  @override
  String get howItWorksBulletWhatWeCheck => 'என்ன சோதிக்கிறோம்: உங்கள் SMSஐப் படித்து மோசடி அறிகுறிகளைத் தேடுகிறோம் — சந்தேக இணைப்புகள், அவசர/அச்சுறுத்தும் மொழி, OTP அல்லது வங்கி விவரங்கள் கேட்கும் செய்திகள், உங்கள் வங்கி அல்லது அறியப்பட்ட சேவையைப் போல நடிக்கும் செய்திகள்.';

  @override
  String get howItWorksBulletWhenWeAlert => 'எப்போது எச்சரிக்கிறோம்: செய்தி அபாயமாக இருந்தால் தெரிவிக்கிறோம். உயர் அபாய செய்திகளுக்கு ஆப் பின்னணியில் இருந்தாலும் பாப்-அப் காட்டலாம்; செய்திகள் தாவலில் பட்டியலிடப்படும்.';

  @override
  String get howItWorksBulletWhatToDo => 'எச்சரிக்கை கண்டால் என்ன செய்வது: செய்தியில் எந்த இணைப்பையும் தட்டாதீர்கள். \"இது மோசடி\" அல்லது \"இது பாதுகாப்பானது\" எனக் குறிப்பிட நமக்கு கற்றுத் தரலாம். சிறந்த படி: எச்சரிக்கை திரை அல்லது முகப்பிலிருந்து நம்பிக்கைத் தொடர்பை அழைக்கவும்.';

  @override
  String get howItWorksBulletCallTrusted => 'நம்பிக்கைத் தொடர்பை எவ்வாறு அழைப்பது: முகப்பு திரையில் பெரிய \"அழை [பெயர்]\" பொத்தானை எந்த நேரமும் தட்டவும் — குறிப்பாக கவலை தரும் செய்தி வரும்போது. சாத்தியமான மோசடி காட்டும்போது எச்சரிக்கை திரையிலிருந்தும் அழைக்கலாம்.';

  @override
  String get howItWorksSeeWarningCta => 'எச்சரிக்கை எப்படி இருக்கும் பார்க்கவும்';

  @override
  String get permissionsIntro => 'எல்டர் ஷீல்ட் அனுமதிகளை மோசடியிலிருந்து பாதுகாப்புக்காக மட்டுமே பயன்படுத்தும். எந்த அனுமதியையும் மறுக்கலாம்; பாதுகாப்பு குறைவாக இருக்கும், ஆனால் ஆப் இன்னும் செயல்படும்.';

  @override
  String get permissionsSmsTitle => 'செய்திகள் (SMS)';

  @override
  String get permissionsSmsBody => 'வரும் SMSஐப் பெற்று மோசடி அறிகுறிகளுக்கு (சந்தேக இணைப்புகள், OTP ஃபிஷிங், வங்கி சொற்கள்) பகுப்பாய்வு செய்து தேவைப்படும்போது எச்சரிக்கிறோம். எந்த செய்தி உள்ளடக்கமும் சாதனத்திற்கு வெளியே அனுப்பப்படுவதில்லை. அமைப்புகளிலிருந்து அனைத்து பகுப்பாய்வு வரலாறையும் நீக்கலாம்.';

  @override
  String get permissionsPhoneStateTitle => 'தொலைபேசி (நிலை படி)';

  @override
  String get permissionsPhoneStateBody => 'அழைப்பில் இருக்கும்போது தெரிய வேண்டும்; அழைப்பின்போது OTP வரும்போது அபாய மட்டத்தை உயர்த்த (பொதுவான மோசடி முறை). அழைப்புகளை பதிவு செய்யவோ, ஆடியோ கேட்கவோ, அழைப்பு பதிவை அணுகவோ இல்லை.';

  @override
  String get permissionsPhoneCallTitle => 'தொலைபேசி (அழைப்பு செய்)';

  @override
  String get permissionsPhoneCallBody => 'முகப்பு அல்லது எச்சரிக்கை திரையிலிருந்து \"நம்பிக்கைத் தொடர்பை அழைக்கவும்\" பொத்தானைத் தட்ட \"அழை\" தொடங்க. நீங்கள் பொத்தானைத் தட்டும்போது மட்டுமே, நம்பிக்கைத் தொடர்பாக சேர்த்த எண்களுக்கு மட்டுமே அழைக்கும்.';

  @override
  String get permissionsNotificationsTitle => 'அறிவிப்புகள்';

  @override
  String get permissionsNotificationsBody => 'சந்தேக அல்லது உயர் அபாய செய்தி கண்டறியும்போது விரைவில் தெரிவிக்க. கணினி அமைப்புகளில் அறிவிப்புகளை அணைக்கலாம்; ஆப்பைப் பயன்படுத்த முடியும்.';

  @override
  String get permissionsOverlayTitle => 'மற்ற ஆப்புகள் மீது காட்டு (விரும்பினால்)';

  @override
  String get permissionsOverlayBody => 'அமைப்புகளில் ஆண்ட்ராய்ட் ஓவர்லே அனுமதியை இயக்கினால், உயர் அபாய செய்தி வரும்போது எல்டர் ஷீல்ட் மற்ற ஆப்புகள் மீதும் அவசர எச்சரிக்கை காட்டலாம். முழுமையாக விரும்பினால்; தனிப்பட்ட பாதுகாப்புக்காக.';

  @override
  String get privacyTitle => 'தனியுரிமைக் கொள்கை';

  @override
  String get privacySection1Title => '1. நாங்கள் யார்';

  @override
  String get privacySection1Body => 'எல்டர் ஷீல்ட் ஒரு ஆண்ட்ராய்ட் ஆப்; சாதனத்திலேயே செய்திகளை பகுப்பாய்வு செய்து சந்தேகமானவற்றை எச்சரித்து, மூப்பான பயனர்களை SMS மற்றும் அழைப்பு மோசடிகளிலிருந்து பாதுகாக்க உதவுகிறது.';

  @override
  String get privacySection2Title => '2. எந்தத் தரவைச் செயலாக்குகிறோம்';

  @override
  String get privacySection2Paragraphs => 'அனைத்து செயலாக்கமும் உங்கள் சாதனத்திலேயே. உங்கள் செய்திகள், அழைப்பு நிலை அல்லது பிற தனிப்பட்ட தரவை எங்கள் சர்வர்களுக்கோ மூன்றாம் தரப்பிற்கோ அனுப்புவதில்லை.\n\nசெய்தி தரவு: SMS வரும்போது ஆப் அனுப்புநர், உரை, நேரத்தைப் படிக்கும். இத் தரவு சாதன மோசடி கண்டறிதலுக்கு மட்டுமே. முடிவுகள் சாதனத்திலேயே சேமிக்கப்படும். அமைப்புகள் → அனைத்து வரலாறையும் நீக்கு வழியாக எந்த நேரமும் நீக்கலாம்.\n\nஅழைப்பு நிலை: நீங்கள் அழைப்பில் இருக்கிறீர்களா என சோதிக்கும். அழைப்புகள் பதிவு/கேட்க/அழைப்பு பதிவு அணுகுவதில்லை. அழைப்பு நிலை கண்டறிதலை மேம்படுத்த (எ.கா அழைப்பின்போது OTP வரும்போது எச்சரிக்க) மட்டுமே.\n\nஅமைப்புகள் மற்றும் நம்பிக்கைத் தொடர்புகள்: சாதனத்தின் பாதுகாப்பு சேமிப்பிலேயே. \"நம்பிக்கைத் தொடர்பை அழைக்கவும்\" பொத்தானுக்கு மட்டுமே; தானாக அழைக்கவோ செய்தி அனுப்பவோ இல்லை.';

  @override
  String get privacySection3Title => '3. நாங்கள் செய்யாதவை';

  @override
  String get privacySection3Paragraphs => 'உங்கள் SMS உள்ளடக்கம், அழைப்பு நிலை அல்லது தொடர்புப் பட்டியலை இணையத்திற்கு அனுப்புவதில்லை.\n\nதரவை விளம்பரதாரர்கள்/தரவு தரகர்களுக்கு விற்கவோ வாடகைக்கோ பகிரவோ இல்லை.\n\nகணக்கு அல்லது உள்நுழைவு தேவையில்லை. தேவையான அனுமதிகளுக்குப் பிறகு ஆப் முழுமையாக ஆஃப்லைனில் இயங்கும்.\n\nRCS/சாட் செய்திகளைப் படிக்கவோ பகுப்பாய்வு செய்யவோ இல்லை; நிலையான SMS மட்டுமே.';

  @override
  String get privacySection4Title => '4. அனுமதிகள் மற்றும் ஏன் தேவை';

  @override
  String get privacySection4Paragraphs => 'SMS (பெறு/படி): வரும் SMS படிக்க மோசடி முறைகளைக் கண்டறிய எச்சரிக்க. தொலைபேசி (அழைப்பு நிலை படி): அழைப்பில் இருக்கும்போது தெரிய; அழைப்பின்போது OTP வரும்போது உயர் அபாயம். அழைப்புகள் பதிவு/கேட்க இல்லை. தொலைபேசி (அழை): \"நம்பிக்கைத் தொடர்பை அழைக்கவும்\" தட்ட. நீங்கள் சேர்த்த நம்பிக்கைத் தொடர்பு எண்களுக்கு மட்டுமே, நீங்கள் தட்டும்போது மட்டுமே. அறிவிப்புகள்: சந்தேக/உயர் அபாய செய்தி கண்டறியும்போது தெரிவிக்க. \"இந்த அனுப்புநரைத் தடு\" தேர்ந்தால் ஆப் மெசேஜிங் ஆப்பைத் திறக்கலாம்; ஆப் தானே SMS அனுப்புவதில்லை.';

  @override
  String get privacySection5Title => '5. தரவு தங்கல் மற்றும் உங்கள் தேர்வுகள்';

  @override
  String get privacySection5Paragraphs => 'பகுப்பாய்வு செய்த செய்திகள்/காரணங்கள்: அமைப்புகள் → அனைத்து வரலாறையும் நீக்கு தேர்ந்ததுவரை சாதனத்திலேயே. அமைப்புகள்/நம்பிக்கைத் தொடர்புகள்: மாற்ற/நீக்க அல்லது ஆப் நீக்கும் வரை சாதனத்திலேயே. எங்கள் சர்வர்களில் உங்கள் தரவின் நகல் வைக்கவில்லை; சேகரிப்பதில்லை.';

  @override
  String get privacySection6Title => '6. குழந்தைகள் மற்றும் உணர்திறன் பயனர்கள்';

  @override
  String get privacySection6Paragraphs => 'ஆப் முதன்மையாக மூப்பான மற்றும் பாதிக்கப்படும் பயனர்களை மோசடியிலிருந்து பாதுகாக்க உதவ வடிவமைக்கப்பட்டது. குழந்தைகளிடமிருந்து பெற்றோர் சம்மதம் தேவைப்படும் வகையில் தரவு சேகரிப்பதில்லை; ஆப் தரவை சாதனத்திற்கு வெளியே அனுப்புவதில்லை.\n\nவேறொருவருக்காக (எ.கா மூப்பான குடும்ப உறுப்பினர்) ஆப்பை அமைக்கும்போது அனுமதிகளையும் இக் கொள்கையையும் எளிய மொழியில் விளக்க பரிந்துரைக்கிறோம்.';

  @override
  String get privacySection7Title => '7. இக் கொள்கையில் மாற்றங்கள்';

  @override
  String get privacySection7Paragraphs => 'இக் கொள்கையை மாற்றினால் (எ.கா எதிர்கால பதிப்பில் விரும்பினால் கிளவுட் அம்சங்கள்), இந்த ஆவணத்தைப் புதுப்பித்து சட்டம்/ஸ்டோர் கொள்கைப்படி தெரிவிக்கவோ சம்மதம் கேட்கவோ செய்வோம்.';

  @override
  String get privacySection8Title => '8. தொடர்பு';

  @override
  String get privacySection8Body => 'எல்டர் ஷீல்ட் தொடர்பான தனியுரிமை கேள்விகள்/கோரிக்கைகளுக்கு இங்கே தொடர்பு கொள்ளவும்: [உங்கள் மின்னஞ்சல் அல்லது ஆதரவு URL இங்கே சேர்க்கவும்].';

  @override
  String get privacyLastUpdatedNote => 'கடைசி புதுப்பிப்பு: பிளாக் 10. வெளியீட்டுக்கு முன் பிளேஸ்ஹோல்டர்களை உண்மையான தகவலால் மாற்றவும்.';

  @override
  String get aboutTagline => 'மூப்பான பயனர்களுக்கு சாதனத்திலேயே மோசடி பாதுகாப்பு.';

  @override
  String get messagesAppBarTitle => 'செய்திகள்';

  @override
  String get messagesFilterAll => 'அனைத்தும்';

  @override
  String get messagesFilterHighRisk => 'உயர் அபாயம்';

  @override
  String get messagesFilterAllSemanticsLabel => 'அனைத்து செய்திகளையும் காட்டு';

  @override
  String get messagesFilterAllSemanticsHint => 'அனைத்து பகுப்பாய்வு செய்த செய்திகளைப் பார்க்க இரட்டை தட்டவும்.';

  @override
  String get messagesFilterHighRiskSemanticsLabel => 'உயர் அபாய செய்திகள만 காட்டு';

  @override
  String get messagesFilterHighRiskSemanticsHint => 'மிகக் கடுமையான எச்சரிக்கைகளைப் பார்க்க இரட்டை தட்டவும்.';

  @override
  String get messagesErrorTitle => 'செய்திகள் ஏற்றும்போது ஏதோ தவறு நடந்தது.';

  @override
  String get messagesErrorSubtitle => 'மீண்டும் முயற்சிக்க கீழே இழுக்கவும்.';

  @override
  String get messagesEmptyTitle => 'இன்னும் எந்த செய்தியும் பகுப்பாய்வு செய்யப்படவில்லை. எல்டர் ஷீல்ட் புதிய செய்திகளை தானாக சோதிக்கும்.';

  @override
  String get messagesEmptySubtitle => 'சந்தேகமானது கண்டறியும்போது தெரிவிப்போம்; இங்கிருந்து திறக்கலாம்.';

  @override
  String get messagesRefreshSnackbar => 'பட்டியல் புதுப்பிக்கப்பட்டது';

  @override
  String get messagesLoadingHeader => 'செய்திகள் ஏற்றப்படுகின்றன…';

  @override
  String messagesDateToday(String time) {
    return 'இன்று, $time';
  }

  @override
  String messagesDateYesterday(String time) {
    return 'நேற்று, $time';
  }

  @override
  String messagesDateOther(String month, int day, String time) {
    return '$month $day, $time';
  }

  @override
  String onboardingStepOf(int step, int total) {
    return 'படி $step / $total';
  }

  @override
  String get onboardingWelcomeBody1 => 'எல்டர் ஷீல்ட் உங்கள் செய்திகளையும் அழைப்புகளையும் கண்காணிக்கும்; மோசடி இருந்தால் முன்கூட்டியே எச்சரிக்கும்.';

  @override
  String get onboardingWelcomeBody2 => 'எப்போதாவது உறுதியற்றிருந்தால் ஒரு தட்டில் நம்பிக்கையான நபரை அழைக்கலாம்.';

  @override
  String get onboardingGetStarted => 'தொடங்கு';

  @override
  String get onboardingPermissionsTitle => 'எங்களுக்கு அணுகல் ஏன் தேவை';

  @override
  String get onboardingPermissionsBulletMessages => 'செய்திகள்: உங்கள் உரையைப் படித்து மோசடி போல இருந்தால் எச்சரிக்க.';

  @override
  String get onboardingPermissionsBulletPhone => 'தொலைபேசி: அழைப்பில் இருக்கும்போது தெரிய. மோசடி செய்பவர்கள் அழைப்பின்போது OTP கேட்கும்.';

  @override
  String get onboardingPermissionsBody1 => 'கீழே \"அனுமதிகளைக் கொடு\" தட்டினால் சாதனம் கேட்கும்: செய்திகள், தொலைபேசி, அறிவிப்புகள் (ஆப் மூடியிருந்தாலும் சாத்தியமான மோசடி பற்றி எச்சரிக்க).';

  @override
  String get onboardingPermissionsBody2 => 'மோசடி சோதனைக்கு மட்டுமே செய்திகளைப் படிக்கிறோம்; வேறு எதற்கும் இல்லை.';

  @override
  String get onboardingPermissionsRetryWarning => 'சில அனுமதிகள் மறுக்கப்பட்டன. அனுமதி கொடுக்கும் வரை பாதுகாப்பு குறைவு.';

  @override
  String get onboardingPermissionsPrimaryAllow => 'அனுமதிகளைக் கொடு';

  @override
  String get onboardingPermissionsPrimaryRetry => 'மீண்டும் முயற்சி';

  @override
  String get onboardingSkipForNow => 'இப்போதைக்கு தவிர்';

  @override
  String get onboardingTrustedTitle => 'நம்பிக்கைத் தொடர்பைச் சேர்';

  @override
  String get onboardingTrustedBody1 => 'கவலை தரும் செய்தி வந்தால் அழைக்க விரும்பும் நபரைத் தேர்ந்தெடுக்கவும் — குடும்ப உறுப்பினர் அல்லது நெருங்கிய நண்பர்.';

  @override
  String get onboardingTrustedBody2 => 'சேர்த்த பிறகு முகப்பு திரை அல்லது மோசடி எச்சரிக்கை காட்டும்போது ஒரு தட்டில் இவரை அழைக்கலாம்.';

  @override
  String get onboardingTrustedAddFromContacts => 'தொடர்புகளிலிருந்து சேர்';

  @override
  String get onboardingTrustedAddFromContactsUnavailable => 'இந்த முன்னோட்ட பதிப்பில் சாதனத் தொடர்பு தேர்வி இன்னும் கிடைக்கவில்லை.';

  @override
  String get onboardingTrustedOrEnterManually => 'அல்லது எண்ணை கைமுறையாக உள்ளிடவும்:';

  @override
  String get onboardingTrustedDone => 'முடிந்தது';

  @override
  String get onboardingTrustedSeeWarningCta => 'எச்சரிக்கை எப்படி இருக்கும் பார்க்கவும்';

  @override
  String get onboardingTrustedMissingFields => 'பெயர் மற்றும் எண் இரண்டையும் உள்ளிடவும்';

  @override
  String get launchGateChecking => 'சோதிக்கிறது…';

  @override
  String get exampleWarningBanner => 'இது ஒரு உதாரணம் மட்டுமே. உண்மையான செய்தி அல்லது செயல் இல்லை.';

  @override
  String get exampleWarningSnackbar => 'இது உதாரணம் மட்டுமே. எந்த செயலும் எடுக்கப்படவில்லை.';

  @override
  String get exampleWarningButton => 'புரிந்தது — இது உதாரணம் மட்டுமே';

  @override
  String get exampleWarningSenderUnknown => 'அறியப்படாதது';

  @override
  String get exampleWarningBody => 'உங்கள் வங்கி கணக்கு 24 மணி நேரத்தில் தடுக்கப்படும். சரிபார்க்க இங்கே கிளிக் செய்யவும்: http://secure-bank-verify.com. யாருடனும் பகிர வேண்டாம்.';

  @override
  String get exampleWarningReasonSuspiciousLink => 'சந்தேக இணைப்பு உள்ளது';

  @override
  String get exampleWarningReasonPretendBank => 'உங்கள் வங்கியைப் போல நடிக்கிறது';

  @override
  String get exampleWarningReasonUrgentLanguage => 'அவசர அல்லது அச்சுறுத்தும் மொழி பயன்படுத்தப்பட்டது';

  @override
  String get reasonShortUrl => 'குறுகிய அல்லது சந்தேக இணைப்பு உள்ளது';

  @override
  String get reasonOtpMention => 'OTP அல்லது ஒருமுறை குறியீடு கேட்கிறது அல்லது குறிப்பிடுகிறது';

  @override
  String get reasonUrgentLanguage => 'அவசர அல்லது அச்சுறுத்தும் மொழி பயன்படுத்துகிறது';

  @override
  String get reasonBankKyc => 'வங்கி கணக்கு, KYC அல்லது பணம் விவரங்கள் குறிப்பிடுகிறது';

  @override
  String get reasonPaymentRequest => 'பணம் அனுப்ப அல்லது பணம் ஒப்புதல் கேட்கிறது';

  @override
  String get reasonPrizeLottery => 'பரிசு/லாட்டரி மோசடி போல் தெரிகிறது';

  @override
  String get reasonParcelDelivery => 'சந்தேக பார்சல் அல்லது டெலிவரி சிக்கல் குறிப்பிடுகிறது';

  @override
  String get reasonCryptoInvestment => 'அபாய கிரிப்டோ முதலீடு அல்லது உறுதியான வருமானம் வாக்குறுதி';

  @override
  String get reasonSenderSuspicious => 'அனுப்புநர் பெயர் அசாதாரண அல்லது சந்தேகமாக தெரிகிறது';

  @override
  String get reasonInCallOtp => 'அழைப்பில் இருந்தபோது OTP வந்தது — பொதுவான மோசடி முறை';

  @override
  String messageFromLabel(String sender) {
    return 'அனுப்புநர்: $sender';
  }

  @override
  String get fullScreenWarningTitle => 'சாத்தியமான மோசடி';

  @override
  String get fullScreenWarningClosingNote => 'இந்த திரையை மூடினால் உங்கள் தொலைபேசியிலிருந்து செய்தி நீக்கப்படாது.';

  @override
  String get fullScreenWarningDeleteAction => 'செய்தியை நீக்கு';

  @override
  String get fullScreenWarningDeleteSnackbar => 'எல்டர் ஷீல்டிலிருந்து அகற்றப்பட்டது. உங்கள் மெசேஜிங் ஆப்பைத் திறக்கிறோம்; அங்கிருந்தும் நீக்கலாம்.';

  @override
  String get fullScreenWarningBlockSender => 'இந்த அனுப்புநரைத் தடு (மெசேஜிங் ஆப் திறக்கும்)';

  @override
  String guardianPlanMonthlyPrice(String price) {
    return '₹$price';
  }

  @override
  String guardianPlanYearlyPrice(String price) {
    return '₹$price';
  }

  @override
  String get guardianPlanTitle => 'கார்டியன் திட்டம்';

  @override
  String get guardianPlanSubtitle => 'குடும்பத்தினருக்கு சந்தேகமான செய்தி வரும்போது அறியுங்கள்';

  @override
  String get guardianPlanWhatYouGet => 'நீங்கள் பெறுவது';

  @override
  String get guardianPlanBenefitAlerts => 'சந்தேகமான செய்திகளில் WhatsApp/SMS எச்சரிக்கைகள்';

  @override
  String get guardianPlanBenefitHeartbeat => 'தினசரி செக்-இன்: அவர்கள் ஃபோன் பாதுகாக்கப்படுவதை அறியுங்கள்';

  @override
  String get guardianPlanBenefitSummary => 'வாராந்திர அச்சுறுத்தல் சுருக்கம்';

  @override
  String get guardianPlanBenefitFamily => '3 குடும்பத்தினரை பாதுகாக்கவும்';

  @override
  String get guardianPlanMonthlyFallback => 'மாதாந்திர திட்டம்';

  @override
  String get guardianPlanYearlyFallback => 'வார்ஷிக திட்டம் — 33% சேமிப்பு';

  @override
  String get guardianPlanYearlySaveBadge => '33% சேமிப்பு';

  @override
  String get guardianPlanRestore => 'கொள்முதல்களை மீட்டமைக்கவும்';

  @override
  String get guardianPlanMaybeLater => 'பிறகு';

  @override
  String get guardianPlanTerms => 'சேவை விதிமுறைகள்';

  @override
  String get guardianPlanPrivacy => 'தனியுரிமை கொள்கை';

  @override
  String get guardianPlanActiveSubtitle => 'கார்டியன் எச்சரிக்கைகள், தினசரி செக்-இன், வாராந்திர சுருக்கம்';

  @override
  String get guardianPlanUpgradeSubtitle => 'குடும்பத்தினருக்கு சந்தேகமான செய்தி வரும்போது அறிவிப்பு பெறுங்கள்';

  @override
  String get guardianPlanActiveBadge => 'செயலில்';
}
