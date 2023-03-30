import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';

class StatisticsController extends GetxController {
  static StatisticsController get to => Get.find();
  List<DataJobClass> get ollLists => [
        DataJobClass(name: "rabota", list: CategoriesController.to.listJob),
        DataJobClass(
            name: "listSport", list: CategoriesController.to.listSport),
        DataJobClass(
            name: "listHobby", list: CategoriesController.to.listHobby),
        DataJobClass(
            name: "listEducation", list: CategoriesController.to.listEducation),
      ];

  final Color startRight = Color.fromARGB(255, 48, 0, 49);
  final Color beginRight = Color.fromARGB(255, 139, 64, 6);

  final Color startLeft = Color.fromARGB(255, 37, 0, 37);
  final Color beginLeft = Color.fromARGB(255, 184, 151, 8);
  

  Color getLeftColor(int i, int count) {
    final r = startLeft.red + (((beginLeft.red - startLeft.red) / count) * i);

    final g =
        startLeft.green + (((beginLeft.green - startLeft.green) / count) * i);

    final b =
        startLeft.blue + (((beginLeft.blue - startLeft.blue) / count) * i);

    return Color.fromARGB(255, r.toInt(), g.toInt(), b.toInt());
  }

  Color getRightColor(int i, int count) {
    final r =
        startRight.red + (((beginRight.red - startRight.red) / count) * i);

    final g = startRight.green +
        (((beginRight.green - startRight.green) / count) * i);

    final b =
        startRight.blue + (((beginRight.blue - startRight.blue) / count) * i);

    return Color.fromARGB(255, r.toInt(), g.toInt(), b.toInt());
  }
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

class DataJobClass {
  String name;
  List<DataJob> list;
  DataJobClass({required this.list, required this.name});
}
