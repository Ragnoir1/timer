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
}

class DataJobClass {
  String name;
  List<DataJob> list;
  DataJobClass({required this.list, required this.name});
}
