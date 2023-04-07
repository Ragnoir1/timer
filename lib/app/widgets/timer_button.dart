import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/app/modules/timer/controllers/timer_controller.dart';
import 'package:timer/extension/size_from_figma.dart';
import 'package:timer/main.dart';

import '../modules/statistics/controllers/statistics_controller.dart';
import 'gradient_widget.dart';

class TimerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          if (TimerController.to.dataUsed.value?.label == null) {
          } else {
            if (TimerController.to.dataUsed.value?.internet == false &&
                isDeviceConnected.value == true) {
            } else {
              if (TimerController.to.timer?.isActive ?? false) {
                TimerController.to.dataUsed.value?.time +=
                    TimerController.to.time.value;
                TimerController.to.timer?.cancel();
                TimerController.to.time.value = 0;
                TimerController.to.saveAll();

                StatisticsController.to.refresh();
              } else {
                TimerController.to.timerFunc();
              }
            }
          }
        },
        child: Container(
          height: 210.0.fromFigmaHeight(),
          width: 210.0.fromFigmaWidth(),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 202, 207, 211),
              shape: BoxShape.circle),
          child: AnimateGradient(
            shape: BoxShape.circle,
            duration: Duration(seconds: 10),
            primaryBegin: Alignment.topLeft,
            primaryEnd: Alignment.bottomLeft,
            secondaryBegin: Alignment.bottomLeft,
            secondaryEnd: Alignment.topRight,
            primaryColors: [
              Color(0xFFF7464e1),
              Color(0xFFce40ba),
            ],
            secondaryColors: [
              Color(0xFFce40ba),
              Color(0xFFF7464e1),
            ],
            child: Center(
              child: Text(
                "${(TimerController.to.time.value ~/ 60).toString().padLeft(2, "0")}:${(TimerController.to.time.value % 60).toString().padLeft(2, "0")}",
                style: const TextStyle(fontSize: 36),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// primaryColors: [Colors.red, Colors.purple],
// secondaryColors: [Colors.blue, Colors.green],