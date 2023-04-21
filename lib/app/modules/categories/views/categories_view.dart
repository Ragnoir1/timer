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

import '../controllers/categories_controller.dart';
part 'work_screens.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpaceAround(
        child: Column(
          children: [
             Text(
              'Чему вы хотите\n уделить время?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, color: AppColors.textColor, shadows: [
                Shadow(offset: Offset(0, 2), color: Color.fromARGB(80, 0, 0, 0))
              ]),
            ).paddingOnly(top: 80),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 25.0.fromFigmaHeight(),
              spacing: 25.0.fromFigmaWidth(),
              children: [
                RoundButtonCategoryWidget(
                  image: job_image,
                  mainText: "Работа",
                  secondaryText: "Как там с\n деньгами",
                  onTap: () {
                    work(context, controller.listJob, JobType.job);
                  },
                ),
                RoundButtonCategoryWidget(
                  image: sport_image,
                  mainText: "Спорт",
                  secondaryText: "Зарядись\n энергией",
                  onTap: () {
                    work(context, controller.listSport, JobType.sport);
                  },
                ),
                RoundButtonCategoryWidget(
                  image: hobby_image,
                  mainText: "Хобби",
                  secondaryText: "Лучше любого\n отдыха",
                  onTap: () {
                    work(context, controller.listHobby, JobType.hobby);
                  },
                ),
                RoundButtonCategoryWidget(
                  image: education_image,
                  mainText: "Учеба",
                  secondaryText: "Не теряй свое\n время",
                  onTap: () {
                    work(context, controller.listEducation, JobType.education);
                  },
                ),
              ],
            ).paddingOnly(top: 135, left: 16, right: 16),
          ],
        ),
      ),
    );
  }

  work(BuildContext context, List<DataJob> list, JobType type) {
    return BarNavigator.pushNewScreen(
        context, buildListWork(list, controller, type));
  }
}
