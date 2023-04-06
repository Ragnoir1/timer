import 'dart:developer';

import 'package:timer/app/data/data_job.dart';

enum JobType { job, sport, hobby, education }

mixin CashMixin {
  late var box;
  static const String jobKey = "job";
  static const String sportKey = "sport";
  static const String hobbyKey = "hobby";
  static const String educationKey = "education";

  String getKey(JobType type) {
    switch (type) {
      case JobType.job:
        return jobKey;
      case JobType.sport:
        return sportKey;
      case JobType.hobby:
        return hobbyKey;
      case JobType.education:
        return educationKey;
    }
    // return type == JobType.work ? jobKey : sportKey;
  }

  List<DataJob> getDataJob(JobType type) {
    final jobCash = box.get(getKey(type));
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
    // log(box.get(getKey(type)).toString(), name: "saveLog");
  }

  void deletIndexWork(List<DataJob> list, int index, JobType type) async {
    list.removeAt(index);
    await box.put(getKey(type), list.map((e) => e.toMap()).toList());
  }
}
