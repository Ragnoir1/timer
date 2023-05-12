import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/data/colors.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/data/images.dart';
import 'package:timer/app/data/navigator.dart';
import 'package:timer/app/modules/categories/controllers/cash_mixin.dart';
import 'package:timer/app/modules/home/controllers/home_controller.dart';
import 'package:timer/app/modules/timer/controllers/timer_controller.dart';
import 'package:timer/app/widgets/card_category.dart';
import 'package:timer/app/widgets/custom_appbar.dart';
import 'package:timer/app/widgets/custom_textfield.dart';
import 'package:timer/app/widgets/roud_button_category_widget.dart';
import 'package:timer/app/widgets/simple_button.dart';
import 'package:timer/app/widgets/space_around.dart';
import 'package:timer/extension/size_from_figma.dart';
import 'package:timer/generated/locales.g.dart';

import '../controllers/categories_controller.dart';
part 'work_screens.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return SpaceAround(
      appBar: _appBar(context, LocaleKeys.categories_header.tr),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 25.0.fromFigmaHeight(),
        spacing: 25.0.fromFigmaWidth(),
        children: [
          RoundButtonCategoryWidget(
            image: job_image,
            mainText: LocaleKeys.work.tr,
            secondaryText: LocaleKeys.make_money.tr,
            onTap: () {
              work(context, controller.listJob, JobType.job);
            },
          ),
          RoundButtonCategoryWidget(
            image: sport_image,
            mainText: LocaleKeys.sport.tr,
            secondaryText: LocaleKeys.recharge_your_batteries.tr,
            onTap: () {
              work(context, controller.listSport, JobType.sport);
            },
          ),
          RoundButtonCategoryWidget(
            image: hobby_image,
            mainText: LocaleKeys.hobby.tr,
            secondaryText: LocaleKeys.better_than_any_rest.tr,
            onTap: () {
              work(context, controller.listHobby, JobType.hobby);
            },
          ),
          RoundButtonCategoryWidget(
            image: education_image,
            mainText: LocaleKeys.education.tr,
            secondaryText: LocaleKeys.dont_waste_your_time.tr,
            onTap: () {
              work(context, controller.listEducation, JobType.education);
            },
          ),
        ],
      ).paddingOnly(top: 135, left: 16, right: 16),
    );
  }

  work(BuildContext context, List<DataJob> list, JobType type) {
    return BarNavigator.pushNewScreen(
        context, buildListWork(list, controller, type));
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
