import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/main.dart';

class CategoriesController extends GetxController {
  static CategoriesController get to => Get.find();
  RxList<DataJob> listJob = RxList<DataJob>([]);
  RxList<DataJob> listSport = RxList<DataJob>([]);
  RxList<DataJob> listHobby = RxList<DataJob>([]);
  RxList<DataJob> listEducation = RxList<DataJob>([]);

  final Color startRight = Color.fromARGB(255, 12, 0, 114);
  final Color beginRight = Color.fromARGB(255, 0, 172, 57);

  final Color startLeft = Color.fromARGB(255, 0, 70, 128);
  final Color beginLeft = Color.fromARGB(255, 8, 219, 26);

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
    
    var subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      {
        isDeviceConnected.value =
            await InternetConnectionChecker().hasConnection;
      }
    });
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
