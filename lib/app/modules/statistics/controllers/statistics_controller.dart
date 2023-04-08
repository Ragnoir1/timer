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
  String sumOfTime(List<DataJob> list) {
    int sum = 0;
    list.forEach((e) => sum += e.time);
    if (list.isNotEmpty) {
      return "${(sum ~/ 60).toString().padLeft(2, "0")}:${(sum % 60).toString().padLeft(2, "0")}";
    } else {
      return "00:00";
    }
  }
}

class DataJobClass {
  String name;
  List<DataJob> list;
  DataJobClass({required this.list, required this.name});
}
