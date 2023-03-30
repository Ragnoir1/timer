import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/data/navigator.dart';
import 'package:timer/app/modules/home/controllers/home_controller.dart';
import 'package:timer/app/modules/timer/controllers/timer_controller.dart';
import 'package:timer/app/widgets/card_category.dart';
import 'package:timer/app/widgets/custom_appbar.dart';
import 'package:timer/app/widgets/custom_textfield.dart';
import 'package:timer/app/widgets/roud_button_category_widget.dart';
import 'package:timer/app/widgets/simple_button.dart';
import 'package:timer/app/widgets/space_around.dart';

import '../controllers/categories_controller.dart';
part 'data.dart';

//TODO:
//TODO:
//TODO:
//TODO:раскидать один большой блок на маленькие виджеты
//TODO:
//TODO:
//TODO:
class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpaceAround(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              'Чему вы хотите\n уделит время?',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 100,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              runSpacing: 16,
              spacing: 16,
              children: [
                RoundButtonCategoryWidget(
                  mainText: "Работа",
                  secondaryText: "Работа",
                  color: Color.fromARGB(255, 0, 225, 239),
                  onTap: () {
                    work(context, controller.listJob);
                  },
                ),
                RoundButtonCategoryWidget(
                  mainText: "Спорт",
                  secondaryText: "Спорт",
                  color: Color.fromARGB(255, 255, 67, 180),
                  onTap: () {
                    work(context, controller.listSport);
                  },
                ),
                RoundButtonCategoryWidget(
                  mainText: "Хобби",
                  secondaryText: "Хобби",
                  color: Color.fromARGB(255, 255, 67, 67),
                  onTap: () {
                    work(context, controller.listHobby);
                  },
                ),
                RoundButtonCategoryWidget(
                  mainText: "Учеба",
                  secondaryText: "Учеба",
                  color: Color.fromARGB(255, 255, 157, 67),
                  onTap: () {
                    work(context, controller.listEducation);
                  },
                ),
              ],
            ),
            // SizedBox(
            //   height: 30,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [

            //   ],
            // )
          ],
        ),
      ),
    );
  }

  work(context, List<DataJob> list) {
    return BarNavigator.pushNewScreen(
        context, buildWorkScreen(list, controller));
  }
}
