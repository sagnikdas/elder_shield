package com.eldershield.elder_shield

/**
 * Lightweight heuristic check for use when the app is killed.
 * Kept in sync with Dart HeuristicDetector where possible.
 * Used only to decide whether to show a "possible scam" notification and open the app.
 */
object SimpleRiskCheck {

    // TRAI DLT-registered entity-code suffixes (the part after the "XX-" telco
    // prefix). Kept in sync with detector-config.json trustedDltSuffixes.
    private val trustedDltSuffixes = setOf(
        // PSU Banks
        "SBIINB", "SBISMS", "SBIBNK", "SBIUPI",
        "PNBSMS", "PNBNKD",
        "BOBIBD", "BOBBNK",
        "CANBNK",
        "UNIONB",
        "INDBNK",
        "CENTBK",
        "IOBSMS",
        "MAHBNK",
        // Private Banks
        "HDFCBK", "HDFCBN",
        "ICICIB", "ICICIBK",
        "AXISBK", "AXISBN",
        "KOTAKB", "KOTAKM",
        "YESBNK", "YESBKS",
        "INDUSL", "INDUSB",
        "FEDBNK",
        "IDBIBNK",
        "RBLBNK",
        "DCBBNK",
        "SOUTHB",
        "KVBANK",
        "TMBBNK",
        "CSBBNK",
        // Small Finance Banks
        "AUSFBL",
        "UJJIVN",
        "EQUITB",
        "JANSML",
        "SURYOD",
        // Fintech / Payments / NBFC
        "PAYTMB", "PYTMBN",
        "PHONPE",
        "BAJFIN", "BAJFSV",
        "HDBFIN",
        "MUTHFT",
        "CREDAP",
        "GROWWI",
        "ZERODH",
        "RZRPAY",
        "CASHFR",
        "AMZNIN"
    )

    private val shortUrlDomains = listOf(
        "bit.ly", "tinyurl.com", "goo.gl", "t.co", "ow.ly",
        "is.gd", "buff.ly", "short.io", "rb.gy", "cutt.ly", "tiny.cc", "snip.ly"
    )

    private val otpPattern = Regex(
        """\b(otp|one.?time.?(password|code|pin)|verification\s+code|auth.?code)\b""",
        RegexOption.IGNORE_CASE
    )
    private val digitCode = Regex("""\b\d{4,8}\b""")

    private val urgencyKeywords = listOf(
        "urgent", "immediately", "suspended", "blocked", "action required",
        "your account will be", "click now", "verify now", "limited time",
        "expire", "final notice", "legal action", "act now", "last chance",
        "warning:", "alert:", "fraud alert",
        // Hindi
        "तुरंत", "अभी करें", "खाता बंद हो जाएगा", "तत्काल", "अंतिम नोटिस",
        "कानूनी कार्रवाई", "जुर्माना", "चेतावनी:", "सुरक्षा अलर्ट", "खाता लॉक",
        "संदिग्ध गतिविधि", "धोखाधड़ी अलर्ट", "गिरफ्तार", "अंतिम मौका",
        // Tamil
        "அவசரம்", "உடனே", "உங்கள் கணக்கு நிறுத்தப்படும்", "இறுதி அறிவிப்பு",
        "சட்ட நடவடிக்கை", "எச்சரிக்கை:", "மோசடி எச்சரிக்கை", "கணக்கு பூட்டப்பட்டது",
        "பாதுகாப்பு எச்சரிக்கை", "சந்தேகமான செயல்பாடு", "கடைசி வாய்ப்பு", "உடனடியாக",
        // Bengali
        "জরুরি", "অবিলম্বে", "আপনার অ্যাকাউন্ট বন্ধ হয়ে যাবে", "চূড়ান্ত নোটিশ",
        "আইনি পদক্ষেপ", "সতর্কতা:", "জালিয়াতি সতর্কতা", "অ্যাকাউন্ট লক",
        "নিরাপত্তা সতর্কতা", "সন্দেহজনক কার্যকলাপ", "শেষ সুযোগ"
    )

    private val bankKeywords = listOf(
        "kyc", "pan card", "aadhaar", "aadhar", "bank account", "net banking",
        "credit card", "debit card", "transaction failed", "upi", "paytm",
        "gpay", "phonepay", "neft", "imps", "ifsc", "loan approved", "emi",
        "refund initiated", "cashback",
        // Hindi
        "केवाईसी", "बैंक खाता", "नेट बैंकिंग", "क्रेडिट कार्ड", "डेबिट कार्ड",
        "लेनदेन विफल", "ऋण स्वीकृत", "रिफंड", "एटीएम कार्ड", "बैंक सत्यापन",
        "भुगतान अस्वीकार", "खाता सत्यापन",
        // Tamil
        "வங்கி கணக்கு", "நிகர வங்கி", "கடன் அட்டை", "பற்று அட்டை",
        "பரிவர்த்தனை தோல்வி", "கடன் அனுமதிக்கப்பட்டது", "திரும்ப செலுத்துதல்",
        "ஏடிஎம்", "வங்கி சரிபார்ப்பு", "கணக்கு சரிபார்ப்பு",
        // Bengali
        "কেওয়াইসি", "ব্যাংক অ্যাকাউন্ট", "নেট ব্যাংকিং", "ক্রেডিট কার্ড", "ডেবিট কার্ড",
        "লেনদেন ব্যর্থ", "ঋণ অনুমোদিত", "রিফান্ড", "এটিএম কার্ড",
        "ব্যাংক যাচাই", "অ্যাকাউন্ট যাচাই"
    )

    /**
     * Returns true if the message looks high-risk so we should notify the user
     * when the app is not running (e.g. show notification and open app on tap).
     *
     * @param trustedSenders Set of normalized sender strings that bypass all checks.
     */
    fun looksHighRisk(
        sender: String,
        body: String,
        trustedSenders: Set<String> = emptySet()
    ): Boolean {
        if (trustedSenders.contains(normalizeSender(sender))) return false
        if (isTrustedDltSender(sender)) return false

        val lower = body.lowercase()
        var score = 0

        if (shortUrlDomains.any { lower.contains(it) } || Regex("""https?://[^\s]{5,35}\b""").containsMatchIn(lower)) score += 2
        if (otpPattern.containsMatchIn(body) || digitCode.containsMatchIn(body)) score += 2
        if (urgencyKeywords.any { lower.contains(it) }) score += 1
        if (bankKeywords.any { lower.contains(it) }) score += 1

        // When app is killed we show notification for any red flag (score >= 1)
        return score >= 1
    }

    /**
     * Returns true when [sender] is a TRAI DLT-registered header.
     * Matches on the entity-code suffix (e.g. "AD-SBIBNK" → "SBIBNK").
     */
    private fun isTrustedDltSender(sender: String): Boolean {
        val upper = sender.uppercase().trim()
        if (upper.length > 3 && upper[2] == '-') {
            val entityCode = upper.substring(3)
            if (trustedDltSuffixes.contains(entityCode)) return true
        }
        return trustedDltSuffixes.contains(upper)
    }

    /**
     * Mirrors the Dart normalizeSender() logic in sender_utils.dart.
     * Phone numbers: keep only digits and leading +.
     * Alphanumeric sender IDs: lowercase and trim.
     */
    private fun normalizeSender(sender: String): String {
        val trimmed = sender.trim()
        return if (Regex("""^[\+\d\s\-\(\)]{6,}$""").matches(trimmed)) {
            trimmed.replace(Regex("""[^\d+]"""), "")
        } else {
            trimmed.lowercase()
        }
    }
}
