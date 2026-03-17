package com.eldershield.elder_shield

/**
 * Lightweight heuristic check for use when the app is killed.
 * Kept in sync with Dart HeuristicDetector where possible.
 * Used only to decide whether to show a "possible scam" notification and open the app.
 */
object SimpleRiskCheck {

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
        "warning:", "alert:", "fraud alert"
    )

    private val bankKeywords = listOf(
        "kyc", "pan card", "aadhaar", "aadhar", "bank account", "net banking",
        "credit card", "debit card", "transaction failed", "upi", "paytm",
        "gpay", "phonepay", "neft", "imps", "ifsc", "loan approved", "emi",
        "refund initiated", "cashback"
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
