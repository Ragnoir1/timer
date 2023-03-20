import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';
import 'package:timer/app/modules/categories/views/categories_view.dart';
import 'package:timer/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:timer/app/modules/statistics/views/statistics_view.dart';
import 'package:timer/app/modules/timer/controllers/timer_controller.dart';
import 'package:timer/app/modules/timer/views/timer_view.dart';
import 'package:timer/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.bottomNavigationBarController,
      screens: _buildScreens(),
      onWillPop: (p0) async {
        return false;
      },
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() => [
        GetBuilder(
          builder: ((_) => CategoriesView()),
          init: CategoriesController(),
        ),
        GetBuilder(
          builder: ((_) => TimerView()),
          init: TimerController(),
        ),
        GetBuilder(
          builder: ((_) => StatisticsView()),
          init: StatisticsController(),
        ),
      ];
  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: Icon(Icons.category), title: "Категории"),
        PersistentBottomNavBarItem(icon: Icon(Icons.timer), title: "Таймер"),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.auto_graph), title: "Статистика"),
      ];
}
