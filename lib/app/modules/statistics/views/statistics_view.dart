import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:timer/app/widgets/roud_button_category.dart';
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
          Obx(() => Column(
                children: [
                  Container(
                    height: 450,
                    child: ListView(children: [
                      ...controller.ollLists
                          .map((e) => e.list.isNotEmpty
                              ? StickyHeader(
                                  header: Container(
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration:
                                        BoxDecoration(color: Colors.red),
                                    child: Text(e.name),
                                  ),
                                  content: Column(
                                    children: [
                                      ...e.list
                                          .map((job) => StatisticsBanner(
                                                text: job.label,
                                                time:
                                                    "${(job.time ~/ 60).toString().padLeft(2, "0")}:${(job.time % 60).toString().padLeft(2, "0")}",
                                              ).paddingSymmetric(
                                                  horizontal: 16, vertical: 10))
                                          .toList()
                                    ],
                                  ))
                              : SizedBox())
                          .toList(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.red)),
                            child: CustomPaint(
                              painter: RoundButtonCategory(),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.red)),
                            child: CustomPaint(
                              painter: RoundButtonCategory(),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
