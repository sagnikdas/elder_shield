/// Normalizes a sender string for whitelist comparison.
///
/// Phone numbers: strip formatting, keep digits and leading +.
/// Alphanumeric sender IDs (e.g. "ICICI", "HDFCBK"): lowercase and trim.
String normalizeSender(String sender) {
  final trimmed = sender.trim();
  // Looks like a phone number if it only contains digits, +, spaces, dashes, parens.
  if (RegExp(r'^[\+\d\s\-\(\)]{6,}$').hasMatch(trimmed)) {
    return trimmed.replaceAll(RegExp(r'[^\d+]'), '');
  }
  return trimmed.toLowerCase();
}
