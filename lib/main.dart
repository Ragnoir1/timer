import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timer/app/data/languages.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';
import 'package:timer/app/modules/statistics/controllers/statistics_controller.dart';

import 'app/modules/timer/controllers/timer_controller.dart';
import 'app/routes/app_pages.dart';

final RxBool isDeviceConnected = false.obs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Вертикальная ориентация вверх
  ]);

  await Hive.initFlutter();
  Get.put(TimerController());
  Get.put(CategoriesController());
  Get.put(StatisticsController());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translations: Language(),
      locale: Locale('ru', 'RU'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
        fontFamily: "Rubik",
      ),
    ),
  );
}
