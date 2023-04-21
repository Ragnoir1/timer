import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/data/colors.dart';
import 'package:timer/app/data/navigator.dart';
import 'package:timer/app/widgets/custom_appbar.dart';
import 'package:timer/app/widgets/space_around.dart';
import 'package:timer/app/widgets/timer_button.dart';
import 'package:timer/main.dart';

import '../controllers/timer_controller.dart';

part 'achievements_screen.dart';
part 'settings_screen.dart';

class TimerView extends GetView<TimerController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SpaceAround(
        appBar: PreferredSize(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 70 + MediaQuery.of(context).padding.top,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      buildAchievements(context);
                    },
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 60,
                    ),
                  ).paddingOnly(left: 16),
                  InkWell(
                    onTap: () {
                      buildSettings(context);
                    },
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 60,
                    ),
                  ).paddingOnly(right: 16),
                ],
              ),
            ),
            preferredSize: Size(Get.width, 160)),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                controller.dataUsed.value?.label != null
                    ? controller.timerLabel(controller.dataUsed.value!.type)
                    : "",
                style: textStyle(48),
              ).paddingOnly(top: 160),
              Text(
                controller.dataUsed.value?.label != null
                    ? controller.dataUsed.value!.label!
                    : "",
                textAlign: TextAlign.center,
                style: textStyle(22),
              ),
              TimerButton().paddingOnly(top: 90),
              Visibility(
                child: Text(
                  "Старт",
                  style: textStyle(40),
                ).paddingOnly(top: 20),
                visible: controller.dataUsed.value?.label != null &&
                    (TimerController.to.time.value == 0),
              ),
              Visibility(
                child: Text(
                  "Выберите занятие",
                  style: textStyle(20),
                ),
                visible: controller.dataUsed.value?.label == null,
              ),
              if (controller.time.value == 0)
                Visibility(
                  child: Text(
                    "Отключите интернет",
                    style: textStyle(20),
                  ),
                  visible: controller.dataUsed.value?.label != null &&
                      controller.dataUsed.value?.internet == false &&
                      isDeviceConnected.value == true,
                ).paddingOnly(top: 20),
              Visibility(
                  child: Text(
                    "Таймер отключиться\n через 60 мин",
                    textAlign: TextAlign.center,
                    style: textStyle(20),
                  ),
                  visible: controller.isVisible),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle textStyle(double fontSize) {
  return TextStyle(fontSize: fontSize, color: AppColors.textColor, shadows: [
    Shadow(offset: Offset(0, 2), color: Color.fromARGB(80, 0, 0, 0))
  ]);
}
