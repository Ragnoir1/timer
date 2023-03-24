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
import 'package:timer/app/widgets/simple_button.dart';
import 'package:timer/app/widgets/space_around.dart';

import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpaceAround(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Чему вы хотите\n уделит время?',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFFA880FF),
              ),
            ),
            Text(
              "Ответ в любой момент можно\n поменять",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ).paddingSymmetric(vertical: 16),
            CardCategory(
              label: "Работа",
              onTap: () {
                work(context, controller.listJob);
              },
            ),
            SizedBox(
              height: 16,
            ),
            CardCategory(
              label: "Спорт",
              onTap: () {
                work(context, controller.listSport);
              },
            ),
            SizedBox(
              height: 16,
            ),
            CardCategory(
              label: "Хобби",
              onTap: () {
                work(context, controller.listHobby);
              },
            ),
            SizedBox(
              height: 16,
            ),
            CardCategory(
              label: "Образование",
              onTap: () {
                work(context, controller.listEducation);
              },
            ),
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
                    'Выберите занятие',
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
                        label: list[index].label,
                        onTap: () {
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
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        "Требуется ли\n вам интернет\n для вашего\n занятия?",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
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
                                        onTap: () {
                                          HomeController
                                              .to.bottomNavigationBarController
                                              .jumpToTab(1);
                                          TimerController.to.dataUsed.value =
                                              list[index];
                                        },
                                      ).paddingOnly(top: 50),
                                      SimpleButton(
                                        text: "Да",
                                        colors: [
                                          Color(0xffff4747),
                                          Color(0xffff7373)
                                        ],
                                        onTap: () {
                                          HomeController
                                              .to.bottomNavigationBarController
                                              .jumpToTab(1);
                                          TimerController.to.dataUsed.value =
                                              list[index];
                                        },
                                      ).paddingOnly(top: 16),
                                      SimpleButton(
                                        text: "Skip",
                                        colors: [
                                          Colors.white,
                                          Color.fromARGB(255, 226, 226, 226)
                                        ],
                                        textColor: Colors.black,
                                        height: 30,
                                        width: 78,
                                        fontSize: 16,
                                        borderRadius: 7,
                                        onTap: () {
                                          HomeController
                                              .to.bottomNavigationBarController
                                              .jumpToTab(1);
                                          TimerController.to.dataUsed.value =
                                              list[index];
                                        },
                                      ).paddingOnly(top: 200, left: 250)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).paddingSymmetric(horizontal: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
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
