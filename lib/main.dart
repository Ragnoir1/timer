import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timer/app/data/language_cache.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';
import 'package:timer/app/modules/statistics/controllers/statistics_controller.dart';

import 'app/data/language_controller.dart';
import 'app/modules/timer/controllers/timer_controller.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

final RxBool isDeviceConnected = false.obs;
String? defaultLanguage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Вертикальная ориентация вверх
  ]);

  await Hive.initFlutter();
  Get.put(TimerController());
  Get.put(CategoriesController());
  Get.put(StatisticsController());
  await Hive.openBox('testBox');
  defaultLanguage = TimerController.to.getLanguage();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: AppStrings(),
      locale: Locale(Get.put<LanguagesAppController>(
              LanguagesAppController(cache: LanguageCacheDataSource()))
          .getCache()!),
      theme: ThemeData(
        fontFamily: "Rubik",
      ),
    ),
  );
}
