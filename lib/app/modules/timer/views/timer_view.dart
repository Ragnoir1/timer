import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/widgets/space_around.dart';

import '../controllers/timer_controller.dart';

class TimerView extends GetView<TimerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SpaceAround(
      colors: [Color(0xFF1f1f1f), Color(0xFF45455a)],
      child: Container(
        alignment: Alignment.center,
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                controller.dataUsed.value.label != null
                    ? controller.dataUsed.value.label!
                    : "",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              SizedBox(
                height: 120,
              ),
              MaterialButton(
                color: Color.fromARGB(255, 202, 207, 211),
                shape: CircleBorder(),
                padding: EdgeInsets.all(100),
                onPressed: () {
                  if (controller.timer?.isActive ?? false) {
                    controller.dataUsed.value.time =
                        controller.dataUsed.value.time + controller.time.value;
                    controller.timer?.cancel();
                    controller.time.value = 0;
                    print(
                        "${controller.dataUsed.value.label}: ${controller.dataUsed.value.time}");
                  } else {
                    controller.timerFunc();
                  }
                },
                child: Text(
                  "${(controller.time.value ~/ 60).toString().padLeft(2, "0")}:${(controller.time.value % 60).toString().padLeft(2, "0")}",
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Visibility(
                child: Text(
                  controller.dataUsed.value.label == null
                      ? "Выберите занятие"
                      : "",
                  style: TextStyle(color: Colors.white),
                ),
                visible: controller.dataUsed.value.label == null,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
