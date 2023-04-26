// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';

import 'package:timer/app/modules/categories/controllers/cash_mixin.dart';

class DataJob {
  String id;
  String? label;
  int time;
  bool? internet;
  JobType type;

  DataJob({
    required this.type,
    required this.id,
    this.label,
    this.time = 0,
    this.internet,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'time': time,
      'internet': internet,
      'type': type.toString(),
    };
  }

  factory DataJob.fromMap(Map<String, dynamic> map) {
    return DataJob(
        id: map['id'] ?? "",
        label: map['label'] != null ? map['label'] as String : null,
        time: map['time'] as int,
        internet: map['internet'] != null ? map['internet'] as bool : null,
        type: (map["type"] as String?).toJobType());
  }

  DataJob copyWith({
    String? id,
    String? label,
    int? time,
    bool? internet,
    JobType? type,
  }) {
    return DataJob(
      id: id ?? this.id,
      label: label ?? this.label,
      time: time ?? this.time,
      internet: internet ?? this.internet,
      type: type ?? this.type,
    );
  }
}

extension ASD on String? {
  JobType toJobType() {
    if (this == null) {
      return JobType.job;
    }
    return JobType.values
            .firstWhereOrNull((element) => element.toString() == this) ??
        JobType.job;
  }
}
