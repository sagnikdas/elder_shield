import 'package:elder_shield/l10n/app_localizations.dart';

/// Maps detector reason strings (English, from the heuristic) to localized text.
/// Falls back to the original reason if we don't recognise it.
String localizeDetectionReason(String reason, AppLocalizations l10n) {
  switch (reason) {
    case 'Contains a shortened or suspicious link':
      return l10n.reasonShortUrl;
    case 'Asks for or mentions a one-time code (OTP)':
      return l10n.reasonOtpMention;
    case 'Uses urgent or threatening language':
      return l10n.reasonUrgentLanguage;
    case 'Mentions bank account, KYC, or payment details':
      return l10n.reasonBankKyc;
    case 'Asks you to send or approve a payment':
      return l10n.reasonPaymentRequest;
    case 'Looks like a prize or lottery reward scam':
      return l10n.reasonPrizeLottery;
    case 'Mentions a suspicious parcel or delivery issue':
      return l10n.reasonParcelDelivery;
    case 'Mentions risky crypto investment or guaranteed returns':
      return l10n.reasonCryptoInvestment;
    case 'Sender name looks unusual or suspicious':
      return l10n.reasonSenderSuspicious;
    case 'An OTP arrived while you are on a phone call — common scam pattern':
      return l10n.reasonInCallOtp;
    default:
      return reason;
  }
}

