import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/data/colors.dart';
import 'package:timer/app/data/images.dart';
import 'package:timer/app/data/navigator.dart';
import 'package:timer/app/widgets/custom_appbar.dart';
import 'package:timer/app/widgets/language_button.dart';
import 'package:timer/app/widgets/space_around.dart';
import 'package:timer/app/widgets/timer_button.dart';
import 'package:timer/main.dart';

import '../controllers/timer_controller.dart';

part 'achievements_screen.dart';
part 'settings_screen.dart';
part 'language_screen.dart';

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
          height: 600,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    controller.dataUsed.value?.label != null
                        ? controller.timerLabel(controller.dataUsed.value!.type)
                        : "",
                    style: textStyle(48),
                  ),
                  Text(
                    controller.dataUsed.value?.label != null
                        ? controller.dataUsed.value!.label!
                        : "",
                    textAlign: TextAlign.center,
                    style: textStyle(22),
                  ),
                ],
              ),
              TimerButton(),
              Column(
                children: [
                  Text(
                    controller.dataUsed.value?.label != null &&
                            (TimerController.to.time.value == 0)
                        ? 'start'.tr
                        : "",
                    style: textStyle(40),
                  ),
                  Text(
                    controller.dataUsed.value?.label == null
                        ? 'choose an activity'.tr
                        : "",
                    style: textStyle(20),
                  ),
                  Text(
                    controller.dataUsed.value?.label != null &&
                            controller.dataUsed.value?.internet == false &&
                            isDeviceConnected.value == true &&
                            controller.time.value == 0
                        ? 'turn_off_internet'.tr
                        : "",
                    style: textStyle(20),
                  ).paddingOnly(top: 20),
                  Text(
                    controller.isVisible
                        ? 'timer_will_turn_off_after_60_minutes'.tr
                        : "\n",
                    textAlign: TextAlign.center,
                    style: textStyle(20),
                  ),
                ],
              ),
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

CustomAppBar _appBar(String text, BuildContext context) {
  return CustomAppBar(
    size: MediaQuery.of(context).size.height * 0.3,
    bottom: Text(
      text,
      style: TextStyle(
        fontSize: 40,
        color: AppColors.textColor,
      ),
    ),
  );
}
