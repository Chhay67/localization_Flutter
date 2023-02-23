import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagesProvider with ChangeNotifier {
  LanguagesProvider() {
    fetchTranslation();
  }

  Locale localeLanguage = const Locale('en'); // set your default language
  Locale get getLocaleLang => localeLanguage;

  Map<String, dynamic> _translation = {}; // to be translate value
  Map<String, dynamic> _selectedTranslation = {};

  //getter and setter for changing language
  Map<String, dynamic> get translations => _selectedTranslation;
  set translations(Map<String, dynamic> map) {
    _selectedTranslation = map;
    notifyListeners();
  }
  Future<void> fetchTranslation({language}) async {
    try {
      language = await getLanguagePreference();
      final resp = await rootBundle.loadString(
          'assets/languages/languages.json'); // load data from json file
      final Map<String, dynamic> decoded = json.decode(resp);
      _selectedTranslation = decoded[language ?? 'en'];
      _translation = decoded;
      notifyListeners(); // to do change language real time
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<String> getLanguagePreference() async {
    final sharePreference = await SharedPreferences.getInstance();
    String? language = sharePreference.getString('locale');

    localeLanguage =
        Locale(language ?? 'en'); // get default language is Lao language
    return localeLanguage.languageCode;
  }

  //to change new language function and store the value
  Future<void> setLanguagePreference(String lang) async {
    final sharePreference = await SharedPreferences.getInstance();
    sharePreference.setString('locale', lang);
  }


  //todo change language function
  void changeLanguage(Locale lang) {
    localeLanguage = lang;
    _selectedTranslation = {}; //to clear selected language
    _selectedTranslation = _translation[lang.languageCode]; //to set new locale
    setLanguagePreference(lang.languageCode);
    notifyListeners();
  }
}
