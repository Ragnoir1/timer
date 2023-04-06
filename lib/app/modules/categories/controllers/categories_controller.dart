import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/modules/categories/controllers/cash_mixin.dart';
import 'package:timer/main.dart';

class CategoriesController extends GetxController with CashMixin {
  static CategoriesController get to => Get.find();
  RxList<DataJob> listJob = RxList<DataJob>([]);
  RxList<DataJob> listSport = RxList<DataJob>([]);
  RxList<DataJob> listHobby = RxList<DataJob>([]);
  RxList<DataJob> listEducation = RxList<DataJob>([]);
  ScrollController listViewController = ScrollController();

  final controllerTextField = TextEditingController();

  final Color startRight = Color.fromARGB(255, 112, 66, 221);
  final Color beginRight = Color.fromARGB(255, 171, 64, 185);

  final Color startLeft = Color.fromARGB(255, 13, 21, 94);
  final Color beginLeft = Color.fromARGB(255, 85, 32, 116);

  static const int maxCount = 10;

  Color getLeftColor(int i) {
    final Color beginner = (i ~/ maxCount) % 2 == 0 ? beginLeft : startLeft;
    final Color starter = (i ~/ maxCount) % 2 == 0 ? startLeft : beginLeft;
    final r = starter.red +
        (((beginner.red - starter.red) / maxCount) * (i % maxCount));

    final g = starter.green +
        (((beginner.green - starter.green) / maxCount) * (i % maxCount));

    final b = starter.blue +
        (((beginner.blue - starter.blue) / maxCount) * (i % maxCount));

    return Color.fromARGB(255, r.toInt(), g.toInt(), b.toInt());
  }

  Color getRightColor(int i) {
    final Color starter = (i ~/ maxCount) % 2 == 0 ? startRight : beginRight;
    final Color beginner = (i ~/ maxCount) % 2 == 0 ? beginRight : startRight;

    final r = starter.red +
        (((beginner.red - starter.red) / maxCount) * (i % maxCount));

    final g = starter.green +
        (((beginner.green - starter.green) / maxCount) * (i % maxCount));

    final b = starter.blue +
        (((beginner.blue - starter.blue) / maxCount) * (i % maxCount));

    return Color.fromARGB(255, r.toInt(), g.toInt(), b.toInt());
  }

  void addWork(List<DataJob> list) async {
    final DataJob result = DataJob(label: controllerTextField.text);

    list.add(result);
    controllerTextField.clear();
    print(list);
    await listViewController.animateTo(
        listViewController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut);
  }

  @override
  void onInit() async {
    box = await Hive.openBox('testBox');
    listJob.value = getDataJob(JobType.work);
    listSport.value = getDataJob(JobType.sport);
    print(getDataJob(JobType.sport));
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      {
        isDeviceConnected.value =
            await InternetConnectionChecker().hasConnection;
      }
    });

    super.onInit();
  }
}
