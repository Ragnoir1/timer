import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:timer/app/widgets/space_around.dart';
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
                  controller.dataUsed.value.label != null
                      ? controller.dataUsed.value.label!
                      : "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ).paddingOnly(top: 80),
                MaterialButton(
                  color: const Color.fromARGB(255, 202, 207, 211),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(100),
                  onPressed: () {
                    if (controller.dataUsed.value.label == null) {
                    } else {
                      if (controller.dataUsed.value.internet == false &&
                          isDeviceConnected.value == true) {
                      } else {
                        if (controller.timer?.isActive ?? false) {
                          controller.dataUsed.value.time +=
                              controller.time.value;
                          controller.timer?.cancel();
                          controller.time.value = 0;
                          StatisticsController.to.refresh();
                        } else {
                          controller.timerFunc();
                        }
                      }
                    }
                  },
                  child: Text(
                    "${(controller.time.value ~/ 60).toString().padLeft(2, "0")}:${(controller.time.value % 60).toString().padLeft(2, "0")}",
                    style: const TextStyle(fontSize: 36),
                  ),
                ).paddingOnly(top: 120),
                if (controller.dataUsed.value.label != null)
                  Text(
                    controller.dataUsed.value.internet == false &&
                            isDeviceConnected.value == true
                        ? "Отключите интернет"
                        : "",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                Visibility(
                  child: Text(
                    controller.dataUsed.value.label == null
                        ? "Выберите занятие"
                        : "",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  visible: controller.dataUsed.value.label == null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
