import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension FromFigma on double {
  double fromFigmaWidth() {
    return MediaQuery.of(Get.context!).size.width * (this / 390);
  }

  double fromFigmaHeight() {
    return MediaQuery.of(Get.context!).size.height * (this / 844);
  }
}
