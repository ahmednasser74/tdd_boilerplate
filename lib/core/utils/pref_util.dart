import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

const String prefUserLogin = "pref_user_login";
const String prefLanguage = 'pref_language';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  SharedPreferences? prefs;

  SharedPrefs._internal();

  bool initialized = false;

  static SharedPrefs get instance => _instance;

  Future<SharedPrefs> init() async {
    final Completer<SharedPrefs> completer = Completer<SharedPrefs>();
    if (initialized) {
      completer.complete(_instance);
    } else {
      prefs = await SharedPreferences.getInstance();
      initialized = true;
      completer.complete(_instance);
    }
    return completer.future;
  }

  saveLanguage(String language) {
    prefs?.setString(prefLanguage, language);
  }


  String getLanguageSelected() {
    return prefs?.getString(prefLanguage) ?? 'en';
  }
}
