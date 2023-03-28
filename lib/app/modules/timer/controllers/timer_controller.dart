import 'dart:async';

import 'package:get/get.dart';
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
