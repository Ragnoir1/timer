import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final count = 0.obs;
  final RxInt time = 0.obs;
  RxInt currentIndex = 0.obs;
  final RxList<Widget> categories = RxList<Widget>([]);

  final PersistentTabController bottomNavigationBarController =
      PersistentTabController(initialIndex: 0);
  PageController pageController = PageController(initialPage: 0);

  Timer? timer;

  onTapBar(index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      if (time.value == 15) {
        _timer.cancel();
      } else {
        time.value++;
      }
    });
    super.onInit();
  }
}
