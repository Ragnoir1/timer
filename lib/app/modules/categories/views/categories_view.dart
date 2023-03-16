import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/data/navigator.dart';
import 'package:timer/app/widgets/card_category.dart';
import 'package:timer/app/widgets/custom_appbar.dart';
import 'package:timer/app/widgets/custom_textfield.dart';
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
                        onTap: () {},
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
