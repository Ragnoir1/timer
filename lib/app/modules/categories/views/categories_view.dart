import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/data/navigator.dart';
import 'package:timer/app/modules/home/controllers/home_controller.dart';
import 'package:timer/app/modules/timer/controllers/timer_controller.dart';
import 'package:timer/app/modules/timer/views/timer_view.dart';
import 'package:timer/app/widgets/card_category.dart';
import 'package:timer/app/widgets/custom_appbar.dart';
import 'package:timer/app/widgets/custom_textfield.dart';
import 'package:timer/app/widgets/roud_button_category_paint.dart';
import 'package:timer/app/widgets/roud_button_category_widget.dart';
import 'package:timer/app/widgets/simple_button.dart';
import 'package:timer/app/widgets/space_around.dart';

import '../controllers/categories_controller.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
            )
          ],
        ),
      ),
    );
  }

  work(context, RxList<DataJob> list) {
    return BarNavigator.pushNewScreen(
      context,
      Builder(
        builder: (_) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(),
          body: SpaceAround(
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    list.isEmpty ? "Добавьте занятие" : "Выберите занятие",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 450,
                    child: ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (context, index) => CardCategory(
                        label: list[index].label!,
                        onTap: () {
                          list[index].internet == null
                              ? BarNavigator.pushNewScreen(
                                  context,
                                  Builder(
                                    builder: (_) => Scaffold(
                                      extendBodyBehindAppBar: true,
                                      appBar: CustomAppBar(),
                                      body: SpaceAround(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Text(
                                              "Требуется ли\n вам интернет\n для вашего\n занятия?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 40,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 100,
                                            ),
                                            SimpleButton(
                                              text: "Нет",
                                              colors: [
                                                Color(0xff50ff77),
                                                Color(0xb550eaff)
                                              ],
                                              fontSize: 40,
                                              onTap: () {
                                                list[index].internet = false;

                                                HomeController.to
                                                    .bottomNavigationBarController
                                                    .jumpToTab(1);
                                                TimerController.to.dataUsed
                                                    .value = list[index];
                                                TimerController.to.refresh();
                                              },
                                            ).paddingOnly(top: 50),
                                            SimpleButton(
                                              text: "Да",
                                              colors: [
                                                Color(0xffff4747),
                                                Color(0xffff7373)
                                              ],
                                              onTap: () {
                                                list[index].internet = true;
                                                HomeController.to
                                                    .bottomNavigationBarController
                                                    .jumpToTab(1);
                                                TimerController.to.dataUsed
                                                    .value = list[index];
                                              },
                                            ).paddingOnly(top: 16),
                                            SimpleButton(
                                              text: "Skip",
                                              colors: [
                                                Colors.white,
                                                Color.fromARGB(
                                                    255, 226, 226, 226)
                                              ],
                                              textColor: Colors.black,
                                              height: 30,
                                              width: 78,
                                              fontSize: 16,
                                              borderRadius: 7,
                                              onTap: () {
                                                HomeController.to
                                                    .bottomNavigationBarController
                                                    .jumpToTab(1);
                                                TimerController.to.dataUsed
                                                    .value = list[index];
                                              },
                                            ).paddingOnly(top: 200, left: 250)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : HomeController.to.bottomNavigationBarController
                                  .jumpToTab(1);
                          TimerController.to.dataUsed.value = list[index];
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Container(
              width: 60,
              height: 60,
              child: Icon(
                Icons.add,
                size: 40,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFFb274ff), Color(0xFFe016ff)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
            ),
            onPressed: () {
              BarNavigator.pushNewScreen(
                context,
                Builder(
                  builder: (_) => Scaffold(
                    extendBodyBehindAppBar: true,
                    appBar: CustomAppBar(),
                    body: SpaceAround(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField().paddingSymmetric(horizontal: 50),
                          MaterialButton(
                            color: Colors.white,
                            child: Text("Добавить"),
                            onPressed: () {
                              controller.addWork(list);
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
