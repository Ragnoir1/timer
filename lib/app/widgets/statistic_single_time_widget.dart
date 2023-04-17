// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/widgets/paint/statistic_single_time_paint.dart';

class StatisticSingleTimeWidget extends StatelessWidget {
  DataJob work;
  List<Color> colors;
  StatisticSingleTimeWidget({
    Key? key,
    required this.work,
    required this.colors,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      child: CustomPaint(
        painter: StatisticSingleTimePaint(
          text: work.label,
          time: work.time,
          colors: colors,
        ),
      ),
    );
  }
}
