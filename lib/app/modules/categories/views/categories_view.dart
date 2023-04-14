import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/data/data_job.dart';
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
            const Text(
              'Чему вы хотите\n уделит время?',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ).paddingOnly(top: 80),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 25.0.fromFigmaHeight(),
              spacing: 25.0.fromFigmaWidth(),
              children: [
                RoundButtonCategoryWidget(
                  mainText: "Работа",
                  secondaryText: "Работа",
                  color: const Color.fromARGB(255, 0, 225, 239),
                  onTap: () {
                    work(context, controller.listJob, JobType.job);
                  },
                ),
                RoundButtonCategoryWidget(
                  mainText: "Спорт",
                  secondaryText: "Спорт",
                  color: const Color.fromARGB(255, 255, 67, 180),
                  onTap: () async {
                    work(context, controller.listSport, JobType.sport);
                  },
                ),
                RoundButtonCategoryWidget(
                  mainText: "Хобби",
                  secondaryText: "Хобби",
                  color: const Color.fromARGB(255, 255, 67, 67),
                  onTap: () {
                    work(context, controller.listHobby, JobType.hobby);
                  },
                ),
                RoundButtonCategoryWidget(
                  mainText: "Учеба",
                  secondaryText: "Учеба",
                  color: const Color.fromARGB(255, 255, 157, 67),
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
