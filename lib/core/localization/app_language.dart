import 'package:flutter/material.dart';

/// Supported app languages.
enum AppLanguage { english, bengali, kannada }

extension AppLanguageX on AppLanguage {
  String get code {
    switch (this) {
      case AppLanguage.english:
        return 'en';
      case AppLanguage.bengali:
        return 'bn';
      case AppLanguage.kannada:
        return 'kn';
    }
  }

  Locale get locale => Locale(code);
}

