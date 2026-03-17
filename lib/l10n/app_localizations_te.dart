// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'ఎల్డర్ షీల్డ్';

  @override
  String get settingsTitle => 'సెట్టింగ్‌లు';

  @override
  String get homeAppBarTitle => 'ఎల్డర్ షీల్డ్';

  @override
  String get homePostOnboardingTitle => 'మీరు రక్షించబడ్డారు';

  @override
  String homePostOnboardingBody(String contactName) {
    return 'హోమ్ నుండి ఎప్పుడైనా $contactNameని కాల్ చేయవచ్చు.';
  }

  @override
  String get commonGotIt => 'అర్థమైంది';

  @override
  String get homeTrustedContactFallbackName => 'మీ విశ్వసనీయ సంప్రదింపు';

  @override
  String get permissionsDialogTitle => 'సెట్టింగ్‌లలో రక్షణను ఎనేబుల్ చేయండి';

  @override
  String get permissionsDialogBody => 'మోసం సందేశాలను తనిఖీ చేయడానికి ఎల్డర్ షీల్డ్‌కు SMS మరియు ఫోన్ యాక్సెస్ అవసరం.\n\nఈ అనుమతులను ఆన్ చేయడానికి యాప్ సెట్టింగ్‌లను తెరవాలా?';

  @override
  String get commonCancel => 'రద్దు';

  @override
  String get permissionsDialogOpenSettings => 'సెట్టింగ్‌లను తెరువండి';

  @override
  String get homeProtectionStatusLabel => 'రక్షణ స్థితి';

  @override
  String get homeProtectionStatusProtected => 'రక్షించబడింది';

  @override
  String get homeProtectionStatusPermissionsNeeded => 'అనుమతులు అవసరం';

  @override
  String get homeEnableProtectionButton => 'రక్షణను ఎనేబుల్ చేయండి';

  @override
  String homeTodayRiskSummaryWithCount(int count) {
    return 'ఈ రోజు $count అనుమానాస్పద సందేశం(లు) గుర్తించబడ్డాయి.';
  }

  @override
  String get homeTodayRiskSummaryNoRisk => 'ఈ రోజు అనుమానాస్పద కార్యకలాపం లేదు.';

  @override
  String get homeTodayRiskTapToSeeMessages => 'సందేశాలను చూడటానికి టాప్ చేయండి';

  @override
  String get commonView => 'చూడండి';

  @override
  String get homeAutoCheckInfo => 'ఎల్డర్ షీల్డ్ కొత్త సందేశాలను స్వయంచాలకంగా తనిఖీ చేస్తుంది.';

  @override
  String homeCallTrustedButtonLabel(String name) {
    return '$nameని కాల్ చేయండి';
  }

  @override
  String get homeCallTooltipText => 'భయపెట్టే సందేశం వచ్చినప్పుడల్లా ఇక్కడ టాప్ చేయండి.';

  @override
  String get homeAddTrustedIntro => 'భయపెట్టే సందేశం వస్తే వేగంగా కాల్ చేయగల విశ్వసనీయ సంప్రదింపును జోడించండి.';

  @override
  String get homeAddTrustedButton => 'విశ్వసనీయ సంప్రదింపును జోడించండి';

  @override
  String get homeWhyAddTrustedShow => 'విశ్వసనీయ సంప్రదింపు ఎందుకు జోడించాలి?';

  @override
  String get homeWhyAddTrustedHide => 'కారణాన్ని దాచు';

  @override
  String get homeWhyAddTrustedExplanation => 'భయపెట్టే సందేశం వస్తే, ఒంటరిగా ఊహించకుండా ఒక పెద్ద బటన్ టాప్ చేసి విశ్వసించే వ్యక్తిని కాల్ చేయవచ్చు.';

  @override
  String get homeTrustedContactsHeader => 'మీ విశ్వసనీయ సంప్రదింపులు';

  @override
  String get highRiskHeaderTitle => 'హెచ్చరిక: ఇది మోసం సందేశంగా ఉండవచ్చు';

  @override
  String get highRiskHeaderBody => 'ఈ సందేశంలోని ఏ లింక్‌లపైనా టాప్ చేయవద్దు, కోడ్‌లను షేర్ చేయవద్దు.';

  @override
  String get highRiskWhyFlaggedTitle => 'ఎందుకు ఫ్లాగ్ చేయబడింది:';

  @override
  String get actionScam => 'ఇది మోసం';

  @override
  String get actionSafe => 'ఇది సురక్షితం';

  @override
  String get actionTrustSender => 'Trust this sender';

  @override
  String get snackbarGenericError => 'ఏదో తప్పు జరిగింది. మళ్లీ ప్రయత్నించండి.';

  @override
  String get snackbarMarkedScam => 'మోసంగా గుర్తించబడింది. ధన్యవాదాలు.';

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
  String get highRiskSwipeUpForDetails => 'మరింత వివరాలకు పైకి స్వైప్ చేయండి';

  @override
  String get riskLowLabel => 'తక్కువ ప్రమాదం';

  @override
  String get riskMediumLabel => 'మధ్యస్థ ప్రమాదం — సమీక్షించండి';

  @override
  String get riskHighLabel => 'అధిక ప్రమాదం — సాధ్యమైన మోసం';

  @override
  String get deleteMessageTitle => 'సందేశాన్ని తొలగించాలా?';

  @override
  String get deleteMessageBody => 'ఖచ్చితమా? ఇది సందేశాన్ని ఎల్డర్ షీల్డ్ నుండి మాత్రమే తొలగిస్తుంది.';

  @override
  String get deleteMessageConfirm => 'తొలగించు';

  @override
  String get deleteMessageDeletedSnackbar => 'ఎల్డర్ షీల్డ్ నుండి తొలగించబడింది.';

  @override
  String get languageSectionTitle => 'భాష';

  @override
  String get languageEnglishName => 'ఇంగ్లీష్';

  @override
  String get languageBengaliName => 'బెంగాలి';

  @override
  String get languageKannadaName => 'కన్నడ';

  @override
  String get languageHindiName => 'హిందీ';

  @override
  String get languageUrduName => 'ఉర్దూ';

  @override
  String get languageAssameseName => 'అస్సామీస్';

  @override
  String get languageTamilName => 'తమిళం';

  @override
  String get languageMalayalamName => 'మలయాళం';

  @override
  String get languageTeluguName => 'తెలుగు';

  @override
  String languageSectionSubtitle(String languageName) {
    return 'ప్రస్తుతం: $languageName';
  }

  @override
  String get snackbarUpdated => 'నవీకరించబడింది';

  @override
  String get settingsAppearanceTitle => 'రూపం';

  @override
  String get settingsThemeSystem => 'సిస్టమ్';

  @override
  String get settingsThemeLight => 'లైట్';

  @override
  String get settingsThemeDark => 'డార్క్';

  @override
  String get settingsTextSizeTitle => 'టెక్స్ట్ సైజ్';

  @override
  String get settingsTextSizeDescription => 'టెక్స్ట్ పెద్దగా లేదా చిన్నగా చూడడానికి సర్దుబాటు చేయండి. మార్పులు వెంటనే వర్తిస్తాయి.';

  @override
  String get settingsTextSizeSample => 'ఎల్డర్ షీల్డ్ మోసం సందేశాల నుండి మిమ్మల్ని రక్షిస్తుంది.';

  @override
  String get settingsLegalTitle => 'చట్టం మరియు సమాచారం';

  @override
  String get settingsPrivacyPolicyTitle => 'గోప్యతా విధానం';

  @override
  String get settingsPrivacyPolicySubtitle => 'మీ డేటాను ఎలా ఉపయోగిస్తాము';

  @override
  String get settingsPermissionsExplainedTitle => 'అనుమతులు వివరణ';

  @override
  String get settingsPermissionsExplainedSubtitle => 'ప్రతి అనుమతి ఎందుకు అవసరం';

  @override
  String get settingsSensitivityTitle => 'సున్నితత్వం';

  @override
  String get settingsSensitivityLabelConservative => 'తక్కువ హెచ్చరికలు';

  @override
  String get settingsSensitivityLabelBalanced => 'సమతుల్యం';

  @override
  String get settingsSensitivityLabelSensitive => 'ఎక్కువ హెచ్చరికలు';

  @override
  String get settingsSensitivityDescConservative => 'చాలా స్పష్టమైన మోసాలు మాత్రమే. తక్కువ హెచ్చరికలు ఇష్టమైతే అనువైనది.';

  @override
  String get settingsSensitivityDescBalanced => 'చాలా మందికి అనువైనది. పట్టుకున్న మోసాలు మరియు శబ్దం సమతుల్యం.';

  @override
  String get settingsSensitivityDescSensitive => 'ఎక్కువ మోసాలను పట్టుకుంటుంది; కొన్నిసార్లు సురక్షిత సందేశాలను కూడా ఫ్లాగ్ చేయవచ్చు.';

  @override
  String get settingsTrustedContactsTitle => 'విశ్వసనీయ సంప్రదింపులు';

  @override
  String get settingsTrustedContactsNone => 'ఏవీ లేవు';

  @override
  String settingsTrustedContactsCount(int count) {
    return '$count సంప్రదింపు(లు)';
  }

  @override
  String get settingsTrustedContactsExplanation => 'హోమ్ నుండి లేదా మోసం హెచ్చరిక చూపించినప్పుడు ఒక టాప్‌తో వారిని కాల్ చేయవచ్చు. జాబితాలో మొదటిది ప్రధాన \"కాల్\" బటన్‌కు ఉపయోగించబడుతుంది.';

  @override
  String get settingsTrustedContactsAddContactTitle => 'సంప్రదింపును జోడించండి';

  @override
  String get settingsTrustedContactsAddContactSubtitle => 'పేరు మరియు ఫోన్ నంబర్ టైప్ చేయండి';

  @override
  String get settingsTrustedContactsChooseFromContactsTitle => 'సంప్రదింపుల నుండి ఎంచుకోండి';

  @override
  String get settingsTrustedContactsChooseFromContactsSubtitle => 'మీ ఫోన్ నుండి నంబర్ ఎంచుకోండి';

  @override
  String get settingsTrustedContactsPickerUnavailable => 'ఈ ప్రివ్యూ బిల్డ్‌లో డివైస్ కాంటాక్ట్ పికర్ ఇంకా అందుబాటులో లేదు.';

  @override
  String get settingsTrustedContactsRemoveDialogTitle => 'విశ్వసనీయ సంప్రదింపును తొలగించాలా?';

  @override
  String get settingsTrustedContactsRemoveDialogBody => 'ఈ వ్యక్తి విశ్వసనీయ సంప్రదింపులు లేదా హోమ్ స్క్రీన్‌లో ఇకపై కనిపించరు.';

  @override
  String get settingsTrustedContactsRemoveDialogRemove => 'తొలగించు';

  @override
  String get settingsAdvancedSectionTitle => 'అధునాతన';

  @override
  String get settingsDeleteAllHistoryButton => 'అన్ని చరిత్రను తొలగించండి';

  @override
  String get settingsRerunPermissionsButton => 'అనుమతి చెక్ మళ్లీ రన్ చేయండి';

  @override
  String get settingsDeleteAllHistoryDialogTitle => 'అన్ని చరిత్రను తొలగించాలా?';

  @override
  String get settingsDeleteAllHistoryDialogBody => 'ఈ డివైస్ నుండి అన్ని విశ్లేషించిన సందేశాలు మరియు కారణాలు శాశ్వతంగా తొలగించబడతాయి. తిరిగి చేయలేము.';

  @override
  String get settingsDeleteAllHistoryDialogConfirm => 'అన్నీ తొలగించు';

  @override
  String get settingsHistoryDeletedSnackbar => 'చరిత్ర తొలగించబడింది';

  @override
  String get settingsRerunPermissionsSnackbar => 'అనుమతి చెక్ పూర్తయింది. అనుమతి ఇచ్చినట్లయితే యాప్‌ను రీస్టార్ట్ చేయండి.';

  @override
  String get settingsOverlayTitle => 'ఇతర యాప్‌ల మీద అత్యవసర పాప్-అప్';

  @override
  String get settingsOverlaySubtitleEnabled => 'ఎనేబుల్: అధిక ప్రమాద హెచ్చరికలు ఇతర యాప్‌ల మీద కనిపించవచ్చు. మరొక యాప్‌లో ఉన్నప్పటికీ హెచ్చరించాలనుకుంటే సిఫార్సు.';

  @override
  String get settingsOverlaySubtitleDisabled => 'ఆఫ్: ఆండ్రాయిడ్ ఓవర్లే అనుమతిని ఎనేబుల్ చేయడానికి ఇక్కడ టాప్ చేయండి. మరొక యాప్ ఉపయోగిస్తున్నప్పటికీ హెచ్చరిక ఎనేబుల్ ఉండటం మంచిది.';

  @override
  String get settingsHowItWorksTitle => 'ఎల్డర్ షీల్డ్ ఎలా పనిచేస్తుంది';

  @override
  String get settingsHowItWorksSubtitle => 'మేము ఏమి తనిఖీ చేస్తాము, ఎప్పుడు హెచ్చరిస్తాము, మీరు ఏమి చేయాలి';

  @override
  String get settingsAboutTitle => 'ఎల్డర్ షీల్డ్ గురించి';

  @override
  String get settingsAddTrustedDialogTitle => 'విశ్వసనీయ సంప్రదింపును జోడించండి';

  @override
  String get settingsAddTrustedDialogConsent => 'హోమ్ నుండి లేదా మోసం హెచ్చరిక చూపించినప్పుడు ఒక టాప్‌తో వారిని కాల్ చేయవచ్చు.';

  @override
  String get settingsAddTrustedDialogConfirm => 'జోడించండి';

  @override
  String get settingsEditTrustedDialogTitle => 'విశ్వసనీయ సంప్రదింపును సవరించండి';

  @override
  String get settingsEditTrustedDialogConfirm => 'సేవ్';

  @override
  String get settingsContactNameLabel => 'పేరు';

  @override
  String get settingsContactNameHint => 'ఉదా: నా కుమారుడు';

  @override
  String get settingsContactNumberLabel => 'ఫోన్ నంబర్';

  @override
  String get settingsContactNumberHint => 'ఉదా: +91 98765 43210';

  @override
  String get settingsContactDialogCancel => 'రద్దు';

  @override
  String get settingsContactInvalidNumber => 'చెల్లుబాటు అయ్యే ఫోన్ నంబర్ నమోదు చేయండి';

  @override
  String get howItWorksBulletWhatWeCheck => 'మేము ఏమి తనిఖీ చేస్తాము: మీ SMSను చదివి మోసం సంకేతాల కోసం చూస్తాము — అనుమానాస్పద లింక్‌లు, అత్యవసర/బెదిరించే భాష, OTP లేదా బ్యాంక్ వివరాలను అడిగే సందేశాలు, మీ బ్యాంక్ లేదా తెలిసిన సేవలా నటించే సందేశాలు.';

  @override
  String get howItWorksBulletWhenWeAlert => 'ఎప్పుడు హెచ్చరిస్తాము: సందేశం ప్రమాదంగా ఉంటే తెలియజేస్తాము. అధిక ప్రమాద సందేశాలకు యాప్ బ్యాక్‌గ్రౌండ్‌లో ఉన్నప్పటికీ పాప్-అప్ చూపించవచ్చు; సందేశాలు ట్యాబ్‌లో జాబితా చేయబడతాయి.';

  @override
  String get howItWorksBulletWhatToDo => 'హెచ్చరిక చూసినప్పుడు ఏమి చేయాలి: సందేశంలోని ఏ లింక్‌పైనా టాప్ చేయవద్దు. \"ఇది మోసం\" లేదా \"ఇది సురక్షితం\" గుర్తించి మాకు నేర్చుకోవడానికి సహాయపడవచ్చు. ఉత్తమం: హెచ్చరిక స్క్రీన్ నుండి లేదా హోమ్ నుండి విశ్వసనీయ సంప్రదింపును కాల్ చేయండి.';

  @override
  String get howItWorksBulletCallTrusted => 'విశ్వసనీయ సంప్రదింపును ఎలా కాల్ చేయాలి: హోమ్ స్క్రీన్‌లో పెద్ద \"కాల్ [పేరు]\" బటన్‌ను ఎప్పుడైనా టాప్ చేయండి — ముఖ్యంగా భయపెట్టే సందేశం వచ్చినప్పుడు. సాధ్యమైన మోసం చూపించినప్పుడు హెచ్చరిక స్క్రీన్ నుండి కూడా కాల్ చేయవచ్చు.';

  @override
  String get howItWorksSeeWarningCta => 'హెచ్చరిక ఎలా ఉంటుంది చూడండి';

  @override
  String get permissionsIntro => 'ఎల్డర్ షీల్డ్ మోసం నుండి రక్షణ కోసం మాత్రమే అనుమతులను ఉపయోగిస్తుంది. ఏ అనుమతినైనా నిరాకరించవచ్చు; రక్షణ పరిమితంగా ఉంటుంది కానీ యాప్ ఇంకా పనిచేస్తుంది.';

  @override
  String get permissionsSmsTitle => 'సందేశాలు (SMS)';

  @override
  String get permissionsSmsBody => 'వచ్చే SMSను స్వీకరించి మోసం సంకేతాల కోసం (అనుమానాస్పద లింక్‌లు, OTP ఫిషింగ్, బ్యాంక్ పదాలు) విశ్లేషించి అవసరమైతే హెచ్చరిస్తాము. ఏ సందేశ కంటెంట్ కూడా మీ డివైస్ నుండి పంపబడదు. సెట్టింగ్‌ల నుండి అన్ని విశ్లేషణ చరిత్రను తొలగించవచ్చు.';

  @override
  String get permissionsPhoneStateTitle => 'ఫోన్ (స్థితి చదవండి)';

  @override
  String get permissionsPhoneStateBody => 'మీరు కాల్‌లో ఉన్నప్పుడు తెలుసుకోవాలి; కాల్‌లో ఉన్నప్పుడు OTP వచ్చినప్పుడు ప్రమాద స్థాయిని పెంచడానికి (సాధారణ మోసం నమూనా). కాల్‌లను రికార్డ్ చేయము, ఆడియో వినము, కాల్ లాగ్ యాక్సెస్ చేయము.';

  @override
  String get permissionsPhoneCallTitle => 'ఫోన్ (కాల్‌లు చేయండి)';

  @override
  String get permissionsPhoneCallBody => 'హోమ్ నుండి లేదా హెచ్చరిక నుండి \"విశ్వసనీయ సంప్రదింపును కాల్ చేయండి\" బటన్ టాప్ చేసి కాల్ ప్రారంభించడానికి. మీరు బటన్ టాప్ చేసినప్పుడు మాత్రమే, విశ్వసనీయ సంప్రదింపులుగా జోడించిన నంబర్‌లకు మాత్రమే కాల్ చేస్తాము.';

  @override
  String get permissionsNotificationsTitle => 'నోటిఫికేషన్‌లు';

  @override
  String get permissionsNotificationsBody => 'అనుమానాస్పద లేదా అధిక ప్రమాద సందేశాన్ని గుర్తించినప్పుడు వేగంగా తెలియజేయడానికి. సిస్టమ్ సెట్టింగ్‌లలో నోటిఫికేషన్‌లను ఆఫ్ చేయవచ్చు; యాప్ ఇంకా ఉపయోగించవచ్చు.';

  @override
  String get permissionsOverlayTitle => 'ఇతర యాప్‌ల మీద చూపించండి (ఐచ్ఛికం)';

  @override
  String get permissionsOverlayBody => 'సెట్టింగ్‌లలో ఆండ్రాయిడ్ ఓవర్లే అనుమతిని ఎనేబుల్ చేస్తే, అధిక ప్రమాద సందేశం వచ్చినప్పుడు ఎల్డర్ షీల్డ్ ఇతర యాప్‌ల మీద అత్యవసర హెచ్చరిక చూపించవచ్చు. పూర్తిగా ఐచ్ఛికం; వ్యక్తిగత భద్రత కోసం.';

  @override
  String get privacyTitle => 'గోప్యతా విధానం';

  @override
  String get privacySection1Title => '1. మేము ఎవరు';

  @override
  String get privacySection1Body => 'ఎల్డర్ షీల్డ్ డివైస్‌లోనే సందేశాలను విశ్లేషించి అనుమానాస్పదమైనవాటిని హెచ్చరించి, వృద్ధులను SMS మరియు కాల్ మోసాల నుండి రక్షించడానికి సహాయించే ఆండ్రాయిడ్ యాప్.';

  @override
  String get privacySection2Title => '2. మేము ఏ డేటాను ప్రాసెస్ చేస్తాము';

  @override
  String get privacySection2Paragraphs => 'అన్ని ప్రాసెసింగ్ మీ డివైస్‌లోనే జరుగుతుంది. మీ సందేశాలు, కాల్ స్థితి లేదా ఇతర వ్యక్తిగత డేటాను మా సర్వర్‌లకు లేదా మూడవ పక్షానికి పంపము.\n\nసందేశ డేటా: SMS వచ్చినప్పుడు యాప్ పంపినవారు, బాడీ, టైమ్‌స్టాంప్ చదువుతుంది. ఈ డేటా డివైస్ మోసం గుర్తింపు కోసం మాత్రమే. ఫలితాలు మీ డివైస్‌లోనే నిల్వ చేయబడతాయి. సెట్టింగ్‌ల → అన్ని చరిత్రను తొలగించండి ద్వారా ఎప్పుడైనా తొలగించవచ్చు.\n\nకాల్ స్థితి: మీరు కాల్‌లో ఉన్నారా అని తనిఖీ చేస్తుంది. కాల్‌లను రికార్డ్/వినడం/కాల్ లాగ్ యాక్సెస్ చేయము. కాల్ స్థితి గుర్తింపును మెరుగుపరచడానికి మాత్రమే (ఉదా కాల్‌లో ఉన్నప్పుడు OTP వచ్చినప్పుడు హెచ్చరిక).\n\nసెట్టింగ్‌లు మరియు విశ్వసనీయ సంప్రదింపులు: డివైస్ సురక్షిత నిల్వలో మాత్రమే. \"విశ్వసనీయ సంప్రదింపును కాల్ చేయండి\" బటన్ కోసం మాత్రమే; స్వయంచాలకంగా కాల్ లేదా మెసేజ్ చేయము.';

  @override
  String get privacySection3Title => '3. మేము చేయనివి';

  @override
  String get privacySection3Paragraphs => 'మీ SMS కంటెంట్, కాల్ స్థితి లేదా కాంటాక్ట్ లిస్ట్‌ను ఇంటర్నెట్‌కు పంపము.\n\nఅడ్వర్టైజర్‌లు/డేటా బ్రోకర్‌లకు డేటాను విక్రయ/అద్దె/షేర్ చేయము.\n\nఖాతా లేదా సైన్-ఇన్ అవసరం లేదు. అనుమతులు ఇచ్చిన తర్వాత యాప్ పూర్తిగా ఆఫ్‌లైన్‌లో పనిచేస్తుంది.\n\nRCS/చాట్ సందేశాలను చదువము లేదా విశ్లేషించము; స్టాండర్డ్ SMS మాత్రమే.';

  @override
  String get privacySection4Title => '4. అనుమతులు మరియు ఎందుకు అవసరం';

  @override
  String get privacySection4Paragraphs => 'SMS (స్వీకరించు/చదువు): వచ్చే SMS చదివి మోసం నమూనాలను గుర్తించి హెచ్చరించడానికి. ఫోన్ (కాల్ స్థితి చదువు): కాల్‌లో ఉన్నప్పుడు తెలుసుకోవడానికి; కాల్‌లో ఉన్నప్పుడు OTP వచ్చినప్పుడు అధిక ప్రమాదం. కాల్‌లను రికార్డ్/వినడం లేదు. ఫోన్ (కాల్): \"విశ్వసనీయ సంప్రదింపును కాల్ చేయండి\" టాప్. మీరు విశ్వసనీయ సంప్రదింపులుగా జోడించిన నంబర్‌లకు మాత్రమే, మీరు టాప్ చేసినప్పుడు మాత్రమే. నోటిఫికేషన్‌లు: అనుమానాస్పద/అధిక ప్రమాద సందేశాన్ని గుర్తించినప్పుడు తెలియజేయడానికి. \"ఈ పంపినవారిని బ్లాక్ చేయండి\" ఎంచుకుంటే యాప్ మెసేజింగ్ యాప్‌ను తెరుస్తుంది; యాప్ స్వయంగా SMS పంపదు.';

  @override
  String get privacySection5Title => '5. డేటా నిలుపుదల మరియు మీ ఎంపికలు';

  @override
  String get privacySection5Paragraphs => 'విశ్లేషించిన సందేశాలు/కారణాలు: సెట్టింగ్‌ల → అన్ని చరిత్రను తొలగించండి ఎంచుకునే వరకు డివైస్‌లోనే. సెట్టింగ్‌లు/విశ్వసనీయ సంప్రదింపులు: మార్చు/తొలగించు లేదా యాప్ అన్‌ఇన్‌స్టాల్ చేయే వరకు డివైస్‌లోనే. మా సర్వర్‌లలో మీ డేటా కాపీ నిల్వ చేయము; సేకరించము.';

  @override
  String get privacySection6Title => '6. పిల్లలు మరియు సున్నితమైన వినియోగదారులు';

  @override
  String get privacySection6Paragraphs => 'యాప్ వృద్ధులు మరియు ఇతర హాని వాటాదారులను మోసం నుండి రక్షించడానికి ఉద్దేశించబడింది. పేరెంటల్ సమ్మతి అవసరమైన రీతిలో పిల్లల నుండి డేటా సేకరించము; యాప్ డేటాను డివైస్ నుండి పంపదు.\n\nమరొకరికోసం (ఉదా వృద్ధ కుటుంబ సభ్యుడు) యాప్ సెటప్ చేసినప్పుడు అనుమతులు మరియు ఈ విధానాన్ని సాధారణ భాషలో వివరించడం సిఫార్సు.';

  @override
  String get privacySection7Title => '7. ఈ విధానంలో మార్పులు';

  @override
  String get privacySection7Paragraphs => 'ఈ విధానాన్ని మారుస్తే (ఉదా భవిష్యత్ వెర్షన్‌లో ఐచ్ఛిక క్లౌడ్ ఫీచర్‌లు), ఈ డాక్యుమెంట్‌ను నవీకరించి చట్టం/స్టోర్ విధానం ప్రకారం తెలియజేస్తాము లేదా సమ్మతి అడుగుతాము.';

  @override
  String get privacySection8Title => '8. సంప్రదించండి';

  @override
  String get privacySection8Body => 'ఎల్డర్ షీల్డ్ గురించి గోప్యతా ప్రశ్నలు/అభ్యర్థనలకు ఇక్కడ సంప్రదించండి: [మీ ఇమెయిల్ లేదా సపోర్ట్ URL ఇక్కడ జోడించండి].';

  @override
  String get privacyLastUpdatedNote => 'చివరి నవీకరణ: బ్లాక్ 10. రిలీజ్ కు ముందు ప్లేస్‌హోల్డర్‌లను వాస్తవ సమాచారంతో భర్తీ చేయండి.';

  @override
  String get aboutTagline => 'వృద్ధ వినియోగదారులకు డివైస్‌లోనే మోసం రక్షణ.';

  @override
  String get messagesAppBarTitle => 'సందేశాలు';

  @override
  String get messagesFilterAll => 'అన్నీ';

  @override
  String get messagesFilterHighRisk => 'అధిక ప్రమాదం';

  @override
  String get messagesFilterAllSemanticsLabel => 'అన్ని సందేశాలను చూపించండి';

  @override
  String get messagesFilterAllSemanticsHint => 'అన్ని విశ్లేషించిన సందేశాలను చూడడానికి డబుల్ టాప్ చేయండి.';

  @override
  String get messagesFilterHighRiskSemanticsLabel => 'అధిక ప్రమాద సందేశాలను మాత్రమే చూపించండి';

  @override
  String get messagesFilterHighRiskSemanticsHint => 'అత్యంత తీవ్రమైన హెచ్చరికలకు ఫిల్టర్ చేయడానికి డబుల్ టాప్ చేయండి.';

  @override
  String get messagesErrorTitle => 'సందేశాలు లోడ్ అవుతున్నప్పుడు ఏదో తప్పు జరిగింది.';

  @override
  String get messagesErrorSubtitle => 'మళ్లీ ప్రయత్నించడానికి కిందకి లాగండి.';

  @override
  String get messagesEmptyTitle => 'ఇంకా సందేశం విశ్లేషించబడలేదు. ఎల్డర్ షీల్డ్ కొత్త సందేశాలను స్వయంచాలకంగా తనిఖీ చేస్తుంది.';

  @override
  String get messagesEmptySubtitle => 'అనుమానాస్పదమైనది కనుగొన్నప్పుడు తెలియజేస్తాము; ఇక్కడ నుండి తెరవవచ్చు.';

  @override
  String get messagesRefreshSnackbar => 'జాబితా నవీకరించబడింది';

  @override
  String get messagesLoadingHeader => 'సందేశాలు లోడ్ అవుతున్నాయి…';

  @override
  String messagesDateToday(String time) {
    return 'ఈ రోజు, $time';
  }

  @override
  String messagesDateYesterday(String time) {
    return 'నిన్న, $time';
  }

  @override
  String messagesDateOther(String month, int day, String time) {
    return '$month $day, $time';
  }

  @override
  String onboardingStepOf(int step, int total) {
    return 'దశ $step / $total';
  }

  @override
  String get onboardingWelcomeBody1 => 'ఎల్డర్ షీల్డ్ మీ సందేశాలు మరియు కాల్‌లను చూస్తుంది; మోసం ఉంటే ముందుగా హెచ్చరిస్తుంది.';

  @override
  String get onboardingWelcomeBody2 => 'ఎప్పుడైనా ఖచ్చితంగా తెలియకపోతే ఒక టాప్‌తో విశ్వసించే వ్యక్తిని కాల్ చేయవచ్చు.';

  @override
  String get onboardingGetStarted => 'ప్రారంభించండి';

  @override
  String get onboardingPermissionsTitle => 'మాకు యాక్సెస్ ఎందుకు అవసరం';

  @override
  String get onboardingPermissionsBulletMessages => 'సందేశాలు: మీ టెక్స్ట్‌ను చదివి మోసంలా ఉంటే హెచ్చరించడానికి.';

  @override
  String get onboardingPermissionsBulletPhone => 'ఫోన్: మీరు కాల్‌లో ఉన్నప్పుడు తెలుసుకోవడానికి. మోసగాళ్లు కాల్‌లో ఉన్నప్పుడు OTP అడుగుతారు.';

  @override
  String get onboardingPermissionsBody1 => 'క్రింద \"అనుమతులను అనుమతించండి\" టాప్ చేస్తే మీ డివైస్ అడుగుతుంది: సందేశాలు, ఫోన్, నోటిఫికేషన్‌లు (యాప్ మూసిఉన్నప్పటికీ సాధ్యమైన మోసం హెచ్చరిక).';

  @override
  String get onboardingPermissionsBody2 => 'మోసం తనిఖీ కోసం మాత్రమే సందేశాలను చదివేది; మరేదికీ కాదు.';

  @override
  String get onboardingPermissionsRetryWarning => 'కొన్ని అనుమతులు నిరాకరించబడ్డాయి. అనుమతి ఇచ్చే వరకు రక్షణ పరిమితంగా ఉంటుంది.';

  @override
  String get onboardingPermissionsPrimaryAllow => 'అనుమతులను అనుమతించండి';

  @override
  String get onboardingPermissionsPrimaryRetry => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get onboardingSkipForNow => 'ఇప్పుడు దాటవేయండి';

  @override
  String get onboardingTrustedTitle => 'విశ్వసనీయ సంప్రదింపును జోడించండి';

  @override
  String get onboardingTrustedBody1 => 'భయపెట్టే సందేశం వస్తే కాల్ చేసే వ్యక్తిని ఎంచుకోండి — కుటుంబ సభ్యుడు లేదా దగ్గరి మిత్రుడు.';

  @override
  String get onboardingTrustedBody2 => 'జోడించిన తర్వాత హోమ్ స్క్రీన్ నుండి లేదా మోసం హెచ్చరిక చూపించినప్పుడు ఒక టాప్‌తో ఈ వ్యక్తిని కాల్ చేయవచ్చు.';

  @override
  String get onboardingTrustedAddFromContacts => 'సంప్రదింపుల నుండి జోడించండి';

  @override
  String get onboardingTrustedAddFromContactsUnavailable => 'ఈ ప్రివ్యూ బిల్డ్‌లో డివైస్ కాంటాక్ట్ పికర్ ఇంకా అందుబాటులో లేదు.';

  @override
  String get onboardingTrustedOrEnterManually => 'లేదా నంబర్ మాన్యువల్‌గా నమోదు చేయండి:';

  @override
  String get onboardingTrustedDone => 'పూర్తి';

  @override
  String get onboardingTrustedSeeWarningCta => 'హెచ్చరిక ఎలా ఉంటుంది చూడండి';

  @override
  String get onboardingTrustedMissingFields => 'పేరు మరియు నంబర్ రెండూ నమోదు చేయండి';

  @override
  String get launchGateChecking => 'తనిఖీ చేస్తోంది…';

  @override
  String get exampleWarningBanner => 'ఇది ఒక ఉదాహరణ మాత్రమే. నిజమైన సందేశం లేదా చర్య లేదు.';

  @override
  String get exampleWarningSnackbar => 'ఇది ఒక ఉదాహరణ. ఏ చర్యా తీసుకోలేదు.';

  @override
  String get exampleWarningButton => 'అర్థమైంది — ఇది ఒక ఉదాహరణ';

  @override
  String get exampleWarningSenderUnknown => 'తెలియదు';

  @override
  String get exampleWarningBody => 'మీ బ్యాంక్ ఖాతా 24 గంటలలో బ్లాక్ చేయబడుతుంది. ధృవీకరించడానికి ఇక్కడ క్లిక్ చేయండి: http://secure-bank-verify.com. ఎవరితోనూ షేర్ చేయవద్దు.';

  @override
  String get exampleWarningReasonSuspiciousLink => 'అనుమానాస్పద లింక్ ఉంది';

  @override
  String get exampleWarningReasonPretendBank => 'మీ బ్యాంక్‌లా నటిస్తుంది';

  @override
  String get exampleWarningReasonUrgentLanguage => 'అత్యవసర లేదా బెదిరించే భాష ఉపయోగిస్తుంది';

  @override
  String get reasonShortUrl => 'చిన్న లేదా అనుమానాస్పద లింక్ ఉంది';

  @override
  String get reasonOtpMention => 'ఒక-సారి కోడ్ (OTP) అడుగుతుంది లేదా ప్రస్తావిస్తుంది';

  @override
  String get reasonUrgentLanguage => 'అత్యవసర లేదా బెదిరించే భాష ఉపయోగిస్తుంది';

  @override
  String get reasonBankKyc => 'బ్యాంక్ ఖాతా, KYC లేదా చెల్లింపు వివరాలను ప్రస్తావిస్తుంది';

  @override
  String get reasonPaymentRequest => 'చెల్లింపు పంపడం లేదా అనుమోదించడం అడుగుతుంది';

  @override
  String get reasonPrizeLottery => 'బహుమతి లేదా లాటరీ రివార్డ్ మోసంలా ఉంది';

  @override
  String get reasonParcelDelivery => 'అనుమానాస్పద పార్సెల్ లేదా డెలివరీ సమస్యను ప్రస్తావిస్తుంది';

  @override
  String get reasonCryptoInvestment => 'ప్రమాదకర క్రిప్టో ఇన్వెస్ట్‌మెంట్ లేదా హామీ రిటర్న్‌లను ప్రస్తావిస్తుంది';

  @override
  String get reasonSenderSuspicious => 'పంపినవారి పేరు అసాధారణంగా లేదా అనుమానాస్పదంగా ఉంది';

  @override
  String get reasonInCallOtp => 'మీరు ఫోన్ కాల్‌లో ఉన్నప్పుడు OTP వచ్చింది — సాధారణ మోసం నమూనా';

  @override
  String messageFromLabel(String sender) {
    return 'పంపినవారు: $sender';
  }

  @override
  String get fullScreenWarningTitle => 'సాధ్యమైన మోసం';

  @override
  String get fullScreenWarningClosingNote => 'ఈ స్క్రీన్ మూసివేయడం మీ ఫోన్ నుండి సందేశాన్ని తొలగించదు.';

  @override
  String get fullScreenWarningDeleteAction => 'సందేశాన్ని తొలగించండి';

  @override
  String get fullScreenWarningDeleteSnackbar => 'ఎల్డర్ షీల్డ్ నుండి తొలగించబడింది. మీ మెసేజింగ్ యాప్‌ను తెరుస్తోంది; అక్కడ నుండి కూడా తొలగించవచ్చు.';

  @override
  String get fullScreenWarningBlockSender => 'ఈ పంపినవారిని బ్లాక్ చేయండి (మెసేజింగ్ యాప్ తెరుస్తుంది)';
}
