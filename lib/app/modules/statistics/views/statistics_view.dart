import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:dartx/dartx.dart';
import 'package:timer/app/data/colors.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/data/navigator.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';
import 'package:timer/app/widgets/custom_appbar.dart';
import 'package:timer/app/widgets/space_around.dart';
import 'package:timer/app/widgets/statistic_all_time_widget.dart';
import 'package:timer/app/widgets/statistic_single_time_widget.dart';
import 'package:timer/app/widgets/statistics_banner.dart';
import 'package:timer/generated/locales.g.dart';

import '../controllers/statistics_controller.dart';

part 'statistics_screen.dart';

class StatisticsView extends GetView<StatisticsController> {
  @override
  Widget build(BuildContext context) {
    return SpaceAround(
      appBar: _appBar(context, 'statistic_header'.tr),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatisticsBanner(
              text: LocaleKeys.work.tr,
              colors: [Color(0xFF9847ff), Color(0xFFd4b3ff)],
              list: CategoriesController.to.listJob.value,
              onTap: () => buildStatistic(
                  context, CategoriesController.to.listJob, LocaleKeys.work.tr),
            ),
            StatisticsBanner(
              text: LocaleKeys.sport.tr,
              colors: [Color(0xFF007ec4), Color(0xFF90fdf1)],
              list: CategoriesController.to.listSport.value,
              onTap: () => buildStatistic(context,
                  CategoriesController.to.listSport, LocaleKeys.sport.tr),
            ).paddingOnly(top: 30),
            StatisticsBanner(
              text: LocaleKeys.hobby.tr,
              colors: [Color(0xFF169601), Color(0xFFbbfd81)],
              list: CategoriesController.to.listHobby.value,
              onTap: () => buildStatistic(context,
                  CategoriesController.to.listHobby, LocaleKeys.hobby.tr),
            ).paddingOnly(top: 30),
            StatisticsBanner(
              text: LocaleKeys.education.tr,
              colors: [Color(0xFFff7b01), Color(0xFFffc454)],
              list: CategoriesController.to.listEducation.value,
              onTap: () => buildStatistic(
                  context,
                  CategoriesController.to.listEducation,
                  LocaleKeys.education.tr),
            ).paddingOnly(top: 30)
          ],
        ),
      ),
    );
  }
}

CustomAppBar _appBar(BuildContext context, String text) {
  return CustomAppBar(
    size: MediaQuery.of(context).size.height * 0.2,
    title: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
        shadows: [
          Shadow(
            offset: Offset(0, 2),
            color: Color.fromARGB(80, 0, 0, 0),
          )
        ],
      ),
    ),
  );
}
