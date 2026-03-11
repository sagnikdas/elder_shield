// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'एल्डर शील्ड';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get homeAppBarTitle => 'एल्डर शील्ड';

  @override
  String get homePostOnboardingTitle => 'अब आप सुरक्षित हैं';

  @override
  String homePostOnboardingBody(String contactName) {
    return 'होम स्क्रीन से आप किसी भी समय $contactName को कॉल कर सकते हैं।';
  }

  @override
  String get commonGotIt => 'ठीक है';

  @override
  String get homeTrustedContactFallbackName => 'आपका भरोसेमंद संपर्क';

  @override
  String get permissionsDialogTitle => 'सेटिंग्स में सुरक्षा सक्षम करें';

  @override
  String get permissionsDialogBody => 'एल्डर शील्ड को आपके संदेशों में स्कैम जाँचने के लिए एसएमएस और फोन की अनुमति चाहिए।\n\nक्या आप ऐप सेटिंग्स खोलकर ये अनुमतियाँ चालू करना चाहेंगे?';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get permissionsDialogOpenSettings => 'सेटिंग्स खोलें';

  @override
  String get homeProtectionStatusLabel => 'सुरक्षा स्थिति';

  @override
  String get homeProtectionStatusProtected => 'सुरक्षित';

  @override
  String get homeProtectionStatusPermissionsNeeded => 'अनुमतियाँ चाहिए';

  @override
  String get homeEnableProtectionButton => 'सुरक्षा चालू करें';

  @override
  String homeTodayRiskSummaryWithCount(int count) {
    return 'आज $count संदिग्ध संदेश पाए गए।';
  }

  @override
  String get homeTodayRiskSummaryNoRisk => 'आज कोई संदिग्ध गतिविधि नहीं।';

  @override
  String get homeTodayRiskTapToSeeMessages => 'संदेश देखने के लिए टैप करें';

  @override
  String get commonView => 'देखें';

  @override
  String get homeAutoCheckInfo => 'एल्डर शील्ड आपके नए संदेशों की ऑटोमैटिक जाँच करता है।';

  @override
  String homeCallTrustedButtonLabel(String name) {
    return '$name को कॉल करें';
  }

  @override
  String get homeCallTooltipText => 'जब भी कोई परेशान करने वाला संदेश आए, यहाँ टैप करें।';

  @override
  String get homeAddTrustedIntro => 'ऐसा भरोसेमंद संपर्क जोड़ें जिसे डरावना संदेश आने पर आप तुरंत कॉल कर सकें।';

  @override
  String get homeAddTrustedButton => 'भरोसेमंद संपर्क जोड़ें';

  @override
  String get homeWhyAddTrustedShow => 'भरोसेमंद संपर्क क्यों जोड़ें?';

  @override
  String get homeWhyAddTrustedHide => 'कारण छुपाएँ';

  @override
  String get homeWhyAddTrustedExplanation => 'अगर कभी कोई चिंता बढ़ाने वाला संदेश आए, तो आप अकेले अंदाज़ा लगाने की बजाय एक बड़े बटन पर टैप करके किसी भरोसेमंद व्यक्ति को कॉल कर सकें, इसके लिए।';

  @override
  String get homeTrustedContactsHeader => 'आपके भरोसेमंद संपर्क';

  @override
  String get highRiskHeaderTitle => 'सावधान: यह स्कैम संदेश हो सकता है';

  @override
  String get highRiskHeaderBody => 'इस संदेश के किसी भी लिंक पर टैप न करें और कोई भी कोड साझा न करें।';

  @override
  String get highRiskWhyFlaggedTitle => 'यह क्यों चिन्हित किया गया:';

  @override
  String get actionScam => 'यह स्कैम है';

  @override
  String get actionSafe => 'यह सुरक्षित है';

  @override
  String get snackbarGenericError => 'कुछ गलत हो गया। दोबारा कोशिश करें।';

  @override
  String get snackbarMarkedScam => 'स्कैम के रूप में चिन्हित किया गया। धन्यवाद।';

  @override
  String get highRiskSwipeUpForDetails => 'अधिक विवरण देखने के लिए ऊपर की ओर स्वाइप करें';

  @override
  String get riskLowLabel => 'कम जोखिम';

  @override
  String get riskMediumLabel => 'मध्यम जोखिम — जाँचें';

  @override
  String get riskHighLabel => 'उच्च जोखिम — संभव स्कैम';

  @override
  String get deleteMessageTitle => 'संदेश मिटाएँ?';

  @override
  String get deleteMessageBody => 'क्या आप निश्चित हैं? इससे यह संदेश केवल एल्डर शील्ड से हटेगा।';

  @override
  String get deleteMessageConfirm => 'मिटाएँ';

  @override
  String get deleteMessageDeletedSnackbar => 'एल्डर शील्ड से हटाया गया।';

  @override
  String get languageSectionTitle => 'भाषा';

  @override
  String get languageEnglishName => 'अंग्रेजी';

  @override
  String get languageBengaliName => 'बांग्ला';

  @override
  String get languageKannadaName => 'कन्नड़';

  @override
  String get languageHindiName => 'हिन्दी';

  @override
  String get languageUrduName => 'उर्दू';

  @override
  String languageSectionSubtitle(String languageName) {
    return 'वर्तमान: $languageName';
  }

  @override
  String get snackbarUpdated => 'अपडेट हो गया';

  @override
  String get settingsAppearanceTitle => 'रूप-रंग';

  @override
  String get settingsThemeSystem => 'सिस्टम';

  @override
  String get settingsThemeLight => 'लाइट';

  @override
  String get settingsThemeDark => 'डार्क';

  @override
  String get settingsTextSizeTitle => 'टेक्स्ट का आकार';

  @override
  String get settingsTextSizeDescription => 'टेक्स्ट को बड़ा या छोटा देखने के लिए समायोजित करें। बदलाव तुरंत लागू होंगे।';

  @override
  String get settingsTextSizeSample => 'एल्डर शील्ड आपको स्कैम संदेशों से सुरक्षित रखता है।';

  @override
  String get settingsLegalTitle => 'कानूनी व जानकारी';

  @override
  String get settingsPrivacyPolicyTitle => 'गोपनीयता नीति';

  @override
  String get settingsPrivacyPolicySubtitle => 'हम आपका डेटा कैसे उपयोग करते हैं';

  @override
  String get settingsPermissionsExplainedTitle => 'अनुमतियों का विवरण';

  @override
  String get settingsPermissionsExplainedSubtitle => 'हमें हर अनुमति क्यों चाहिए';

  @override
  String get settingsSensitivityTitle => 'संवेदनशीलता';

  @override
  String get settingsSensitivityLabelConservative => 'कम अलर्ट';

  @override
  String get settingsSensitivityLabelBalanced => 'संतुलित';

  @override
  String get settingsSensitivityLabelSensitive => 'ज़्यादा अलर्ट';

  @override
  String get settingsSensitivityDescConservative => 'केवल बहुत साफ़-साफ़ दिखने वाले स्कैम। यदि आप कम अलर्ट पसंद करते हैं तो यह अच्छा है।';

  @override
  String get settingsSensitivityDescBalanced => 'अधिकतर लोगों के लिए अच्छा विकल्प। पकड़े गए स्कैम और शोर के बीच संतुलन।';

  @override
  String get settingsSensitivityDescSensitive => 'और अधिक स्कैम पकड़ता है लेकिन कभी-कभी सुरक्षित संदेशों को भी फ़्लैग कर सकता है।';

  @override
  String get settingsTrustedContactsTitle => 'भरोसेमंद संपर्क';

  @override
  String get settingsTrustedContactsNone => 'कोई नहीं';

  @override
  String settingsTrustedContactsCount(int count) {
    return '$count संपर्क';
  }

  @override
  String get settingsTrustedContactsExplanation => 'आप होम स्क्रीन या स्कैम चेतावनी दिखने पर एक टैप से इन्हें कॉल कर सकते हैं। सूची में सबसे पहला संपर्क मुख्य \"कॉल\" बटन में उपयोग होता है।';

  @override
  String get settingsTrustedContactsAddContactTitle => 'संपर्क जोड़ें';

  @override
  String get settingsTrustedContactsAddContactSubtitle => 'नाम और फोन नंबर टाइप करें';

  @override
  String get settingsTrustedContactsChooseFromContactsTitle => 'संपर्कों से चुनें';

  @override
  String get settingsTrustedContactsChooseFromContactsSubtitle => 'अपने फोन से कोई नंबर चुनें';

  @override
  String get settingsTrustedContactsPickerUnavailable => 'इस प्रीव्यू बिल्ड में डिवाइस कॉन्टैक्ट पिकर अभी उपलब्ध नहीं है।';

  @override
  String get settingsTrustedContactsRemoveDialogTitle => 'भरोसेमंद संपर्क हटाएँ?';

  @override
  String get settingsTrustedContactsRemoveDialogBody => 'यह व्यक्ति अब भरोसेमंद संपर्कों की सूची या होम स्क्रीन पर नहीं दिखेगा।';

  @override
  String get settingsTrustedContactsRemoveDialogRemove => 'हटाएँ';

  @override
  String get settingsAdvancedSectionTitle => 'एडवांस्ड';

  @override
  String get settingsDeleteAllHistoryButton => 'सभी हिस्ट्री मिटाएँ';

  @override
  String get settingsRerunPermissionsButton => 'अनुमतियों की फिर से जाँच करें';

  @override
  String get settingsDeleteAllHistoryDialogTitle => 'सभी हिस्ट्री मिटाएँ?';

  @override
  String get settingsDeleteAllHistoryDialogBody => 'इस डिवाइस से सभी विश्लेषित संदेश और कारण स्थायी रूप से मिट जाएँगे। इसे वापस नहीं लाया जा सकता।';

  @override
  String get settingsDeleteAllHistoryDialogConfirm => 'सब मिटाएँ';

  @override
  String get settingsHistoryDeletedSnackbar => 'हिस्ट्री मिटा दी गई';

  @override
  String get settingsRerunPermissionsSnackbar => 'अनुमतियों की जाँच पूरी हुई। यदि आपने अभी-अभी अनुमति दी है तो ऐप को रीस्टार्ट करें।';

  @override
  String get settingsOverlayTitle => 'अन्य ऐप्स के ऊपर आपात चेतावनी';

  @override
  String get settingsOverlaySubtitleEnabled => 'चालू: उच्च जोखिम वाली चेतावनियाँ अन्य ऐप्स के ऊपर दिख सकती हैं। यह इसीलिए अनुशंसित है ताकि हम आपको तब भी सचेत कर सकें जब आप किसी और ऐप में हों।';

  @override
  String get settingsOverlaySubtitleDisabled => 'बंद: एंड्रॉयड ओवरले अनुमति चालू करने के लिए यहाँ टैप करें। हम आपको अन्य ऐप में रहने पर भी चेतावनी दे सकें, इसके लिए इसे चालू रखना अच्छा है।';

  @override
  String get settingsHowItWorksTitle => 'एल्डर शील्ड कैसे काम करता है';

  @override
  String get settingsHowItWorksSubtitle => 'हम क्या जाँचते हैं, कब चेतावनी देते हैं, और आपको क्या करना है';

  @override
  String get settingsAboutTitle => 'एल्डर शील्ड के बारे में';

  @override
  String get settingsAddTrustedDialogTitle => 'भरोसेमंद संपर्क जोड़ें';

  @override
  String get settingsAddTrustedDialogConsent => 'उन्हें होम स्क्रीन या स्कैम चेतावनी स्क्रीन से एक टैप में कॉल किया जा सकता है।';

  @override
  String get settingsAddTrustedDialogConfirm => 'जोड़ें';

  @override
  String get settingsEditTrustedDialogTitle => 'भरोसेमंद संपर्क संपादित करें';

  @override
  String get settingsEditTrustedDialogConfirm => 'सहेजें';

  @override
  String get settingsContactNameLabel => 'नाम';

  @override
  String get settingsContactNameHint => 'जैसे: मेरा बेटा';

  @override
  String get settingsContactNumberLabel => 'फोन नंबर';

  @override
  String get settingsContactNumberHint => 'जैसे: +91 98765 43210';

  @override
  String get settingsContactDialogCancel => 'रद्द करें';

  @override
  String get settingsContactInvalidNumber => 'कृपया एक मान्य फोन नंबर दर्ज करें';

  @override
  String get howItWorksBulletWhatWeCheck => 'हम क्या जाँचते हैं: हम आपके एसएमएस पढ़ते हैं और स्कैम के संकेत ढूँढते हैं — संदिग्ध लिंक, बहुत तात्कालिक / धमकी भरी भाषा, ओटीपी या बैंक विवरण माँगने वाले संदेश, और ऐसे संदेश जो आपके बैंक या किसी जानी-पहचानी सेवा की नकल करते हैं।';

  @override
  String get howItWorksBulletWhenWeAlert => 'हम कब चेतावनी देते हैं: यदि कोई संदेश जोखिम भरा लगे तो हम आपको सूचित करते हैं। बहुत अधिक जोखिम वाले संदेशों के लिए हम ऐप बैकग्राउंड में होने पर भी पॉप-अप दिखा सकते हैं और संदेशों की सूची में उसे हाईलाइट कर सकते हैं।';

  @override
  String get howItWorksBulletWhatToDo => 'चेतावनी दिखने पर क्या करें: संदेश में किसी भी लिंक पर टैप न करें। आप \"यह स्कैम है\" या \"यह सुरक्षित है\" चुनकर हमें सीखने में मदद कर सकते हैं। सबसे अच्छा कदम: चेतावनी स्क्रीन या होम से अपने भरोसेमंद संपर्क को कॉल करें।';

  @override
  String get howItWorksBulletCallTrusted => 'भरोसेमंद संपर्क को कैसे कॉल करें: होम स्क्रीन पर बड़े \"कॉल [नाम]\" बटन पर कभी भी टैप करें — खासकर जब कोई चिंताजनक संदेश आए। जब हम संभव स्कैम दिखाएँ, तब भी आप चेतावनी स्क्रीन से कॉल कर सकते हैं।';

  @override
  String get howItWorksSeeWarningCta => 'देखें चेतावनी कैसी दिखती है';

  @override
  String get permissionsIntro => 'एल्डर शील्ड अनुमतियों का उपयोग केवल स्कैम से सुरक्षा के लिए करता है। आप कोई भी अनुमति न देने का विकल्प चुन सकते हैं; सुरक्षा कुछ कम हो जाएगी, लेकिन ऐप फिर भी काम करेगा।';

  @override
  String get permissionsSmsTitle => 'संदेश (एसएमएस)';

  @override
  String get permissionsSmsBody => 'हम इनकमिंग एसएमएस प्राप्त कर उन्हें स्कैम के संकेतों (जैसे संदिग्ध लिंक, ओटीपी फ़िशिंग, बैंक-संबंधी शब्द) के लिए विश्लेषित करते हैं और ज़रूरत पड़ने पर आपको चेतावनी दिखाते हैं। कोई भी संदेश सामग्री आपके डिवाइस के बाहर नहीं भेजी जाती। आप सेटिंग्स से सभी विश्लेषित हिस्ट्री मिटा सकते हैं।';

  @override
  String get permissionsPhoneStateTitle => 'फोन (स्थिति पढ़ना)';

  @override
  String get permissionsPhoneStateBody => 'हमें यह जानना होता है कि आप कब कॉल पर हैं, ताकि कॉल के दौरान ओटीपी आने पर हम जोखिम स्तर बढ़ा सकें (यह एक सामान्य स्कैम पैटर्न है)। हम कॉल रिकॉर्ड नहीं करते, ऑडियो नहीं सुनते और न ही आपका कॉल लॉग पढ़ते हैं।';

  @override
  String get permissionsPhoneCallTitle => 'फोन (कॉल करना)';

  @override
  String get permissionsPhoneCallBody => 'ताकि आप होम या चेतावनी स्क्रीन से \"भरोसेमंद संपर्क को कॉल करें\" बटन पर टैप कर सकें। ऐप केवल तब ही कॉल शुरू करता है जब आप बटन दबाते हैं, और केवल उन्हीं नंबरों पर जिन्हें आपने भरोसेमंद संपर्क के रूप में जोड़ा है।';

  @override
  String get permissionsNotificationsTitle => 'नोटिफिकेशन';

  @override
  String get permissionsNotificationsBody => 'जब हम कोई संदिग्ध या उच्च जोखिम वाला संदेश पाते हैं, तो आपको तुरंत सूचित करने के लिए। आप सिस्टम सेटिंग्स में नोटिफिकेशन बंद कर सकते हैं; फिर भी आप ऐप का उपयोग कर सकेंगे।';

  @override
  String get permissionsOverlayTitle => 'अन्य ऐप्स के ऊपर दिखाना (वैकल्पिक)';

  @override
  String get permissionsOverlayBody => 'यदि आप सेटिंग्स में एंड्रॉयड ओवरले अनुमति सक्षम करते हैं, तो उच्च जोखिम वाला संदेश आने पर एल्डर शील्ड अन्य ऐप्स के ऊपर भी आपात चेतावनी दिखा सकता है। यह पूरी तरह वैकल्पिक है और व्यक्तिगत सुरक्षा के लिए है।';

  @override
  String get privacyTitle => 'गोपनीयता नीति';

  @override
  String get privacySection1Title => '1. हम कौन हैं';

  @override
  String get privacySection1Body => 'एल्डर शील्ड एक एंड्रॉयड ऐप है जो डिवाइस पर ही संदेशों का विश्लेषण करके और संदिग्ध लगने पर चेतावनी देकर, वरिष्ठ नागरिकों को एसएमएस और कॉल से जुड़े स्कैम से बचाने में मदद करता है।';

  @override
  String get privacySection2Title => '2. हम कौन-सा डेटा संसाधित करते हैं';

  @override
  String get privacySection2Paragraphs => 'सारा संसाधन आपके डिवाइस पर ही होता है। हम आपके संदेश, कॉल की स्थिति या किसी भी व्यक्तिगत डेटा को अपने सर्वर या किसी तीसरे पक्ष को नहीं भेजते।\n\nसंदेश डेटा: जब आपको एसएमएस मिलता है, तो ऐप प्रेषक, संदेश का मुख्यपाठ और समय पढ़ता है। यह डेटा केवल हमारे ऑन-डिवाइस स्कैम डिटेक्शन के लिए उपयोग होता है। नतीजे केवल आपके डिवाइस पर ही संग्रहीत रहते हैं। आप कभी भी सेटिंग्स → सभी हिस्ट्री मिटाएँ से इन्हें हटा सकते हैं।\n\nकॉल स्थिति: ऐप जाँचता है कि आप कॉल पर हैं या नहीं। हम कॉल रिकॉर्ड नहीं करते, ऑडियो नहीं सुनते और न ही कॉल लॉग तक पहुँचते हैं। कॉल की स्थिति केवल डिटेक्शन सुधारने (जैसे कॉल के दौरान ओटीपी आने पर चेतावनी देने) के लिए उपयोग होती है।\n\nसेटिंग्स और भरोसेमंद संपर्क: इन्हें केवल आपके डिवाइस के सुरक्षित संग्रहण में रखा जाता है। भरोसेमंद संपर्क केवल इसलिए उपयोग होते हैं कि आप \"भरोसेमंद संपर्क को कॉल करें\" बटन पर टैप कर सकें। हम उन्हें स्वतः कॉल या संदेश नहीं भेजते।';

  @override
  String get privacySection3Title => '3. हम क्या नहीं करते';

  @override
  String get privacySection3Paragraphs => 'हम आपके एसएमएस की सामग्री, कॉल की स्थिति या संपर्क सूची को इंटरनेट पर नहीं भेजते।\n\nहम आपका डेटा विज्ञापनदाताओं या डेटा ब्रोकरों को नहीं बेचते, किराए पर नहीं देते और साझा नहीं करते।\n\nहम आपको खाता बनाने या साइन-इन करने के लिए बाध्य नहीं करते। आवश्यक अनुमतियाँ मिलने के बाद ऐप पूर्णतः ऑफ़लाइन काम कर सकता है।\n\nहम RCS/चैट संदेश नहीं पढ़ते या विश्लेषित करते; केवल सामान्य एसएमएस समर्थित है।';

  @override
  String get privacySection4Title => '4. अनुमतियाँ और वे क्यों ज़रूरी हैं';

  @override
  String get privacySection4Paragraphs => 'एसएमएस (रिसीव/रीड): इनकमिंग एसएमएस पढ़ने के लिए ताकि हम स्कैम पैटर्न पहचान सकें और आपको चेतावनी दिखा सकें।\n\nफोन (कॉल की स्थिति पढ़ना): यह जानने के लिए कि आप कब कॉल पर हैं, ताकि कॉल के दौरान ओटीपी आने पर हम उच्च जोखिम दिखा सकें। हम कॉल रिकॉर्ड या सुनते नहीं हैं।\n\nफोन (कॉल करना): ताकि आप \"भरोसेमंद संपर्क को कॉल करें\" बटन पर टैप कर सकें। हम केवल उन्हीं नंबरों पर कॉल करते हैं जिन्हें आपने भरोसेमंद संपर्क के रूप में जोड़ा है और केवल तब जब आप बटन दबाते हैं।\n\nनोटिफिकेशन: जब हम कोई संदिग्ध या उच्च जोखिम वाला संदेश पाते हैं तो आपको सूचित करने के लिए।\n\nजब आप \"इस प्रेषक को ब्लॉक करें\" चुनते हैं, तो ऐप आपके डिवाइस का मैसेजिंग ऐप खोल सकता है; ऐप स्वयं एसएमएस नहीं भेजता।';

  @override
  String get privacySection5Title => '5. डेटा कितने समय तक रखा जाता है और आपके विकल्प';

  @override
  String get privacySection5Paragraphs => 'विश्लेषित संदेश और कारण: ये केवल आपके डिवाइस पर तब तक रहते हैं जब तक आप सेटिंग्स → सभी हिस्ट्री मिटाएँ नहीं चुनते।\n\nसेटिंग्स और भरोसेमंद संपर्क: जब तक आप उन्हें बदलते या हटाते नहीं, या ऐप अनइंस्टॉल नहीं करते, तब तक आपके डिवाइस पर रहते हैं।\n\nहम आपके किसी भी डेटा की प्रति अपने सर्वर पर नहीं रखते, क्योंकि हम इसे एकत्र ही नहीं करते।';

  @override
  String get privacySection6Title => '6. बच्चे और संवेदनशील उपयोगकर्ता';

  @override
  String get privacySection6Paragraphs => 'यह ऐप मुख्य रूप से वरिष्ठ नागरिकों और अन्य संवेदनशील उपयोगकर्ताओं को स्कैम से बचाने में सहायता के लिए बनाया गया है। हम बच्चों का डेटा इस तरह से एकत्र नहीं करते कि जिसके लिए माता-पिता की अनुमति की कानूनी आवश्यकता हो; ऐप कोई भी डेटा डिवाइस के बाहर नहीं भेजता।\n\nयदि आप किसी और (जैसे किसी बुज़ुर्ग परिवार सदस्य) के लिए यह ऐप सेट कर रहे हैं, तो हम सुझाव देते हैं कि आप उन्हें सरल भाषा में अनुमतियों और इस नीति के बारे में बताएँ।';

  @override
  String get privacySection7Title => '7. इस नीति में बदलाव';

  @override
  String get privacySection7Paragraphs => 'यदि हम इस नीति में बदलाव करते हैं (उदाहरण के लिए, भविष्य के संस्करण में वैकल्पिक क्लाउड फ़ीचर जोड़ें), तो हम इस दस्तावेज़ को अपडेट करेंगे और ज़रूरत पड़ने पर क़ानून या स्टोर नीति के अनुसार आपको सूचित करेंगे या आपकी सहमति माँगेंगे।';

  @override
  String get privacySection8Title => '8. संपर्क';

  @override
  String get privacySection8Body => 'एल्डर शील्ड से संबंधित गोपनीयता के प्रश्नों या अनुरोधों के लिए कृपया यहाँ संपर्क करें: [यहाँ अपना संपर्क ईमेल या सपोर्ट URL डालें]।';

  @override
  String get privacyLastUpdatedNote => 'अंतिम अपडेट: ब्लॉक 10। रिलीज़ से पहले इन प्लेसहोल्डर को वास्तविक जानकारी से बदलें।';

  @override
  String get aboutTagline => 'वरिष्ठ उपयोगकर्ताओं के लिए डिवाइस पर ही स्कैम सुरक्षा।';

  @override
  String get messagesAppBarTitle => 'संदेश';

  @override
  String get messagesFilterAll => 'सभी';

  @override
  String get messagesFilterHighRisk => 'उच्च जोखिम';

  @override
  String get messagesFilterAllSemanticsLabel => 'सभी संदेश दिखाएँ';

  @override
  String get messagesFilterAllSemanticsHint => 'सभी विश्लेषित संदेश देखने के लिए डबल टैप करें।';

  @override
  String get messagesFilterHighRiskSemanticsLabel => 'केवल उच्च जोखिम वाले संदेश दिखाएँ';

  @override
  String get messagesFilterHighRiskSemanticsHint => 'सबसे गंभीर चेतावनियाँ देखने के लिए डबल टैप करें।';

  @override
  String get messagesErrorTitle => 'संदेश लोड करते समय कुछ ग़लत हो गया।';

  @override
  String get messagesErrorSubtitle => 'दोबारा प्रयास करने के लिए नीचे खींचें।';

  @override
  String get messagesEmptyTitle => 'अभी तक कोई संदेश विश्लेषित नहीं हुआ। एल्डर शील्ड नए संदेशों की अपने आप जाँच करेगा।';

  @override
  String get messagesEmptySubtitle => 'जब हमें कुछ संदिग्ध मिलेगा, हम आपको सूचित करेंगे और आप उसे यहाँ खोलकर देख सकेंगे।';

  @override
  String get messagesRefreshSnackbar => 'सूची अपडेट हो गई';

  @override
  String get messagesLoadingHeader => 'संदेश लोड हो रहे हैं…';

  @override
  String messagesDateToday(String time) {
    return 'आज, $time';
  }

  @override
  String messagesDateYesterday(String time) {
    return 'कल, $time';
  }

  @override
  String messagesDateOther(String month, int day, String time) {
    return '$month $day, $time';
  }

  @override
  String onboardingStepOf(int step, int total) {
    return 'स्टेप $step / $total';
  }

  @override
  String get onboardingWelcomeBody1 => 'एल्डर शील्ड आपके संदेशों और कॉल पर नज़र रखता है ताकि स्कैम होने पर आपको पहले से चेतावनी दी जा सके।';

  @override
  String get onboardingWelcomeBody2 => 'यदि आप कभी असमंजस में हों, तो एक टैप से किसी भरोसेमंद व्यक्ति को कॉल कर सकते हैं।';

  @override
  String get onboardingGetStarted => 'शुरू करें';

  @override
  String get onboardingPermissionsTitle => 'हमें एक्सेस क्यों चाहिए';

  @override
  String get onboardingPermissionsBulletMessages => 'संदेश: ताकि हम आपके टेक्स्ट पढ़ सकें और कोई स्कैम जैसा लगे तो आपको चेतावनी दे सकें।';

  @override
  String get onboardingPermissionsBulletPhone => 'फोन: ताकि हमें पता रहे कि आप कब कॉल पर हैं। स्कैमर अक्सर कॉल के दौरान ओटीपी माँगते हैं।';

  @override
  String get onboardingPermissionsBody1 => 'नीचे \"अनुमतियाँ दें\" पर टैप करने पर आपका डिवाइस इन अनुमतियों के लिए पूछेगा: संदेश, फोन और नोटिफिकेशन (ताकि ऐप बंद होने पर भी संभावित स्कैम के बारे में आपको चेतावनी दे सकें)।';

  @override
  String get onboardingPermissionsBody2 => 'हम आपके संदेशों को केवल स्कैम जाँचने के लिए पढ़ते हैं, किसी और काम के लिए नहीं।';

  @override
  String get onboardingPermissionsRetryWarning => 'कुछ अनुमतियाँ अस्वीकार कर दी गईं। जब तक आप उन्हें अनुमति नहीं देते, सुरक्षा सीमित रहेगी।';

  @override
  String get onboardingPermissionsPrimaryAllow => 'अनुमतियाँ दें';

  @override
  String get onboardingPermissionsPrimaryRetry => 'फिर से प्रयास करें';

  @override
  String get onboardingSkipForNow => 'अभी के लिए छोड़ें';

  @override
  String get onboardingTrustedTitle => 'एक भरोसेमंद संपर्क जोड़ें';

  @override
  String get onboardingTrustedBody1 => 'ऐसे व्यक्ति को चुनें जिसे आप कोई चिंताजनक संदेश मिलने पर कॉल करना चाहेंगे — जैसे कोई परिवार का सदस्य या करीबी दोस्त।';

  @override
  String get onboardingTrustedBody2 => 'उन्हें जोड़ने के बाद, आप होम स्क्रीन या जब हम स्कैम चेतावनी दिखाएँ, तब एक टैप से इस व्यक्ति को कॉल कर सकते हैं।';

  @override
  String get onboardingTrustedAddFromContacts => 'संपर्कों से जोड़ें';

  @override
  String get onboardingTrustedAddFromContactsUnavailable => 'इस प्रीव्यू संस्करण में अभी डिवाइस का कॉन्टैक्ट पिकर उपलब्ध नहीं है।';

  @override
  String get onboardingTrustedOrEnterManually => 'या नंबर मैन्युअली दर्ज करें:';

  @override
  String get onboardingTrustedDone => 'हो गया';

  @override
  String get onboardingTrustedSeeWarningCta => 'देखें चेतावनी कैसी दिखती है';

  @override
  String get onboardingTrustedMissingFields => 'कृपया नाम और नंबर दोनों दर्ज करें';

  @override
  String get launchGateChecking => 'जाँच हो रही है…';

  @override
  String get exampleWarningBanner => 'यह केवल एक उदाहरण है। कोई असली संदेश या कार्रवाई नहीं हो रही।';

  @override
  String get exampleWarningSnackbar => 'यह सिर्फ उदाहरण था। कोई कार्रवाई नहीं की गई।';

  @override
  String get exampleWarningButton => 'समझ गया — यह सिर्फ उदाहरण था';

  @override
  String get exampleWarningSenderUnknown => 'अज्ञात';

  @override
  String get exampleWarningBody => 'आपका बैंक खाता 24 घंटों के भीतर ब्लॉक कर दिया जाएगा। सत्यापित करने के लिए यहाँ क्लिक करें: http://secure-bank-verify.com. इसे किसी के साथ साझा न करें।';

  @override
  String get exampleWarningReasonSuspiciousLink => 'संदिग्ध लिंक मौजूद है';

  @override
  String get exampleWarningReasonPretendBank => 'आपके बैंक का दिखावा कर रहा है';

  @override
  String get exampleWarningReasonUrgentLanguage => 'बहुत तात्कालिक या धमकी भरी भाषा का उपयोग किया है';

  @override
  String get reasonShortUrl => 'किसी छोटे या संदिग्ध लिंक को शामिल करता है';

  @override
  String get reasonOtpMention => 'ओटीपी या एक बार उपयोग होने वाला कोड माँगता है या उसका उल्लेख करता है';

  @override
  String get reasonUrgentLanguage => 'तात्कालिक या धमकी भरी भाषा का उपयोग करता है';

  @override
  String get reasonBankKyc => 'बैंक खाता, केवाईसी या भुगतान विवरण का उल्लेख करता है';

  @override
  String get reasonPaymentRequest => 'आपसे पैसा भेजने या भुगतान की स्वीकृति देने को कहता है';

  @override
  String get reasonPrizeLottery => 'इनाम या लॉटरी स्कैम जैसा दिखता है';

  @override
  String get reasonParcelDelivery => 'संदिग्ध पार्सल या डिलिवरी समस्या का ज़िक्र करता है';

  @override
  String get reasonCryptoInvestment => 'जोखिम भरे क्रिप्टो निवेश या पक्के रिटर्न का वादा करता है';

  @override
  String get reasonSenderSuspicious => 'प्रेषक का नाम असामान्य या संदिग्ध दिखता है';

  @override
  String get reasonInCallOtp => 'जब आप फ़ोन कॉल पर थे तभी एक ओटीपी आया — यह आम स्कैम पैटर्न है';

  @override
  String messageFromLabel(String sender) {
    return 'प्रेषक: $sender';
  }

  @override
  String get fullScreenWarningTitle => 'संभावित स्कैम';

  @override
  String get fullScreenWarningClosingNote => 'इस स्क्रीन को बंद करने से आपके फोन से संदेश नहीं मिटेगा।';

  @override
  String get fullScreenWarningDeleteAction => 'संदेश मिटाएँ';

  @override
  String get fullScreenWarningDeleteSnackbar => 'एल्डर शील्ड से हटाया गया। अब आपके फोन के मैसेजिंग ऐप को खोल रहे हैं ताकि आप वहाँ से भी इसे मिटा सकें।';

  @override
  String get fullScreenWarningBlockSender => 'इस प्रेषक को ब्लॉक करें (मैसेजिंग ऐप खुलेगा)';
}
