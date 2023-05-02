// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:timer/app/data/colors.dart';
import 'package:timer/app/modules/timer/controllers/timer_controller.dart';

class LanguageButton extends StatelessWidget {
  final String flag;
  final String language;
  final String locale;
  final Function? customFunction;
  LanguageButton({
    Key? key,
    required this.flag,
    required this.language,
    required this.locale,
    this.customFunction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: customFunction != null
              ? (() => customFunction!())
              : () {
                  Get.updateLocale(Locale(locale));
                  TimerController.to.saveLanguage(locale);
                },
          child: Image.asset(flag),
        ),
        Text(
          language,
          style: TextStyle(fontSize: 24, color: AppColors.textColor),
        ).paddingOnly(top: 10)
      ],
    );
  }
}
