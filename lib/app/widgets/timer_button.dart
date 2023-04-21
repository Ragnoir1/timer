import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/app/data/colors.dart';
import 'package:timer/app/data/images.dart';
import 'package:timer/app/modules/timer/controllers/timer_controller.dart';
import 'package:timer/extension/size_from_figma.dart';

import 'gradient_widget.dart';

class TimerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          if (TimerController.to.dataUsed.value?.label == null) {
          } else {
            if (TimerController.to.timer?.isActive ?? false) {
              TimerController.to.stopTimer();
            } else {
              TimerController.to.hideMessage();
              TimerController.to.timerFunc();
            }
          }
        },
        child: Container(
          height: 210.0.fromFigmaHeight(),
          width: 210.0.fromFigmaWidth(),
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                offset: Offset(0, 2),
                color: Colors.black.withOpacity(0.25))
          ]),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Картинка для будущей анимации

                  // Visibility(
                  //   visible: false,
                  //   child: Image(
                  //     image: hourglass,
                  //     height: 110,
                  //   ),
                  // ),
                  Visibility(
                    visible: true,
                    child: Text(
                      _showTime(),
                      style:
                          TextStyle(fontSize: 36, color: AppColors.textColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String _showTime() {
  return "${(TimerController.to.time.value ~/ 60).toString().padLeft(2, "0")}:${(TimerController.to.time.value % 60).toString().padLeft(2, "0")}";
}
