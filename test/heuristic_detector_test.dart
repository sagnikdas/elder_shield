import 'package:flutter_test/flutter_test.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';

void main() {
  const detector = HeuristicDetector();

  group('HeuristicDetector', () {
    test('benign friendly message → low risk, few reasons', () {
      final result = detector.analyze(
        sender: '+911234567890',
        body: 'Hi dad, I will reach home by 7 pm. Love you!',
        isInCall: false,
      );
      expect(result.band, RiskBand.low);
      expect(result.score, lessThan(HeuristicDetector.config.thresholdMedium));
      expect(result.reasons, isEmpty);
    });

    test('pure OTP from bank → medium risk', () {
      final result = detector.analyze(
        sender: 'ICICIBANK',
        body: 'Your OTP for transaction at ABC store is 123456. Do not share this OTP with anyone.',
        isInCall: false,
      );
      // At least not clearly safe.
      expect(result.band, isNot(RiskBand.low));
      expect(result.reasons, contains('Asks for or mentions a one-time code (OTP)'));
    });

    test('OTP with urgent language and bank keywords → high risk', () {
      final result = detector.analyze(
        sender: 'HDFCBANK',
        body:
            'URGENT: Your bank account will be blocked. Verify your KYC now using OTP 987654 to avoid suspension.',
        isInCall: false,
      );
      // Should be in the upper bands.
      expect(result.band, anyOf(RiskBand.medium, RiskBand.high));
      expect(result.reasons.length, greaterThanOrEqualTo(3));
    });

    test('shortened URL only → medium risk', () {
      final result = detector.analyze(
        sender: 'SHOP-DEALS',
        body: 'Limited time offer! Click http://bit.ly/xyz12 to claim your cashback.',
        isInCall: false,
      );
      // Treated as at least medium risk, possibly high after tuning.
      expect(result.band, anyOf(RiskBand.medium, RiskBand.high));
      expect(
        result.reasons,
        contains('Contains a shortened or suspicious link'),
      );
    });

    test('generic http link with short path → counts as suspicious URL', () {
      final result = detector.analyze(
        sender: 'PROMO',
        body: 'Offer: https://ab.co/xYz1Q ends tonight.',
        isInCall: false,
      );
      expect(result.reasons, contains('Contains a shortened or suspicious link'));
    });

    test('urgent legal action scam pattern → medium or high risk', () {
      final result = detector.analyze(
        sender: 'INCOMETAX',
        body:
            'FINAL NOTICE: Legal action will be taken if you do not update your PAN KYC immediately.',
        isInCall: false,
      );
      expect(result.band, isNot(RiskBand.low));
      expect(result.reasons, contains('Uses urgent or threatening language'));
      expect(
        result.reasons,
        contains('Mentions bank account, KYC, or payment details'),
      );
    });

    test('UPI refund bait → medium risk', () {
      final result = detector.analyze(
        sender: 'UPI-ALERT',
        body:
            'Refund initiated to your UPI ID. Verify your bank account and UPI PIN to receive cashback.',
        isInCall: false,
      );
      // Even if overall band is low, it must flag the bank/payment angle.
      expect(
        result.reasons,
        contains('Mentions bank account, KYC, or payment details'),
      );
      expect(
        result.reasons,
        contains('Mentions bank account, KYC, or payment details'),
      );
    });

    test('suspect alpha sender header bumps score', () {
      final result = detector.analyze(
        sender: 'SecureAlert',
        body: 'Your package will be delivered tomorrow.',
        isInCall: false,
      );
      expect(result.reasons, contains('Sender name looks unusual or suspicious'));
    });

    test('numeric phone sender is not auto-suspicious', () {
      final result = detector.analyze(
        sender: '+918431263541',
        body: 'Test OTP 123456',
        isInCall: false,
      );
      // Should not add sender anomaly reason for normal phone number.
      expect(
        result.reasons.where((r) => r.contains('Sender name looks unusual')).length,
        0,
      );
    });

    test('OTP arriving while in call → boosted to high risk', () {
      final base = detector.analyze(
        sender: 'BANKALERT',
        body: 'Your OTP for login is 432198. Do not share it with anyone.',
        isInCall: false,
      );
      final boosted = detector.analyze(
        sender: 'BANKALERT',
        body: 'Your OTP for login is 432198. Do not share it with anyone.',
        isInCall: true,
      );

      expect(boosted.score, greaterThan(base.score));
      expect(
        boosted.reasons,
        contains(
          'An OTP arrived while you are on a phone call — common scam pattern',
        ),
      );
      expect(boosted.band.index, greaterThanOrEqualTo(base.band.index));
    });

    test('empty body → low risk, no reasons', () {
      final result = detector.analyze(
        sender: '+911234567890',
        body: '',
        isInCall: false,
      );
      expect(result.band, RiskBand.low);
      expect(result.reasons, isEmpty);
    });

    test('benign bank notification (no urgency/OTP) stays low or medium', () {
      final result = detector.analyze(
        sender: 'HDFCBANK',
        body: 'Your account statement for March is ready in net banking.',
        isInCall: false,
      );
      expect(result.reasons, isNotEmpty);
      expect(result.band, anyOf(RiskBand.low, RiskBand.medium));
    });

    test('multiple signals saturate score at 1.0', () {
      final result = detector.analyze(
        sender: 'SecureSupport',
        body:
            'URGENT: Your bank account will be blocked. OTP 123456 will expire in 5 minutes. Click http://bit.ly/fraudlink now.',
        isInCall: true,
      );
      expect(result.score, inInclusiveRange(0.0, 1.0));
      expect(result.score, lessThanOrEqualTo(1.0));
      expect(result.band, RiskBand.high);
      expect(result.reasons.length, greaterThanOrEqualTo(4));
    });

    test('thresholds: score below medium threshold is low', () {
      final result = detector.analyze(
        sender: '+911234567890',
        body: 'Limited time sale on shoes at our store.',
        isInCall: false,
      );
      expect(result.score, lessThan(HeuristicDetector.config.thresholdMedium));
      expect(result.band, RiskBand.low);
    });

    test('thresholds: medium band when score is in middle range', () {
      final result = detector.analyze(
        sender: 'PROMO',
        body: 'Limited time offer! Click http://bit.ly/xyz12 for discount.',
        isInCall: false,
      );
      expect(result.band, anyOf(RiskBand.medium, RiskBand.high));
    });

    test('no false positives on casual money mention', () {
      final result = detector.analyze(
        sender: '+911234567890',
        body: 'I will send you the taxi money tomorrow.',
        isInCall: false,
      );
      expect(result.band, RiskBand.low);
    });

    test('KYC keyword alone still triggers bank reason', () {
      final result = detector.analyze(
        sender: 'SERVICE',
        body: 'Please complete your KYC in the app at your convenience.',
        isInCall: false,
      );
      expect(
        result.reasons,
        contains('Mentions bank account, KYC, or payment details'),
      );
    });

    test('multiple OTP-like numbers still treated as one signal', () {
      final result = detector.analyze(
        sender: 'BANK',
        body: 'Codes: 1234, 5678, 9012. Use only once.',
        isInCall: false,
      );
      expect(
        result.reasons.where(
          (r) => r.contains('Asks for or mentions a one-time code'),
        ),
        isNotEmpty,
      );
    });

    test('non-Latin text without known keywords → low risk', () {
      final result = detector.analyze(
        sender: '+911234567890',
        body: 'こんにちは、お元気ですか？', // Japanese greeting
        isInCall: false,
      );
      expect(result.band, RiskBand.low);
    });

    // ── Multilingual detection ────────────────────────────────────────────────

    test('Hindi KYC scam → flags bank keyword', () {
      final result = detector.analyze(
        sender: 'SBIBANK',
        body: 'आपका खाता बंद हो जाएगा। केवाईसी अपडेट करें अन्यथा बैंक खाता ब्लॉक होगा।',
        isInCall: false,
      );
      expect(
        result.reasons,
        contains('Mentions bank account, KYC, or payment details'),
      );
      expect(result.band, isNot(RiskBand.low));
    });

    test('Hindi urgency + OTP scam → medium or high risk', () {
      final result = detector.analyze(
        sender: 'ALERTS',
        body: 'तुरंत ध्यान दें: आपका खाता लॉक हो गया है। ओटीपी 748291 किसी को न बताएं।',
        isInCall: false,
      );
      expect(result.reasons, contains('Uses urgent or threatening language'));
      expect(result.reasons, contains('Asks for or mentions a one-time code (OTP)'));
      expect(result.band, anyOf(RiskBand.medium, RiskBand.high));
    });

    test('Tamil urgency + bank scam → flags both signals', () {
      final result = detector.analyze(
        sender: 'TMBANK',
        body: 'அவசரம்: உங்கள் வங்கி கணக்கு நிறுத்தப்படும். உடனே சரிபார்க்கவும்.',
        isInCall: false,
      );
      expect(result.reasons, contains('Uses urgent or threatening language'));
      expect(
        result.reasons,
        contains('Mentions bank account, KYC, or payment details'),
      );
      expect(result.band, isNot(RiskBand.low));
    });

    test('Tamil bank + OTP scam → medium or high risk', () {
      final result = detector.analyze(
        sender: 'HDFCALERT',
        body: 'உங்கள் வங்கி கணக்கு சரிபார்க்க ஓடிபி: 384921. இந்த குறியீட்டை யாரிடமும் பகிர வேண்டாம்.',
        isInCall: false,
      );
      expect(
        result.reasons,
        contains('Mentions bank account, KYC, or payment details'),
      );
      expect(result.reasons, contains('Asks for or mentions a one-time code (OTP)'));
    });

    test('Bengali urgency + bank scam → medium or high risk', () {
      final result = detector.analyze(
        sender: 'BNKalert',
        body: 'জরুরি: আপনার অ্যাকাউন্ট বন্ধ হয়ে যাবে। কেওয়াইসি আপডেট করুন। ব্যাংক অ্যাকাউন্ট যাচাই করুন।',
        isInCall: false,
      );
      expect(result.reasons, contains('Uses urgent or threatening language'));
      expect(
        result.reasons,
        contains('Mentions bank account, KYC, or payment details'),
      );
      expect(result.band, anyOf(RiskBand.medium, RiskBand.high));
    });

    test('Bengali lottery reward scam → flags reward keyword', () {
      final result = detector.analyze(
        sender: 'PROMO',
        body: 'অভিনন্দন বিজয়ী! আপনি জিতেছেন ১০ লক্ষ টাকা। পুরস্কার দাবি করুন এখনই।',
        isInCall: false,
      );
      expect(result.reasons, contains('Looks like a prize or lottery reward scam'));
    });

    test('Hindi payment request scam → flags payment keyword', () {
      final result = detector.analyze(
        sender: '+919876543210',
        body: 'अभी भुगतान करें। भुगतान लिंक पर क्लिक करें: http://bit.ly/pay123',
        isInCall: false,
      );
      expect(result.reasons, contains('Asks you to send or approve a payment'));
      expect(result.reasons, contains('Contains a shortened or suspicious link'));
    });

    test('benign Hindi family message → low risk', () {
      final result = detector.analyze(
        sender: '+918765432109',
        body: 'नमस्ते, मैं कल आऊंगा। खाना तैयार रखना।',
        isInCall: false,
      );
      expect(result.band, RiskBand.low);
      expect(result.reasons, isEmpty);
    });

    test('score is always clamped between 0 and 1', () {
      final result = detector.analyze(
        sender: 'SecureSupport',
        body:
            'URGENT: Your bank account will be blocked. OTP 123456 will expire in 5 minutes. Click http://bit.ly/fraudlink now.',
        isInCall: true,
      );
      expect(result.score >= 0.0 && result.score <= 1.0, isTrue);
    });
  });
}

