import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
        colors: const [Color(0xFF1f1f1f), Color(0xFF45455a)],
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
                      color: Colors.white,
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
                    ? controller.dataUsed.value!.label!
                    : "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ).paddingOnly(top: 130),
              TimerButton().paddingOnly(top: 160),
              if (controller.dataUsed.value?.label != null)
                Text(
                  controller.dataUsed.value?.internet == false &&
                          isDeviceConnected.value == true
                      ? "Отключите интернет"
                      : "",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              Visibility(
                child: Text(
                  controller.dataUsed.value?.label == null
                      ? "Выберите занятие"
                      : "",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                visible: controller.dataUsed.value?.label == null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
