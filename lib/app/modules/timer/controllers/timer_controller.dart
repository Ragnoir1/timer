import 'dart:async';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/modules/categories/controllers/cash_mixin.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';
import 'package:timer/app/modules/statistics/controllers/statistics_controller.dart';

class TimerController extends GetxController with CashMixin {
  static TimerController get to => Get.find();

  Rx<DataJob?> dataUsed = Rx<DataJob?>(null);

  Timer? timer;
  bool isVisible = false;
  final RxInt time = 0.obs;

  void hideMessage() {
    Timer(Duration(seconds: 5), () {
      isVisible = false;
    });
  }

  void timerFunc() {
    isVisible = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time.value == 3599) {
        stopTimer();
      } else {
        time.value++;
      }
    });
  }

  void stopTimer() {
    isVisible = false;
    dataUsed.value?.time += time.value;
    timer?.cancel();
    time.value = 0;
    saveAll();
    dataUsed.value = null;
    StatisticsController.to.refresh();
  }

  String timerLabel(JobType type) {
    switch (type) {
      case JobType.job:
        return "Работа";
      case JobType.sport:
        return "Спорт";
      case JobType.hobby:
        return "Хобби";
      case JobType.education:
        return "Учеба";
      default:
        return "";
    }
  }

  @override
  void onInit() async {
    box = await Hive.openBox('testBox');
    super.onInit();
  }
}
