import 'package:flutter/material.dart';

class Language extends ChangeNotifier {
  get locale => _locale;

  Locale _locale = const Locale('zh');

  setLocal(Locale newLocale) {
    _locale = newLocale;
    super.notifyListeners();
  }
}
