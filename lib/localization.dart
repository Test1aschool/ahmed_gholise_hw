import 'package:flutter/material.dart';

class Localization {
  static Map<String, Map<String, String>> localizedValues = {
    'ar': {
      'login': 'تسجيل الدخول',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'confirm': 'تأكيد',
      'home': 'الصفحة الرئيسية',
      'welcome': 'مرحبًا بك',
      'change_language': 'تغيير اللغة',
      'to_english': 'تغيير اللغة إلى الإنجليزية',
      'to_arabic': 'تغيير اللغة إلى العربية',
    },
    'en': {
      'login': 'Login',
      'email': 'Email',
      'password': 'Password',
      'confirm': 'Confirm',
      'home': 'Home',
      'welcome': 'Welcome',
      'change_language': 'Change Language',
      'to_english': 'Change Language to English',
      'to_arabic': 'Change Language to Arabic',
    },
  };

  static String getTranslation(String key, String langCode) {
    return localizedValues[langCode]?[key] ?? key;
  }
}