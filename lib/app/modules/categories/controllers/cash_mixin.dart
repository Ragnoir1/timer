import 'dart:developer';

import 'package:timer/app/data/data_job.dart';

import 'categories_controller.dart';

enum JobType { work, sport }

mixin CashMixin {
  late var box;
  static const String jobKey = "job";
  static const String sportKey = "sport";

  String getKey(JobType type) {
    return type == JobType.work ? jobKey : sportKey;
  }

  List<DataJob> getDataJob(JobType type) {
    final jobCash = box.get(getKey(type));
    print(jobCash);
    if (jobCash != null) {
      final List<dynamic> data = jobCash;

      return data
          .map((e) => DataJob.fromMap(Map<String, dynamic>.from(e)))
          .toList();
    }
    return [];
  }

  void saveJobCash(List<DataJob> list, JobType type) async {
    await box.put(getKey(type), list.map((e) => e.toMap()).toList());
    log(box.get(getKey(type)).toString(), name: "saveLog");
  }

  void deletIndexWork(List<DataJob> list, int index) async {
    list.removeAt(index);
    await box.put("job", list.map((e) => e.toMap()).toList());
  }
}
