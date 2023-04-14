// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:timer/app/widgets/paint/statistic_all_time_paint.dart';

class StatisticAllTimeWidget extends StatelessWidget {
  List<DataJob> list;
  StatisticAllTimeWidget({
    Key? key,
    required this.list,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      width: 185,
      child: CustomPaint(
        painter: StatisticAllTimePaint(
            text: StatisticsController.to.sumOfTimeShort(list)),
      ),
    );
  }
}
