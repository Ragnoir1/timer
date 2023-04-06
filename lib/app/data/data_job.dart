// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DataJob {
  String? label;
  int time;
  bool? internet;

  DataJob({
    this.label,
    this.time = 0,
    this.internet,
  });

  DataJob copyWith({
    String? label,
    int? time,
    bool? internet,
  }) {
    return DataJob(
      label: label ?? this.label,
      time: time ?? this.time,
      internet: internet ?? this.internet,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'time': time,
      'internet': internet,
    };
  }

  factory DataJob.fromMap(Map<String, dynamic> map) {
    return DataJob(
      label: map['label'] != null ? map['label'] as String : null,
      time: map['time'] as int,
      internet: map['internet'] != null ? map['internet'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataJob.fromJson(String source) =>
      DataJob.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DataJob(label: $label, time: $time, internet: $internet)';

  @override
  bool operator ==(covariant DataJob other) {
    if (identical(this, other)) return true;

    return other.label == label &&
        other.time == time &&
        other.internet == internet;
  }

  @override
  int get hashCode => label.hashCode ^ time.hashCode ^ internet.hashCode;
}
