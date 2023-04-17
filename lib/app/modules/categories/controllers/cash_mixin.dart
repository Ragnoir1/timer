import 'dart:developer';

import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/modules/statistics/controllers/statistics_controller.dart';

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
  }

  void saveAll() async {
    await box.put(
        jobKey,
        StatisticsController.to.ollLists[0].list
            .map((e) => e.toMap())
            .toList());
    await box.put(
        sportKey,
        StatisticsController.to.ollLists[1].list
            .map((e) => e.toMap())
            .toList());
    await box.put(
        hobbyKey,
        StatisticsController.to.ollLists[2].list
            .map((e) => e.toMap())
            .toList());
    await box.put(
        educationKey,
        StatisticsController.to.ollLists[3].list
            .map((e) => e.toMap())
            .toList());
  }

  void deletIndexWork(List<DataJob> list, int index, JobType type) async {
    list.removeAt(index);
    await box.put(getKey(type), list.map((e) => e.toMap()).toList());
  }
}
