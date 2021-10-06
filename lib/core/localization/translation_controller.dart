import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationController extends GetxController {
  var appLocale = 'en';
  @override
  void onInit() async {
    appLocale = await SharedPrefs.instance.getLanguageSelected();
    Get.updateLocale(Locale(appLocale));
    super.onInit();
  }

  void changeLanguage(String type) async {
    if (appLocale == type) return;

    if (type == 'ar') {
      appLocale = 'ar';
      SharedPrefs.instance.saveLanguage('ar');
    } else {
      appLocale = 'en';
      SharedPrefs.instance.saveLanguage('en');
    }
  }
}
