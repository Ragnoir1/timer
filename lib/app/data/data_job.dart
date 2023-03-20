// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DataJob {
  String label;
  int time;

  DataJob({
    required this.label,
    this.time = 0,
  });

  DataJob copyWith({
    String? label,
    int? time,
  }) {
    return DataJob(
      label: label ?? this.label,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'time': time,
    };
  }

  factory DataJob.fromMap(Map<String, dynamic> map) {
    return DataJob(
      label: map['label'] as String,
      time: map['time'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataJob.fromJson(String source) =>
      DataJob.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DataJob(label: $label, time: $time)';

  @override
  bool operator ==(covariant DataJob other) {
    if (identical(this, other)) return true;

    return other.label == label && other.time == time;
  }

  @override
  int get hashCode => label.hashCode ^ time.hashCode;
}
