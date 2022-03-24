import 'package:flutter/material.dart';

class Language extends ChangeNotifier {
  Locale locale = const Locale('zh');

  setLocal(Locale newLocale) {
    
    locale = newLocale;
    print(locale);
    print(newLocale);
    super.notifyListeners();
  }
}
