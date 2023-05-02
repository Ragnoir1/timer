import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timer/app/data/colors.dart';
import 'package:timer/app/data/images.dart';
import 'package:timer/app/modules/timer/controllers/timer_controller.dart';
import 'package:timer/app/routes/app_pages.dart';
import 'package:timer/app/widgets/custom_appbar.dart';
import 'package:timer/app/widgets/language_button.dart';
import 'package:timer/app/widgets/space_around.dart';

class LanguageController extends GetxController {
  //TODO: Implement LanguageController

  final count = 0.obs;
  @override
  void onInit() {
    print("Хавно");
    super.onInit();
  }

  @override
  void onReady() {
    final defaultLanguage = TimerController.to.getLanguage();
    print(defaultLanguage);
    defaultLanguage == null
        ? Get.to(Builder(
            builder: (context) => SpaceAround(
              appBar: CustomAppBar(
                size: MediaQuery.of(context).size.height * 0.2,
                bottom: Text(
                  'choose your languege'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LanguageButton(
                    flag: russian,
                    language: "Русский",
                    locale: 'ru',
                    customFunction: () {
                      Get.updateLocale(Locale("ru"));
                      TimerController.to.saveLanguage("ru");
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  LanguageButton(
                    flag: british,
                    language: "English",
                    locale: 'en',
                    customFunction: () {
                      Get.updateLocale(Locale("en"));
                      TimerController.to.saveLanguage("en");
                      Get.toNamed(Routes.HOME);
                    },
                  ).paddingOnly(top: 30)
                ],
              ),
            ),
          ))
        : Get.toNamed(Routes.HOME);
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
