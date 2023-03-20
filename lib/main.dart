import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';

import 'app/modules/timer/controllers/timer_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(TimerController());
  Get.put(CategoriesController());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
