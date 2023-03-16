import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/timer_controller.dart';

class TimerView extends GetView<TimerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Obx(
          () => InkWell(
            onTap: () {
              if (controller.timer?.isActive ?? false) {
                controller.timer?.cancel();
              } else {
                controller.timerFunc();
              }
              // controller.timerOn.value = !controller.timerOn.value;
            },
            child: Text(
              controller.time.value.toString(),
              style: TextStyle(fontSize: 36),
            ),
          ),
        ),
        color: Colors.red,
      ),
    );
  }
}
