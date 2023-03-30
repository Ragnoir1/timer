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
}
