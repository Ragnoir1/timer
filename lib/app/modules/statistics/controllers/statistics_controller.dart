import 'package:get/get.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';

class StatisticsController extends GetxController {
  List<DataJobClass> get ollLists => [
      DataJobClass  (
        name: "rabota",
        list:CategoriesController.to.listJob),
        DataJobClass  (
        name: "listSport",
        list:CategoriesController.to.listSport),DataJobClass  (
        name: "listHobby",
        list:CategoriesController.to.listHobby),DataJobClass  (
        name: "listEducation",
        list:CategoriesController.to.listEducation),
        
      ];
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
  DataJobClass({required this.list , required this.name});
}
