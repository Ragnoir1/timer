import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:dartx/dartx.dart';
import 'package:timer/app/data/colors.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/data/navigator.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';
import 'package:timer/app/modules/timer/controllers/timer_controller.dart';
import 'package:timer/app/widgets/custom_appbar.dart';
import 'package:timer/app/widgets/paint/roud_button_category_paint.dart';
import 'package:timer/app/widgets/paint/statistic_single_time_paint.dart';
import 'package:timer/app/widgets/space_around.dart';
import 'package:timer/app/widgets/statistic_all_time_widget.dart';
import 'package:timer/app/widgets/statistic_single_time_widget.dart';
import 'package:timer/app/widgets/statistics_banner.dart';
import 'package:timer/extension/size_from_figma.dart';

import '../controllers/statistics_controller.dart';

part 'statistics_screen.dart';

class StatisticsView extends GetView<StatisticsController> {
  @override
  Widget build(BuildContext context) {
    return SpaceAround(
      appBar: _appBar(),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   'Статистика',
            //   style:
            //       TextStyle(fontSize: 40, color: AppColors.textColor, shadows: [
            //     Shadow(offset: Offset(0, 2), color: Color.fromARGB(80, 0, 0, 0))
            //   ]),
            // ).paddingOnly(top: 80),
            StatisticsBanner(
              text: "Работа",
              colors: [Color(0xFF9847ff), Color(0xFFd4b3ff)],
              list: CategoriesController.to.listJob.value,
              onTap: () => buildStatistic(
                  context, CategoriesController.to.listJob, "Работа"),
            ),
            StatisticsBanner(
              text: "Спорт",
              colors: [Color(0xFF007ec4), Color(0xFF90fdf1)],
              list: CategoriesController.to.listSport.value,
              onTap: () => buildStatistic(
                  context, CategoriesController.to.listSport, "Спорт"),
            ).paddingOnly(top: 40),
            StatisticsBanner(
              text: "Хобби",
              colors: [Color(0xFF169601), Color(0xFFbbfd81)],
              list: CategoriesController.to.listHobby.value,
              onTap: () => buildStatistic(
                  context, CategoriesController.to.listHobby, "Хобби"),
            ).paddingOnly(top: 40),
            StatisticsBanner(
              text: "Учеба",
              colors: [Color(0xFFff7b01), Color(0xFFffc454)],
              list: CategoriesController.to.listEducation.value,
              onTap: () => buildStatistic(
                  context, CategoriesController.to.listEducation, "Учеба"),
            ).paddingOnly(top: 40)
          ],
        ),

        //
      ),
    );
  }
}

CustomAppBar _appBar() {
  return CustomAppBar(
    size: 200,
    title: Text(
      'Статистика\n',
      style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
          shadows: [
            Shadow(offset: Offset(0, 2), color: Color.fromARGB(80, 0, 0, 0))
          ]),
    ),
  );
}
