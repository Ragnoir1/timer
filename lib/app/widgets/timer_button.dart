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
                child: Stack(
              alignment: Alignment.center,
              children: [
                // AnimatedContainer(
                //   duration: Duration(milliseconds: 300),
                //   height: 100,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         // color: Colors.white.withOpacity(0),
                //         shape: BoxShape.circle,
                //         border: Border.all(color: Colors.red)),
                //   ),
                // ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: TimerController.to.selected.value == true ? 0 : 1,
                  child: Image(
                    image: hourglass,
                    height: 110,
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: TimerController.to.selected.value == true ? 1 : 0,
                  child: Text(
                    _showTime(),
                    style: TextStyle(fontSize: 36, color: AppColors.textColor),
                  ),
                ),
              ],
            )
                // AnimatedContainer(
                //   duration: Duration(seconds: 1),
                //   curve: Curves.fastOutSlowIn,
                //   color: Colors.red,
                //   height: 110,
                //   width: 110,
                //   child:
                //  Column(
                //   children: [
                //     Visibility(
                //       visible: true,
                //       // TimerController.to.time.value == 0 ? true : false,
                //       child:

                ),
            // Visibility(
            //   visible:
            //       TimerController.to.time.value == 0 ? false : true,
            //   child: Text(
            //     _showTime(),
            //     style:
            //         TextStyle(fontSize: 36, color: AppColors.textColor),
            //   ),
            // ),
            //   ],
            // ),
            // ),
          ),
        ),
        // ),
      ),
    );
  }
}

String _showTime() {
  return "${(TimerController.to.time.value ~/ 60).toString().padLeft(2, "0")}:${(TimerController.to.time.value % 60).toString().padLeft(2, "0")}";
}
