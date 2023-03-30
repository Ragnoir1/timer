import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:timer/app/widgets/roud_button_category_paint.dart';
import 'package:timer/app/widgets/space_around.dart';
import 'package:timer/app/widgets/statistics_banner.dart';

import '../controllers/statistics_controller.dart';

class StatisticsView extends GetView<StatisticsController> {
  @override
  Widget build(BuildContext context) {
    return SpaceAround(
        isTransparentAppBar: true,
        appBar: PreferredSize(
            child: Container(
                alignment: Alignment.bottomCenter,
                height: 60 + MediaQuery.of(context).padding.top,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: [
                      Color.fromARGB(255, 75, 75, 75),
                      Color.fromARGB(189, 46, 46, 46)
                    ],
                    stops: [0, 1],
                  ),
                ),
                child: Text(
                  "Статистика",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
            preferredSize: Size(Get.width, 160)),
        child: Obx(
          () => ListView(children: [
            SizedBox(
              height: 16,
            ),
            ...controller.ollLists
                .map((e) => e.list.isNotEmpty
                    ? StickyHeader(
                        header: Container(
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.red),
                          child: Text(e.name),
                        ),
                        content: Column(
                          children: [
                            ...e.list
                                .map((job) => StatisticsBanner(
                                      text: job.label!,
                                      time:
                                          "${(job.time ~/ 60).toString().padLeft(2, "0")}:${(job.time % 60).toString().padLeft(2, "0")}",
                                    ).paddingSymmetric(
                                        horizontal: 16, vertical: 10))
                                .toList()
                          ],
                        ))
                    : SizedBox())
                .toList(),
          ]),
        ));
  }
}
