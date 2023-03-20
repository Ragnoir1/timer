import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends GetxController {
  Timer? timer;
  final RxInt time = 0.obs;
  final PersistentTabController bottomNavigationBarController =
      PersistentTabController(initialIndex: 0);
  static HomeController get to => Get.find();
  final RxList<Widget> categories = RxList<Widget>([]);
  PageController pageController = PageController(initialPage: 0);
  RxInt currentIndex = 0.obs;
  final count = 0.obs;
  onTapPage(int index) {
    if (currentIndex.value == index) {
      return;
    } else {
      currentIndex.value = index;
    }
  }

  onTapBar(index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      if (time.value == 15) {
        _timer.cancel();
      } else
        time.value++;
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
