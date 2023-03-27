import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:timer/app/data/data_job.dart';

class TimerController extends GetxController {
  static TimerController get to => Get.find();
  Rx<DataJob> dataUsed = DataJob().obs;
  

  Timer? timer;
  final RxInt time = 0.obs;
  void timerFunc() {
    timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      time.value++;
    });
  }

   Future<bool> checkInternet() async {
    
    bool isConnected = await InternetConnectionChecker().hasConnection;
    
    if (isConnected == true) {
      return true;
    } else {
      return false;
    }
  }
  
  

  final count = 0.obs;
  @override
  void onInit() {
    checkInternet();
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
