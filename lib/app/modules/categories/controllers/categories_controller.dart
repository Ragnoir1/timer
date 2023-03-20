import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/app/data/data_job.dart';

class CategoriesController extends GetxController {
  static CategoriesController get to => Get.find();
  RxList<DataJob> listJob = RxList<DataJob>([]);
  RxList<DataJob> listSport = RxList<DataJob>([]);
  RxList<DataJob> listHobby = RxList<DataJob>([]);
  RxList<DataJob> listEducation = RxList<DataJob>([]);

  final controllerTextField = TextEditingController();
  void addWork(RxList<DataJob> list) {
    final DataJob resoult = DataJob(label: controllerTextField.text);

    list.add(resoult);
    controllerTextField.clear();
    print(list);
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
