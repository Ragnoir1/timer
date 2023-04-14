import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:dartx/dartx.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/data/navigator.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';
import 'package:timer/app/widgets/custom_appbar.dart';
import 'package:timer/app/widgets/paint/roud_button_category_paint.dart';
import 'package:timer/app/widgets/paint/statistic_single_time_paint.dart';
import 'package:timer/app/widgets/space_around.dart';
import 'package:timer/app/widgets/statistic_all_time_widget.dart';
import 'package:timer/app/widgets/statistic_single_time_widget.dart';
import 'package:timer/app/widgets/statistics_banner.dart';

import '../controllers/statistics_controller.dart';

part 'statistics_screen.dart';

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
                    list: CategoriesController.to.listJob.value,
                    onTap: () => buildStatistic(
                        context, CategoriesController.to.listJob),
                  ).paddingOnly(top: 60),
                  StatisticsBanner(
                    text: "Спорт",
                    colors: [Color(0xFF007ec4), Color(0xFF90fdf1)],
                    list: CategoriesController.to.listSport.value,
                    onTap: () => buildStatistic(
                        context, CategoriesController.to.listSport),
                  ).paddingOnly(top: 60),
                  StatisticsBanner(
                    text: "Хобби",
                    colors: [Color(0xFF169601), Color(0xFFbbfd81)],
                    list: CategoriesController.to.listHobby.value,
                    onTap: () => buildStatistic(
                        context, CategoriesController.to.listHobby),
                  ).paddingOnly(top: 60),
                  StatisticsBanner(
                    text: "Учеба",
                    colors: [Color(0xFFff7b01), Color(0xFFffc454)],
                    list: CategoriesController.to.listEducation.value,
                    onTap: () => buildStatistic(
                        context, CategoriesController.to.listEducation),
                  ).paddingOnly(top: 60)
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
          ),
    );
  }
}
