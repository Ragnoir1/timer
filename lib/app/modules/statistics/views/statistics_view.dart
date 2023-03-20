import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/widgets/space_around.dart';
import 'package:timer/app/widgets/statistics_banner.dart';

import '../controllers/statistics_controller.dart';

class StatisticsView extends GetView<StatisticsController> {
  @override
  Widget build(BuildContext context) {
    return SpaceAround(
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
            "Статистика",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          Obx(
            () => Container(
              height: 450,
              child: ListView.separated(
                itemCount: controller.ollLists.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: ((context, index) => StatisticsBanner(
                      text: controller.ollLists[index].label,
                      time:
                          "${(controller.ollLists[index].time ~/ 60).toString().padLeft(2, "0")}:${(controller.ollLists[index].time % 60).toString().padLeft(2, "0")}",
                    ).paddingSymmetric(horizontal: 16)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
