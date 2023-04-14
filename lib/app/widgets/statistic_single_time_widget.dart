import 'package:flutter/material.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/widgets/paint/statistic_single_time_paint.dart';

class StatisticSingleTimeWidget extends StatelessWidget {
  DataJob work;
  StatisticSingleTimeWidget({
    Key? key,
    required this.work,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: CustomPaint(
        painter: StatisticSingleTimePaint(
          text: work.label,
          time: work.time,
          colors: [
            Color(0xFFe2fb69),
            Color.fromARGB(255, 0, 225, 255),
          ],
        ),
      ),
    );
  }
}
