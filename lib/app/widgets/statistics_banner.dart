// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer/app/data/colors.dart';

import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:timer/extension/size_from_figma.dart';

class StatisticsBanner extends StatelessWidget {
  String text;
  List<DataJob> list;
  List<Color> colors;
  Function()? onTap;
  StatisticsBanner({
    Key? key,
    required this.text,
    required this.list,
    required this.colors,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: 363.0.fromFigmaWidth(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: colors),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(1.5, 2), color: Colors.black.withOpacity(0.25))
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 36,
                color: AppColors.textColor,
              ),
            ).paddingSymmetric(horizontal: 16),
            Container(
              height: 66,
              width: 110,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  StatisticsController.to.sumOfTimeShort(list),
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
