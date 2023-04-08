import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';
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
                height: 98 + MediaQuery.of(context).padding.top,
                decoration: BoxDecoration(),
                child: Text(
                  "Статистика",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
            preferredSize: Size(Get.width, 160)),
        child: Obx(() => Column(
                  children: [
                    StatisticsBanner(
                            text: "Работа",
                            colors: [Color(0xFF9847ff), Color(0xFFd4b3ff)],
                            time: controller
                                .sumOfTime(CategoriesController.to.listJob))
                        .paddingOnly(top: 60),
                    StatisticsBanner(
                            text: "Спорт",
                            colors: [Color(0xFF007ec4), Color(0xFF90fdf1)],
                            time: controller
                                .sumOfTime(CategoriesController.to.listSport))
                        .paddingOnly(top: 60),
                    StatisticsBanner(
                            text: "Хобби",
                            colors: [Color(0xFF169601), Color(0xFFbbfd81)],
                            time: controller
                                .sumOfTime(CategoriesController.to.listHobby))
                        .paddingOnly(top: 60),
                    StatisticsBanner(
                            text: "Учеба",
                            colors: [Color(0xFFff7b01), Color(0xFFffc454)],
                            time: controller.sumOfTime(
                                CategoriesController.to.listEducation))
                        .paddingOnly(top: 60)
                  ],
                ).paddingOnly(top: 180)

            //  ListView(children: [
            //   SizedBox(
            //     height: 16,
            //   ),
            //   ...controller.ollLists
            //       .map((e) => e.list.isNotEmpty
            //           ? StickyHeader(
            //               header: Container(
            //                 height: 20,
            //                 alignment: Alignment.center,
            //                 decoration: BoxDecoration(color: Colors.red),
            //                 child: Text(e.name),
            //               ),
            //               content: Column(
            //                 children: [
            //                   ...e.list
            //                       .map((job) => StatisticsBanner(
            //                             text: job.label!,
            //                             time:
            //                                 "${(job.time ~/ 60).toString().padLeft(2, "0")}:${(job.time % 60).toString().padLeft(2, "0")}",
            //                           ).paddingSymmetric(
            //                               horizontal: 16, vertical: 10))
            //                       .toList()
            //                 ],
            //               ))
            //           : SizedBox())
            //       .toList(),
            // ]),
            ));
  }
}
