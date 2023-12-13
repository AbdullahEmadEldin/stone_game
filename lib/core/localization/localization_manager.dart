import 'package:flutter/material.dart';

class LocalizationManager with ChangeNotifier {
  Locale _appLanguage = Locale('en');
  get appLanguage => _appLanguage;
  changeLanguage(String locale) {
    _appLanguage = locale == 'en' ? const Locale('en') : const Locale('ar');
    notifyListeners();
  }
}
