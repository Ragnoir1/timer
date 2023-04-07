import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';
import 'package:timer/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:timer/app/widgets/space_around.dart';
import 'package:timer/app/widgets/timer_button.dart';
import 'package:timer/main.dart';

import '../controllers/timer_controller.dart';

class TimerView extends GetView<TimerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpaceAround(
        colors: const [Color(0xFF1f1f1f), Color(0xFF45455a)],
        child: Container(
          alignment: Alignment.center,
          child: Obx(
            () => Column(
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
                ).paddingOnly(top: 80),
                TimerButton().paddingOnly(top: 120),
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
      ),
    );
  }
}
