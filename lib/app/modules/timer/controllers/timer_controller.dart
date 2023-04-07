import 'dart:async';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/modules/categories/controllers/cash_mixin.dart';

class TimerController extends GetxController with CashMixin {
  static TimerController get to => Get.find();

  Rx<DataJob?> dataUsed = Rx<DataJob?>(null);

  Timer? timer;
  final RxInt time = 0.obs;
  void timerFunc() {
    timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      time.value++;
    });
  }

  @override
  void onInit() async {
    box = await Hive.openBox('testBox');
    super.onInit();
  }
}
