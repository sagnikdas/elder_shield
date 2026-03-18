// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'എൽഡർ ഷീൽഡ്';

  @override
  String get settingsTitle => 'ക്രമീകരണങ്ങൾ';

  @override
  String get homeAppBarTitle => 'എൽഡർ ഷീൽഡ്';

  @override
  String get homePostOnboardingTitle => 'നിങ്ങൾ സംരക്ഷിതരാണ്';

  @override
  String homePostOnboardingBody(String contactName) {
    return 'ഹോമിൽ നിന്ന് എപ്പോൾ വേണമെങ്കിലും $contactName വിളിക്കാം.';
  }

  @override
  String get commonGotIt => 'മനസ്സിലായി';

  @override
  String get homeTrustedContactFallbackName => 'നിങ്ങളുടെ വിശ്വസനീയ ബന്ധു';

  @override
  String get permissionsDialogTitle => 'ക്രമീകരണങ്ങളിൽ സംരക്ഷണം പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get permissionsDialogBody => 'മോശമായ സന്ദേശങ്ങൾ പരിശോധിക്കാൻ എൽഡർ ഷീൽഡിന് SMS, ഫോൺ ആക്സസ് ആവശ്യമാണ്.\n\nഈ അനുമതികൾ ഓണാക്കാൻ ആപ്പ് ക്രമീകരണങ്ങൾ തുറക്കണോ?';

  @override
  String get commonCancel => 'റദ്ദാക്കുക';

  @override
  String get permissionsDialogOpenSettings => 'ക്രമീകരണങ്ങൾ തുറക്കുക';

  @override
  String get homeProtectionStatusLabel => 'സംരക്ഷണ നില';

  @override
  String get homeProtectionStatusProtected => 'സംരക്ഷിതം';

  @override
  String get homeProtectionStatusPermissionsNeeded => 'അനുമതികൾ ആവശ്യം';

  @override
  String get homeEnableProtectionButton => 'സംരക്ഷണം പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String homeTodayRiskSummaryWithCount(int count) {
    return 'ഇന്ന് $count സംശയാസ്പദ സന്ദേശ(ങ്ങൾ) കണ്ടെത്തി.';
  }

  @override
  String get homeTodayRiskSummaryNoRisk => 'ഇന്ന് സംശയാസ്പദ പ്രവർത്തനമില്ല.';

  @override
  String get homeTodayRiskTapToSeeMessages => 'സന്ദേശങ്ങൾ കാണാൻ ടാപ്പ് ചെയ്യുക';

  @override
  String get commonView => 'കാണുക';

  @override
  String get homeAutoCheckInfo => 'എൽഡർ ഷീൽഡ് പുതിയ സന്ദേശങ്ങൾ സ്വയം പരിശോധിക്കും.';

  @override
  String homeCallTrustedButtonLabel(String name) {
    return '$name വിളിക്കുക';
  }

  @override
  String get homeCallTooltipText => 'ഭയപ്പെടുത്തുന്ന സന്ദേശം വരുമ്പോഴെല്ലാം ഇവിടെ ടാപ്പ് ചെയ്യുക.';

  @override
  String get homeAddTrustedIntro => 'ഭയപ്പെടുത്തുന്ന സന്ദേശം വന്നാൽ വേഗത്തിൽ വിളിക്കാൻ കഴിയുന്ന വിശ്വസനീയ ബന്ധുവെ ചേർക്കുക.';

  @override
  String get homeAddTrustedButton => 'വിശ്വസനീയ ബന്ധു ചേർക്കുക';

  @override
  String get homeWhyAddTrustedShow => 'വിശ്വസനീയ ബന്ധു എന്തിന് ചേർക്കും?';

  @override
  String get homeWhyAddTrustedHide => 'കാരണം മറയ്ക്കുക';

  @override
  String get homeWhyAddTrustedExplanation => 'ഭയപ്പെടുത്തുന്ന സന്ദേശം വന്നാൽ, ഒറ്റയ്ക്ക് ഊഹിക്കാതെ ഒരു വലിയ ബട്ടൺ ടാപ്പ് ചെയ്ത് വിശ്വസിക്കുന്ന ആളെ വിളിക്കാം.';

  @override
  String get homeTrustedContactsHeader => 'നിങ്ങളുടെ വിശ്വസനീയ ബന്ധുക്കൾ';

  @override
  String get highRiskHeaderTitle => 'എച്ചർച്ച: ഇത് മോശമായ സന്ദേശമായിരിക്കാം';

  @override
  String get highRiskHeaderBody => 'ഈ സന്ദേശത്തിലെ ലിങ്കുകളിൽ ടാപ്പ് ചെയ്യരുത്, കോഡുകൾ പങ്കിടരുത്.';

  @override
  String get highRiskWhyFlaggedTitle => 'എന്തുകൊണ്ട് ഫ്ലാഗ് ചെയ്തു:';

  @override
  String get actionScam => 'ഇത് മോശമാണ്';

  @override
  String get actionSafe => 'ഇത് സുരക്ഷിതമാണ്';

  @override
  String get actionTrustSender => 'Trust this sender';

  @override
  String get snackbarGenericError => 'എന്തോ തെറ്റുപറ്റി. വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get snackbarMarkedScam => 'മോശമായി അടയാളപ്പെടുത്തി. നന്ദി.';

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
  String get highRiskSwipeUpForDetails => 'കൂടുതൽ വിശദാംശങ്ങൾക്ക് മുകളിലേക്ക് സ്വൈപ്പ് ചെയ്യുക';

  @override
  String get riskLowLabel => 'കുറഞ്ഞ അപകടം';

  @override
  String get riskMediumLabel => 'ഇടത്തരം അപകടം — പുനഃപരിശോധന';

  @override
  String get riskHighLabel => 'ഉയർന്ന അപകടം — സാധ്യമായ മോശം';

  @override
  String get deleteMessageTitle => 'സന്ദേശം ഇല്ലാതാക്കണോ?';

  @override
  String get deleteMessageBody => 'ഉറപ്പാണോ? ഇത് സന്ദേശം എൽഡർ ഷീൽഡിൽ നിന്ന് മാത്രം നീക്കം ചെയ്യും.';

  @override
  String get deleteMessageConfirm => 'ഇല്ലാതാക്കുക';

  @override
  String get deleteMessageDeletedSnackbar => 'എൽഡർ ഷീൽഡിൽ നിന്ന് നീക്കം ചെയ്തു.';

  @override
  String get languageSectionTitle => 'ഭാഷ';

  @override
  String get languageEnglishName => 'ഇംഗ്ലീഷ്';

  @override
  String get languageBengaliName => 'ബംഗാളി';

  @override
  String get languageKannadaName => 'കന്നഡ';

  @override
  String get languageHindiName => 'ഹിന്ദി';

  @override
  String get languageUrduName => 'ഉർദു';

  @override
  String get languageAssameseName => 'അസാമീസ്';

  @override
  String get languageTamilName => 'തമിഴ്';

  @override
  String get languageMalayalamName => 'മലയാളം';

  @override
  String get languageTeluguName => 'തെലുങ്ക്';

  @override
  String languageSectionSubtitle(String languageName) {
    return 'നിലവിൽ: $languageName';
  }

  @override
  String get snackbarUpdated => 'പുതുക്കി';

  @override
  String get settingsAppearanceTitle => 'രൂപം';

  @override
  String get settingsThemeSystem => 'സിസ്റ്റം';

  @override
  String get settingsThemeLight => 'ലൈറ്റ്';

  @override
  String get settingsThemeDark => 'ഡാർക്ക്';

  @override
  String get settingsTextSizeTitle => 'ടെക്സ്റ്റ് സൈസ്';

  @override
  String get settingsTextSizeDescription => 'ടെക്സ്റ്റ് വലുതോ ചെറുതോ കാണാൻ ക്രമീകരിക്കുക. മാറ്റങ്ങൾ ഉടൻ ബാധകമാകും.';

  @override
  String get settingsTextSizeSample => 'എൽഡർ ഷീൽഡ് മോശമായ സന്ദേശങ്ങളിൽ നിന്ന് നിങ്ങളെ സംരക്ഷിക്കും.';

  @override
  String get settingsLegalTitle => 'നിയമം, വിവരങ്ങൾ';

  @override
  String get settingsPrivacyPolicyTitle => 'സ്വകാര്യതാ നയം';

  @override
  String get settingsPrivacyPolicySubtitle => 'നിങ്ങളുടെ ഡാറ്റ എങ്ങനെ ഉപയോഗിക്കുന്നു';

  @override
  String get settingsPermissionsExplainedTitle => 'അനുമതികൾ വിശദീകരണം';

  @override
  String get settingsPermissionsExplainedSubtitle => 'ഓരോ അനുമതിയും എന്തിനാണ് ആവശ്യം';

  @override
  String get settingsSensitivityTitle => 'സെൻസിറ്റിവിറ്റി';

  @override
  String get settingsSensitivityLabelConservative => 'കുറച്ച് എച്ചർച്ചകൾ';

  @override
  String get settingsSensitivityLabelBalanced => 'ബാലൻസ്ഡ്';

  @override
  String get settingsSensitivityLabelSensitive => 'കൂടുതൽ എച്ചർച്ചകൾ';

  @override
  String get settingsSensitivityDescConservative => 'വളരെ വ്യക്തമായ മോശങ്ങൾ മാത്രം. കുറച്ച് എച്ചർച്ചകൾ ഇഷ്ടമെങ്കിൽ അനുയോജ്യം.';

  @override
  String get settingsSensitivityDescBalanced => 'മിക്കവർക്കും അനുയോജ്യം. പിടിച്ച മോശങ്ങളും ശബ്ദവും ബാലൻസ്.';

  @override
  String get settingsSensitivityDescSensitive => 'കൂടുതൽ മോശങ്ങൾ പിടിക്കും; ചിലപ്പോൾ സുരക്ഷിത സന്ദേശങ്ങളും ഫ്ലാഗ് ചെയ്യാം.';

  @override
  String get settingsTrustedContactsTitle => 'വിശ്വസനീയ ബന്ധുക്കൾ';

  @override
  String get settingsTrustedContactsNone => 'ഇല്ല';

  @override
  String settingsTrustedContactsCount(int count) {
    return '$count ബന്ധു(ക്കൾ)';
  }

  @override
  String get settingsTrustedContactsExplanation => 'ഹോമിൽ നിന്നോ മോശം എച്ചർച്ച കാണിക്കുമ്പോഴോ ഒരു ടാപ്പിൽ വിളിക്കാം. ലിസ്റ്റിലെ ആദ്യ ബന്ധു പ്രധാന \"വിളിക്കുക\" ബട്ടണിൽ ഉപയോഗിക്കും.';

  @override
  String get settingsTrustedContactsAddContactTitle => 'ബന്ധു ചേർക്കുക';

  @override
  String get settingsTrustedContactsAddContactSubtitle => 'പേരും ഫോൺ നമ്പറും ടൈപ്പ് ചെയ്യുക';

  @override
  String get settingsTrustedContactsChooseFromContactsTitle => 'ബന്ധുക്കളിൽ നിന്ന് തിരഞ്ഞെടുക്കുക';

  @override
  String get settingsTrustedContactsChooseFromContactsSubtitle => 'നിങ്ങളുടെ ഫോണിൽ നിന്ന് നമ്പർ തിരഞ്ഞെടുക്കുക';

  @override
  String get settingsTrustedContactsPickerUnavailable => 'ഈ പ്രിവ്യൂ ബിൽഡിൽ ഡിവൈസ് കോൺടാക്റ്റ് പിക്കർ ഇതുവരെ ലഭ്യമല്ല.';

  @override
  String get settingsTrustedContactsRemoveDialogTitle => 'വിശ്വസനീയ ബന്ധു നീക്കം ചെയ്യണോ?';

  @override
  String get settingsTrustedContactsRemoveDialogBody => 'ഈ വ്യക്തി വിശ്വസനീയ ബന്ധുക്കളിലോ ഹോം സ്ക്രീണിലോ ഇനി കാണില്ല.';

  @override
  String get settingsTrustedContactsRemoveDialogRemove => 'നീക്കം ചെയ്യുക';

  @override
  String get settingsAdvancedSectionTitle => 'അഡ്വാൻസ്ഡ്';

  @override
  String get settingsDeleteAllHistoryButton => 'എല്ലാ ചരിത്രവും ഇല്ലാതാക്കുക';

  @override
  String get settingsRerunPermissionsButton => 'അനുമതി ചെക്ക് വീണ്ടും ഓടിക്കുക';

  @override
  String get settingsDeleteAllHistoryDialogTitle => 'എല്ലാ ചരിത്രവും ഇല്ലാതാക്കണോ?';

  @override
  String get settingsDeleteAllHistoryDialogBody => 'ഈ ഡിവൈസിൽ നിന്ന് എല്ലാ വിശകലനം ചെയ്ത സന്ദേശങ്ങളും കാരണങ്ങളും ശാശ്വതമായി ഇല്ലാതാക്കും. മാറ്റാനാവില്ല.';

  @override
  String get settingsDeleteAllHistoryDialogConfirm => 'എല്ലാം ഇല്ലാതാക്കുക';

  @override
  String get settingsHistoryDeletedSnackbar => 'ചരിത്രം ഇല്ലാതാക്കി';

  @override
  String get settingsRerunPermissionsSnackbar => 'അനുമതി ചെക്ക് പൂർത്തി. അനുമതി നൽകിയിട്ടുണ്ടെങ്കിൽ ആപ്പ് പുനഃക്രമീകരിക്കുക.';

  @override
  String get settingsOverlayTitle => 'മറ്റ് ആപ്പുകൾക്ക് മുകളിൽ അടിയന്തിര പോപ്പ്-അപ്പ്';

  @override
  String get settingsOverlaySubtitleEnabled => 'പ്രവർത്തനക്ഷമം: ഉയർന്ന അപകട എച്ചർച്ചകൾ മറ്റ് ആപ്പുകൾക്ക് മുകളിൽ കാണാം. മറ്റ് ആപ്പിൽ ആയിരിക്കുമ്പോഴും എച്ചർച്ച ഇഷ്ടമെങ്കിൽ ശുപാർശ.';

  @override
  String get settingsOverlaySubtitleDisabled => 'ഓഫ്: ആൻഡ്രോയിഡ് ഓവർലേ അനുമതി പ്രവർത്തനക്ഷമമാക്കാൻ ഇവിടെ ടാപ്പ് ചെയ്യുക. മറ്റ് ആപ്പ് ഉപയോഗിക്കുമ്പോഴും എച്ചർച്ച ഇഷ്ടമെങ്കിൽ ഓണായിരിക്കുന്നത് നല്ലത്.';

  @override
  String get settingsHowItWorksTitle => 'എൽഡർ ഷീൽഡ് എങ്ങനെ പ്രവർത്തിക്കും';

  @override
  String get settingsHowItWorksSubtitle => 'എന്ത് പരിശോധിക്കും, എപ്പോൾ എച്ചർച്ച, എന്ത് ചെയ്യണം';

  @override
  String get settingsAboutTitle => 'എൽഡർ ഷീൽഡിനെക്കുറിച്ച്';

  @override
  String get settingsAddTrustedDialogTitle => 'വിശ്വസനീയ ബന്ധു ചേർക്കുക';

  @override
  String get settingsAddTrustedDialogConsent => 'ഹോമിൽ നിന്നോ മോശം എച്ചർച്ച കാണിക്കുമ്പോഴോ ഒരു ടാപ്പിൽ വിളിക്കാം.';

  @override
  String get settingsAddTrustedDialogConfirm => 'ചേർക്കുക';

  @override
  String get settingsEditTrustedDialogTitle => 'വിശ്വസനീയ ബന്ധു എഡിറ്റ് ചെയ്യുക';

  @override
  String get settingsEditTrustedDialogConfirm => 'സേവ്';

  @override
  String get settingsContactNameLabel => 'പേര്';

  @override
  String get settingsContactNameHint => 'ഉദാ: എന്റെ മകൻ';

  @override
  String get settingsContactNumberLabel => 'ഫോൺ നമ്പർ';

  @override
  String get settingsContactNumberHint => 'ഉദാ: +91 98765 43210';

  @override
  String get settingsContactDialogCancel => 'റദ്ദാക്കുക';

  @override
  String get settingsContactInvalidNumber => 'സാധുവായ ഫോൺ നമ്പർ നൽകുക';

  @override
  String get howItWorksBulletWhatWeCheck => 'എന്ത് പരിശോധിക്കും: നിങ്ങളുടെ SMS വായിച്ച് മോശം അടയാളങ്ങൾ തിരയും — സംശയാസ്പദ ലിങ്കുകൾ, അടിയന്തിര/ഭീഷണി ഭാഷ, OTP അല്ലെങ്കിൽ ബാങ്ക് വിശദാംശങ്ങൾ ചോദിക്കുന്ന സന്ദേശങ്ങൾ, നിങ്ങളുടെ ബാങ്ക് അല്ലെങ്കിൽ അറിയപ്പെടുന്ന സേവനം പോലെ നടിക്കുന്ന സന്ദേശങ്ങൾ.';

  @override
  String get howItWorksBulletWhenWeAlert => 'എപ്പോൾ എച്ചർച്ച: സന്ദേശം അപകടമെന്ന് തോന്നുമ്പോൾ അറിയിക്കും. ഉയർന്ന അപകട സന്ദേശങ്ങൾക്ക് ആപ്പ് പശ്ചാത്തലത്തിൽ ആയിരിക്കുമ്പോഴും പോപ്പ്-അപ്പ് കാണിക്കാം; സന്ദേശങ്ങൾ ടാബിൽ ലിസ്റ്റ് ചെയ്യും.';

  @override
  String get howItWorksBulletWhatToDo => 'എച്ചർച്ച കാണുമ്പോൾ എന്ത് ചെയ്യണം: സന്ദേശത്തിലെ ലിങ്കിൽ ടാപ്പ് ചെയ്യരുത്. \"ഇത് മോശമാണ്\" അല്ലെങ്കിൽ \"ഇത് സുരക്ഷിതമാണ്\" അടയാളപ്പെടുത്തി നമുക്ക് പഠിക്കാൻ സഹായിക്കാം. ഏറ്റവും നല്ലത്: എച്ചർച്ച സ്ക്രീണിൽ നിന്നോ ഹോമിൽ നിന്നോ വിശ്വസനീയ ബന്ധുവിനെ വിളിക്കുക.';

  @override
  String get howItWorksBulletCallTrusted => 'വിശ്വസനീയ ബന്ധുവിനെ എങ്ങനെ വിളിക്കും: ഹോം സ്ക്രീണിൽ വലിയ \"വിളിക്കുക [പേര്]\" ബട്ടൺ എപ്പോൾ വേണമെങ്കിലും ടാപ്പ് ചെയ്യുക — പ്രത്യേകിച്ച് ഭയപ്പെടുത്തുന്ന സന്ദേശം വരുമ്പോൾ. സാധ്യമായ മോശം കാണിക്കുമ്പോൾ എച്ചർച്ച സ്ക്രീണിൽ നിന്നും വിളിക്കാം.';

  @override
  String get howItWorksSeeWarningCta => 'എച്ചർച്ച എങ്ങനെയുള്ളതാണ് കാണുക';

  @override
  String get permissionsIntro => 'എൽഡർ ഷീൽഡ് മോശത്തിൽ നിന്നുള്ള സംരക്ഷണത്തിന് മാത്രമേ അനുമതികൾ ഉപയോഗിക്കുന്നുള്ളൂ. ഏത് അനുമതിയും നിരാകരിക്കാം; സംരക്ഷണം പരിമിതമാകും, ആപ്പ് ഇപ്പോഴും പ്രവർത്തിക്കും.';

  @override
  String get permissionsSmsTitle => 'സന്ദേശങ്ങൾ (SMS)';

  @override
  String get permissionsSmsBody => 'വരുന്ന SMS സ്വീകരിച്ച് മോശം അടയാളങ്ങൾക്കായി (സംശയാസ്പദ ലിങ്കുകൾ, OTP ഫിഷിംഗ്, ബാങ്ക് പദങ്ങൾ) വിശകലനം ചെയ്ത് ആവശ്യമെങ്കിൽ എച്ചർച്ച കാണിക്കും. ഒരു സന്ദേശ ഉള്ളടക്കവും ഡിവൈസിൽ നിന്ന് അയക്കില്ല. ക്രമീകരണങ്ങളിൽ നിന്ന് എല്ലാ വിശകലന ചരിത്രവും ഇല്ലാതാക്കാം.';

  @override
  String get permissionsPhoneStateTitle => 'ഫോൺ (സ്റ്റേറ്റ് വായിക്കുക)';

  @override
  String get permissionsPhoneStateBody => 'കോളിൽ ആയിരിക്കുമ്പോൾ അറിയണം; കോളിൽ ഉള്ളപ്പോൾ OTP വരുമ്പോൾ അപകട നില ഉയർത്താൻ (സാധാരണ മോശം പാറ്റേൺ). കോളുകൾ റെക്കോർഡ് ചെയ്യില്ല, ഓഡിയോ കേൾക്കില്ല, കോൾ ലോഗ് ആക്സസ് ചെയ്യില്ല.';

  @override
  String get permissionsPhoneCallTitle => 'ഫോൺ (കോളുകൾ ഉണ്ടാക്കുക)';

  @override
  String get permissionsPhoneCallBody => 'ഹോമിൽ നിന്നോ എച്ചർച്ചയിൽ നിന്നോ \"വിശ്വസനീയ ബന്ധുവിനെ വിളിക്കുക\" ബട്ടൺ ടാപ്പ് ചെയ്ത് കോൾ ആരംഭിക്കാൻ. നിങ്ങൾ ബട്ടൺ ടാപ്പ് ചെയ്യുമ്പോൾ മാത്രം, വിശ്വസനീയ ബന്ധുക്കളായി ചേർത്ത നമ്പറുകളിലേക്ക് മാത്രം കോൾ ചെയ്യും.';

  @override
  String get permissionsNotificationsTitle => 'അറിയിപ്പുകൾ';

  @override
  String get permissionsNotificationsBody => 'സംശയാസ്പദ അല്ലെങ്കിൽ ഉയർന്ന അപകട സന്ദേശം കണ്ടെത്തുമ്പോൾ വേഗത്തിൽ അറിയിക്കാൻ. സിസ്റ്റം ക്രമീകരണങ്ങളിൽ അറിയിപ്പുകൾ ഓഫ് ചെയ്യാം; ആപ്പ് ഉപയോഗിക്കാം.';

  @override
  String get permissionsOverlayTitle => 'മറ്റ് ആപ്പുകൾക്ക് മുകളിൽ കാണിക്കുക (ഓപ്ഷണൽ)';

  @override
  String get permissionsOverlayBody => 'ക്രമീകരണങ്ങളിൽ ആൻഡ്രോയിഡ് ഓവർലേ അനുമതി പ്രവർത്തനക്ഷമമാക്കിയാൽ, ഉയർന്ന അപകട സന്ദേശം വരുമ്പോൾ എൽഡർ ഷീൽഡ് മറ്റ് ആപ്പുകൾക്ക് മുകളിൽ അടിയന്തിര എച്ചർച്ച കാണിക്കാം. പൂർണ്ണമായും ഓപ്ഷണൽ; വ്യക്തിഗത സുരക്ഷയ്ക്ക്.';

  @override
  String get privacyTitle => 'സ്വകാര്യതാ നയം';

  @override
  String get privacySection1Title => '1. ഞങ്ങൾ ആരാണ്';

  @override
  String get privacySection1Body => 'എൽഡർ ഷീൽഡ് ഒരു ആൻഡ്രോയിഡ് ആപ്പാണ്; ഡിവൈസിൽ തന്നെ സന്ദേശങ്ങൾ വിശകലനം ചെയ്ത് സംശയാസ്പദമായവ എച്ചർച്ച ചെയ്ത് മുതിർന്ന ഉപയോക്താക്കളെ SMS, കോൾ മോശങ്ങളിൽ നിന്ന് സംരക്ഷിക്കാൻ സഹായിക്കും.';

  @override
  String get privacySection2Title => '2. എന്ത് ഡാറ്റ പ്രോസസ് ചെയ്യും';

  @override
  String get privacySection2Paragraphs => 'എല്ലാ പ്രോസസ്സിംഗും നിങ്ങളുടെ ഡിവൈസിൽ. നിങ്ങളുടെ സന്ദേശങ്ങൾ, കോൾ സ്റ്റേറ്റ് അല്ലെങ്കിൽ മറ്റ് വ്യക്തിഗത ഡാറ്റ ഞങ്ങളുടെ സെർവറുകളിലേക്കോ മൂന്നാം കക്ഷിക്കോ അയക്കില്ല.\n\nസന്ദേശ ഡാറ്റ: SMS വരുമ്പോൾ ആപ്പ് അയച്ചയാൾ, ബോഡി, ടൈംസ്റ്റാമ്പ് വായിക്കും. ഈ ഡാറ്റ ഡിവൈസ് മോശം കണ്ടെത്തലിന് മാത്രം. ഫലങ്ങൾ ഡിവൈസിൽ മാത്രം സംഭരിക്കും. ക്രമീകരണങ്ങൾ → എല്ലാ ചരിത്രവും ഇല്ലാതാക്കുക വഴി എപ്പോൾ വേണമെങ്കിലും ഇല്ലാതാക്കാം.\n\nകോൾ സ്റ്റേറ്റ്: നിങ്ങൾ കോളിൽ ആണോ എന്ന് പരിശോധിക്കും. കോളുകൾ റെക്കോർഡ്/കേൾക്കുക/കോൾ ലോഗ് ആക്സസ് ചെയ്യില്ല. കോൾ സ്റ്റേറ്റ് കണ്ടെത്തൽ മെച്ചപ്പെടുത്താൻ മാത്രം (ഉദാ കോളിൽ ഉള്ളപ്പോൾ OTP വരുമ്പോൾ എച്ചർച്ച).\n\nക്രമീകരണങ്ങളും വിശ്വസനീയ ബന്ധുക്കളും: ഡിവൈസിന്റെ സുരക്ഷിത സംഭരണത്തിൽ മാത്രം. \"വിശ്വസനീയ ബന്ധുവിനെ വിളിക്കുക\" ബട്ടണിന് മാത്രം; സ്വയം വിളിക്കില്ല, സന്ദേശം അയക്കില്ല.';

  @override
  String get privacySection3Title => '3. ഞങ്ങൾ ചെയ്യാത്തത്';

  @override
  String get privacySection3Paragraphs => 'നിങ്ങളുടെ SMS ഉള്ളടക്കം, കോൾ സ്റ്റേറ്റ് അല്ലെങ്കിൽ കോൺടാക്റ്റ് ലിസ്റ്റ് ഇന്റർനെറ്റിലേക്ക് അയക്കില്ല.\n\nഡാറ്റ പരസ്യക്കാർക്കോ ഡാറ്റ ബ്രോക്കർമാർക്കോ വിൽക്കില്ല, വാടകയ്ക്ക് നൽകില്ല, പങ്കിടില്ല.\n\nഅക്കൗണ്ടോ സൈൻ-ഇനോ ആവശ്യമില്ല. അനുമതികൾ നൽകിയ ശേഷം ആപ്പ് പൂർണ്ണമായും ഓഫ്ലൈനിൽ പ്രവർത്തിക്കും.\n\nRCS/ചാറ്റ് സന്ദേശങ്ങൾ വായിക്കില്ല, വിശകലനം ചെയ്യില്ല; സ്റ്റാൻഡേർഡ് SMS മാത്രം.';

  @override
  String get privacySection4Title => '4. അനുമതികളും എന്തിനാണ് ആവശ്യം';

  @override
  String get privacySection4Paragraphs => 'SMS (സ്വീകരിക്കുക/വായിക്കുക): വരുന്ന SMS വായിച്ച് മോശം പാറ്റേണുകൾ കണ്ടെത്തി എച്ചർച്ച. ഫോൺ (കോൾ സ്റ്റേറ്റ് വായിക്കുക): കോളിൽ ആയിരിക്കുമ്പോൾ അറിയാൻ; കോളിൽ ഉള്ളപ്പോൾ OTP വരുമ്പോൾ ഉയർന്ന അപകടം. കോളുകൾ റെക്കോർഡ്/കേൾക്കില്ല. ഫോൺ (കോൾ): \"വിശ്വസനീയ ബന്ധുവിനെ വിളിക്കുക\" ടാപ്പ്. നിങ്ങൾ ചേർത്ത വിശ്വസനീയ ബന്ധു നമ്പറുകളിലേക്ക് മാത്രം, നിങ്ങൾ ടാപ്പ് ചെയ്യുമ്പോൾ മാത്രം. അറിയിപ്പുകൾ: സംശയാസ്പദ/ഉയർന്ന അപകട സന്ദേശം കണ്ടെത്തുമ്പോൾ അറിയിക്കാൻ. \"ഈ അയച്ചയാളെ ബ്ലോക്ക് ചെയ്യുക\" തിരഞ്ഞെടുത്താൽ ആപ്പ് മെസ്സേജിംഗ് ആപ്പ് തുറക്കാം; ആപ്പ് സ്വയം SMS അയക്കില്ല.';

  @override
  String get privacySection5Title => '5. ഡാറ്റ് റിറ്റൻഷനും നിങ്ങളുടെ തിരഞ്ഞെടുപ്പുകളും';

  @override
  String get privacySection5Paragraphs => 'വിശകലനം ചെയ്ത സന്ദേശങ്ങൾ/കാരണങ്ങൾ: ക്രമീകരണങ്ങൾ → എല്ലാ ചരിത്രവും ഇല്ലാതാക്കുക തിരഞ്ഞെടുക്കും വരെ ഡിവൈസിൽ മാത്രം. ക്രമീകരണങ്ങൾ/വിശ്വസനീയ ബന്ധുക്കൾ: മാറ്റം/നീക്കം അല്ലെങ്കിൽ ആപ്പ് അൺഇൻസ്റ്റാൾ ചെയ്യും വരെ ഡിവൈസിൽ മാത്രം. ഞങ്ങളുടെ സെർവറുകളിൽ നിങ്ങളുടെ ഡാറ്റയുടെ കോപ്പി സൂക്ഷിക്കില്ല; ശേഖരിക്കില്ല.';

  @override
  String get privacySection6Title => '6. കുട്ടികളും സെൻസിറ്റീവ് ഉപയോക്താക്കളും';

  @override
  String get privacySection6Paragraphs => 'ആപ്പ് മുതിർന്ന, ദുർബല ഉപയോക്താക്കളെ മോശത്തിൽ നിന്ന് സംരക്ഷിക്കാൻ ഉദ്ദേശിച്ചതാണ്. കുട്ടികളിൽ നിന്ന് പാരന്റൽ സമ്മതം ആവശ്യമായ രീതിയിൽ ഡാറ്റ ശേഖരിക്കില്ല; ആപ്പ് ഡാറ്റ ഡിവൈസിൽ നിന്ന് അയക്കില്ല.\n\nമറ്റൊരാളുടെ (ഉദാ മുതിർന്ന കുടുംബാംഗം) ആപ്പ് സജ്ജമാക്കുമ്പോൾ അനുമതികളും ഈ നയവും ലളിത ഭാഷയിൽ വിശദീകരിക്കാൻ ശുപാർശ.';

  @override
  String get privacySection7Title => '7. ഈ നയത്തിലെ മാറ്റങ്ങൾ';

  @override
  String get privacySection7Paragraphs => 'ഈ നയം മാറ്റിയാൽ (ഉദാ ഭാവി പതിപ്പിൽ ഓപ്ഷണൽ ക്ലൗഡ് ഫീച്ചറുകൾ), ഈ ഡോക്യുമെന്റ് പുതുക്കി നിയമം/സ്റ്റോർ നയം പ്രകാരം അറിയിക്കുകയോ സമ്മതം ചോദിക്കുകയോ ചെയ്യും.';

  @override
  String get privacySection8Title => '8. ബന്ധപ്പെടുക';

  @override
  String get privacySection8Body => 'എൽഡർ ഷീൽഡ് സംബന്ധിച്ച സ്വകാര്യതാ ചോദ്യങ്ങൾ/അഭ്യർത്ഥനകൾക്ക് ഇവിടെ ബന്ധപ്പെടുക: [നിങ്ങളുടെ ഇമെയിൽ അല്ലെങ്കിൽ സപ്പോർട്ട് URL ഇവിടെ ചേർക്കുക].';

  @override
  String get privacyLastUpdatedNote => 'അവസാന പുതുക്കൽ: ബ്ലോക്ക് 10. റിലീസിന് മുമ്പ് പ്ലെയ്സ്ഹോൾഡറുകൾ യഥാർത്ഥ വിവരങ്ങളാൽ മാറ്റുക.';

  @override
  String get aboutTagline => 'മുതിർന്ന ഉപയോക്താക്കൾക്ക് ഡിവൈസിൽ തന്നെ മോശം സംരക്ഷണം.';

  @override
  String get messagesAppBarTitle => 'സന്ദേശങ്ങൾ';

  @override
  String get messagesFilterAll => 'എല്ലാം';

  @override
  String get messagesFilterHighRisk => 'ഉയർന്ന അപകടം';

  @override
  String get messagesFilterAllSemanticsLabel => 'എല്ലാ സന്ദേശങ്ങളും കാണിക്കുക';

  @override
  String get messagesFilterAllSemanticsHint => 'എല്ലാ വിശകലനം ചെയ്ത സന്ദേശങ്ങൾ കാണാൻ ഇരട്ടി ടാപ്പ് ചെയ്യുക.';

  @override
  String get messagesFilterHighRiskSemanticsLabel => 'ഉയർന്ന അപകട സന്ദേശങ്ങൾ മാത്രം കാണിക്കുക';

  @override
  String get messagesFilterHighRiskSemanticsHint => 'ഏറ്റവും ഗുരുതരമായ എച്ചർച്ചകൾ ഫിൽട്ടർ ചെയ്യാൻ ഇരട്ടി ടാപ്പ് ചെയ്യുക.';

  @override
  String get messagesErrorTitle => 'സന്ദേശങ്ങൾ ലോഡ് ചെയ്യുമ്പോൾ എന്തോ തെറ്റുപറ്റി.';

  @override
  String get messagesErrorSubtitle => 'വീണ്ടും ശ്രമിക്കാൻ താഴേക്ക് വലിച്ചിടുക.';

  @override
  String get messagesEmptyTitle => 'ഇതുവരെ സന്ദേശം വിശകലനം ചെയ്തിട്ടില്ല. എൽഡർ ഷീൽഡ് പുതിയ സന്ദേശങ്ങൾ സ്വയം പരിശോധിക്കും.';

  @override
  String get messagesEmptySubtitle => 'സംശയാസ്പദമായത് കണ്ടെത്തുമ്പോൾ അറിയിക്കും; ഇവിടെ നിന്ന് തുറക്കാം.';

  @override
  String get messagesRefreshSnackbar => 'ലിസ്റ്റ് പുതുക്കി';

  @override
  String get messagesLoadingHeader => 'സന്ദേശങ്ങൾ ലോഡ് ചെയ്യുന്നു…';

  @override
  String messagesDateToday(String time) {
    return 'ഇന്ന്, $time';
  }

  @override
  String messagesDateYesterday(String time) {
    return 'ഇന്നലെ, $time';
  }

  @override
  String messagesDateOther(String month, int day, String time) {
    return '$month $day, $time';
  }

  @override
  String onboardingStepOf(int step, int total) {
    return 'ഘട്ടം $step / $total';
  }

  @override
  String get onboardingWelcomeBody1 => 'എൽഡർ ഷീൽഡ് നിങ്ങളുടെ സന്ദേശങ്ങളും കോളുകളും നിരീക്ഷിക്കും; മോശം ഉണ്ടെങ്കിൽ മുൻകൂട്ടി എച്ചർച്ച ചെയ്യും.';

  @override
  String get onboardingWelcomeBody2 => 'എപ്പോൾ വിശ്വസിക്കാൻ സംശയമെങ്കിൽ ഒരു ടാപ്പിൽ വിശ്വസിക്കുന്ന ആളെ വിളിക്കാം.';

  @override
  String get onboardingGetStarted => 'ആരംഭിക്കുക';

  @override
  String get onboardingPermissionsTitle => 'എന്തിനാണ് ആക്സസ് ആവശ്യം';

  @override
  String get onboardingPermissionsBulletMessages => 'സന്ദേശങ്ങൾ: നിങ്ങളുടെ ടെക്സ്റ്റ് വായിച്ച് മോശം പോലെ തോന്നുമ്പോൾ എച്ചർച്ച.';

  @override
  String get onboardingPermissionsBulletPhone => 'ഫോൺ: കോളിൽ ആയിരിക്കുമ്പോൾ അറിയാൻ. മോശം ചെയ്യുന്നവർ കോളിൽ ഉള്ളപ്പോൾ OTP ചോദിക്കും.';

  @override
  String get onboardingPermissionsBody1 => 'താഴെ \"അനുമതികൾ അനുവദിക്കുക\" ടാപ്പ് ചെയ്യുമ്പോൾ ഡിവൈസ് ചോദിക്കും: സന്ദേശങ്ങൾ, ഫോൺ, അറിയിപ്പുകൾ (ആപ്പ് അടച്ചിരിക്കുമ്പോഴും സാധ്യമായ മോശം എച്ചർച്ച).';

  @override
  String get onboardingPermissionsBody2 => 'മോശം പരിശോധനയ്ക്ക് മാത്രമേ സന്ദേശങ്ങൾ വായിക്കുന്നുള്ളൂ; മറ്റൊന്നിനും അല്ല.';

  @override
  String get onboardingPermissionsRetryWarning => 'ചില അനുമതികൾ നിരാകരിച്ചു. അനുമതി നൽകും വരെ സംരക്ഷണം പരിമിതമാകും.';

  @override
  String get onboardingPermissionsPrimaryAllow => 'അനുമതികൾ അനുവദിക്കുക';

  @override
  String get onboardingPermissionsPrimaryRetry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get onboardingSkipForNow => 'ഇപ്പോൾ ഒഴിവാക്കുക';

  @override
  String get onboardingTrustedTitle => 'വിശ്വസനീയ ബന്ധു ചേർക്കുക';

  @override
  String get onboardingTrustedBody1 => 'ഭയപ്പെടുത്തുന്ന സന്ദേശം വന്നാൽ വിളിക്കുന്ന ആളെ തിരഞ്ഞെടുക്കുക — കുടുംബാംഗം അല്ലെങ്കിൽ അടുത്ത സുഹൃത്ത്.';

  @override
  String get onboardingTrustedBody2 => 'ചേർത്ത ശേഷം ഹോം സ്ക്രീണിൽ നിന്നോ മോശം എച്ചർച്ച കാണിക്കുമ്പോഴോ ഒരു ടാപ്പിൽ ഇവരെ വിളിക്കാം.';

  @override
  String get onboardingTrustedAddFromContacts => 'ബന്ധുക്കളിൽ നിന്ന് ചേർക്കുക';

  @override
  String get onboardingTrustedAddFromContactsUnavailable => 'ഈ പ്രിവ്യൂ ബിൽഡിൽ ഡിവൈസ് കോൺടാക്റ്റ് പിക്കർ ഇതുവരെ ലഭ്യമല്ല.';

  @override
  String get onboardingTrustedOrEnterManually => 'അല്ലെങ്കിൽ നമ്പർ കൈയ്യിൽ നൽകുക:';

  @override
  String get onboardingTrustedDone => 'പൂർത്തി';

  @override
  String get onboardingTrustedSeeWarningCta => 'എച്ചർച്ച എങ്ങനെയുള്ളതാണ് കാണുക';

  @override
  String get onboardingTrustedMissingFields => 'പേരും നമ്പറും രണ്ടും നൽകുക';

  @override
  String get launchGateChecking => 'പരിശോധിക്കുന്നു…';

  @override
  String get exampleWarningBanner => 'ഇത് ഒരു ഉദാഹരണം മാത്രം. യഥാർത്ഥ സന്ദേശമോ പ്രവർത്തനമോ ഇല്ല.';

  @override
  String get exampleWarningSnackbar => 'ഇത് ഒരു ഉദാഹരണമായിരുന്നു. ഒരു പ്രവർത്തനവും നടത്തിയില്ല.';

  @override
  String get exampleWarningButton => 'മനസ്സിലായി — ഇത് ഒരു ഉദാഹരണമായിരുന്നു';

  @override
  String get exampleWarningSenderUnknown => 'അജ്ഞാതം';

  @override
  String get exampleWarningBody => 'നിങ്ങളുടെ ബാങ്ക് അക്കൗണ്ട് 24 മണിക്കൂറിനുള്ളിൽ ബ്ലോക്ക് ചെയ്യപ്പെടും. സ്ഥിരീകരിക്കാൻ ഇവിടെ ക്ലിക്ക് ചെയ്യുക: http://secure-bank-verify.com. ആരുമായും പങ്കിടരുത്.';

  @override
  String get exampleWarningReasonSuspiciousLink => 'സംശയാസ്പദ ലിങ്ക് ഉൾക്കൊള്ളുന്നു';

  @override
  String get exampleWarningReasonPretendBank => 'നിങ്ങളുടെ ബാങ്ക് പോലെ നടിക്കുന്നു';

  @override
  String get exampleWarningReasonUrgentLanguage => 'അടിയന്തിര അല്ലെങ്കിൽ ഭീഷണി ഭാഷ ഉപയോഗിക്കുന്നു';

  @override
  String get reasonShortUrl => 'ചുരുക്കിയ അല്ലെങ്കിൽ സംശയാസ്പദ ലിങ്ക് ഉൾക്കൊള്ളുന്നു';

  @override
  String get reasonOtpMention => 'ഒറ്റത്തവണ കോഡ് (OTP) ചോദിക്കുന്നു അല്ലെങ്കിൽ പരാമർശിക്കുന്നു';

  @override
  String get reasonUrgentLanguage => 'അടിയന്തിര അല്ലെങ്കിൽ ഭീഷണി ഭാഷ ഉപയോഗിക്കുന്നു';

  @override
  String get reasonBankKyc => 'ബാങ്ക് അക്കൗണ്ട്, KYC അല്ലെങ്കിൽ പേയ്മെന്റ് വിശദാംശങ്ങൾ പരാമർശിക്കുന്നു';

  @override
  String get reasonPaymentRequest => 'പണം അയച്ചോ അംഗീകരിച്ചോ ചോദിക്കുന്നു';

  @override
  String get reasonPrizeLottery => 'പ്രൈസ് അല്ലെങ്കിൽ ലോട്ടറി റിവാർഡ് മോശം പോലെ';

  @override
  String get reasonParcelDelivery => 'സംശയാസ്പദ പാർസൽ അല്ലെങ്കിൽ ഡെലിവറി പ്രശ്നം പരാമർശിക്കുന്നു';

  @override
  String get reasonCryptoInvestment => 'അപകടം കൂടിയ ക്രിപ്റ്റോ നിക്ഷേപം അല്ലെങ്കിൽ ഗ്യാരൻടീഡ് റിട്ടേണുകൾ പരാമർശിക്കുന്നു';

  @override
  String get reasonSenderSuspicious => 'അയച്ചയാൾ പേര് അസാധാരണ അല്ലെങ്കിൽ സംശയാസ്പദം';

  @override
  String get reasonInCallOtp => 'കോളിൽ ഉള്ളപ്പോൾ OTP വന്നു — സാധാരണ മോശം പാറ്റേൺ';

  @override
  String messageFromLabel(String sender) {
    return 'അയച്ചയാൾ: $sender';
  }

  @override
  String get fullScreenWarningTitle => 'സാധ്യമായ മോശം';

  @override
  String get fullScreenWarningClosingNote => 'ഈ സ്ക്രീൻ അടയ്ക്കുന്നത് നിങ്ങളുടെ ഫോണിൽ നിന്ന് സന്ദേശം ഇല്ലാതാക്കില്ല.';

  @override
  String get fullScreenWarningDeleteAction => 'സന്ദേശം ഇല്ലാതാക്കുക';

  @override
  String get fullScreenWarningDeleteSnackbar => 'എൽഡർ ഷീൽഡിൽ നിന്ന് നീക്കം ചെയ്തു. നിങ്ങളുടെ മെസ്സേജിംഗ് ആപ്പ് തുറക്കുന്നു; അവിടെ നിന്നും ഇല്ലാതാക്കാം.';

  @override
  String get fullScreenWarningBlockSender => 'ഈ അയച്ചയാളെ ബ്ലോക്ക് ചെയ്യുക (മെസ്സേജിംഗ് ആപ്പ് തുറക്കും)';

  @override
  String get roleSelectionTitle => 'ആർക്കുവേണ്ടി സജ്ജീകരിക്കുകയാണ്?';

  @override
  String get roleSelectionSubtitle => 'ഇത് അനുഭവം വ്യക്തിഗതമാക്കാൻ സഹായിക്കുന്നു.';

  @override
  String get caregiverOption => 'ഞാൻ എന്റെ മാതാപിതാക്കൾ / കുടുംബാംഗത്തിനുവേണ്ടി സജ്ജീകരിക്കുകയാണ്';

  @override
  String get selfProtectionOption => 'ഞാൻ എന്നെ സ്വയം സംരക്ഷിക്കാൻ ആഗ്രഹിക്കുന്നു';

  @override
  String get namePersonTitle => 'നിങ്ങൾ ആരെ സംരക്ഷിക്കുകയാണ്?';

  @override
  String get namePersonSubtitle => 'ഒരു പേര് തിരഞ്ഞെടുക്കുക അല്ലെങ്കിൽ സ്വയം ടൈപ്പ് ചെയ്യുക.';

  @override
  String get presetNameMaa => 'അമ്മ';

  @override
  String get presetNamePapa => 'അച്ഛൻ';

  @override
  String get presetNameDadi => 'അമ്മൂമ്മ';

  @override
  String get presetNameDada => 'അപ്പൂപ്പൻ';

  @override
  String get presetNameNani => 'നാനി';

  @override
  String get presetNameNana => 'നാനാ';

  @override
  String get namePersonCustomHint => 'അല്ലെങ്കിൽ ഒരു പേര് ടൈപ്പ് ചെയ്യുക';

  @override
  String get namePersonContinue => 'തുടരുക';

  @override
  String get namePersonValidation => 'ദയവായി ഒരു പേര് തിരഞ്ഞെടുക്കുക അല്ലെങ്കിൽ നൽകുക';

  @override
  String get guardianTitle => 'നിങ്ങളെ ഗാർഡിയനായി ചേർക്കുക';

  @override
  String get guardianSubtitle => 'അവരുടെ ഫോണിൽ സംശയകരമായ സന്ദേശം വന്നാൽ നിങ്ങളെ അറിയിക്കും.';

  @override
  String get guardianNameLabel => 'നിങ്ങളുടെ പേര്';

  @override
  String get guardianNameHint => 'ഉദാ. രാഹുൽ';

  @override
  String get guardianPhoneLabel => 'നിങ്ങളുടെ WhatsApp / ഫോൺ നമ്പർ';

  @override
  String get guardianPhoneHint => 'ഉദാ. +91 98765 43210';

  @override
  String get guardianContinue => 'തുടരുക';

  @override
  String get guardianValidation => 'ദയവായി നിങ്ങളുടെ പേരും ഫോൺ നമ്പറും നൽകുക';

  @override
  String get yourNameTitle => 'നിങ്ങളുടെ പേര് എന്താണ്?';

  @override
  String get yourNameSubtitle => 'നിങ്ങളുടെ സംരക്ഷണം വ്യക്തിഗതമാക്കാൻ.';

  @override
  String get yourNameHint => 'നിങ്ങളുടെ പേര് നൽകുക';

  @override
  String get yourNameContinue => 'തുടരുക';

  @override
  String get yourNameValidation => 'ദയവായി നിങ്ങളുടെ പേര് നൽകുക';

  @override
  String get addGuardianOptional => 'ശ്രദ്ധിക്കുന്ന ഒരു കുടുംബാംഗം ഉണ്ടോ? ഒരു ഗാർഡിയനെ ചേർക്കുക';

  @override
  String get addGuardianOptionalSubtitle => 'നിങ്ങൾക്ക് സംശയകരമായ സന്ദേശം ലഭിക്കുമ്പോൾ അവരെ അറിയിക്കാം.';

  @override
  String get onboardingFinish => 'സജ്ജീകരണം പൂർത്തിയാക്കുക';
}
