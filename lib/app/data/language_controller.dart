import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/locales.g.dart';
import 'language_cache.dart';

class AppStrings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;
}

class LanguagesController extends GetxController {
  final LanguagesAppController appLanguage = Get.find<LanguagesAppController>();
  String? get currentLanguage => Get.find<LanguagesAppController>().getCache();

  


  setLanguage(String key) {
    Get.updateLocale(Locale(key));
    appLanguage.setCache(key);
  }
}

class LanguagesAppController extends GetxController {
  final LanguageCacheDataSource cache;
  LanguagesAppController({required this.cache});

  Future<void> setCache(String? value) async {
    if (value != null) return cache.setData(value);
  }

  String? getCache() {
    final data = cache.getData();
    return data;
  }

  @override
  void onInit() {
    if (getCache() == null) checkDevice();
    super.onInit();
  }

  void checkDevice() {
    if (Get.deviceLocale!.toString() == 'en_EN')
      setCache('en_EN');
    else
      setCache('ru_RU');
  }
  // final ReadWriteValue<String?> language = 'ru_RU'.val('language');
}