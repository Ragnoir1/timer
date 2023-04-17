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

  List<List<Color>> colors = [
    [
      Color(0xFFe2fb69),
      Color.fromARGB(0, 0, 225, 255),
    ],
    [
      Color.fromARGB(255, 239, 0, 215),
      Color.fromARGB(0, 0, 223, 239),
    ],
    [
      Color.fromARGB(255, 125, 255, 138),
      Color.fromARGB(0, 0, 208, 255),
    ],
    [
      Color.fromARGB(255, 0, 210, 239),
      Color.fromARGB(0, 255, 51, 211),
    ],
  ];

  String sumOfTime(List<DataJob> list) {
    int sum = 0;
    list.forEach((e) => sum += e.time);
    if (list.isNotEmpty) {
      return "${(sum ~/ 60).toString().padLeft(2, "0")}:${(sum % 60).toString().padLeft(2, "0")}";
    } else {
      return "00:00";
    }
  }

  String sumOfTimeShort(List<DataJob> list) {
    int sum = 0;
    list.forEach((e) => sum += e.time);
    if (list.isNotEmpty) {
      if (sum < 3600) {
        return "${sum ~/ 60} м";
      } else {
        return "${sum ~/ 3600} ч";
      }
    } else {
      return "0 м";
    }
  }
}

class DataJobClass {
  String name;
  List<DataJob> list;
  DataJobClass({required this.list, required this.name});
}
