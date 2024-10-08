import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:timer/app/data/colors.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';
import 'package:timer/app/modules/categories/views/categories_view.dart';
import 'package:timer/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:timer/app/modules/statistics/views/statistics_view.dart';
import 'package:timer/app/modules/timer/controllers/timer_controller.dart';
import 'package:timer/app/modules/timer/views/timer_view.dart';

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
      navBarHeight: 50,
      backgroundColor: Color.fromARGB(255, 36, 37, 63),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: false,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Color.fromARGB(255, 36, 37, 63),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style13,
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
            icon: Icon(Icons.home),
            title: "Категории",
            activeColorPrimary: Colors.white,
            inactiveColorPrimary: AppColors.iconColor),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.timer_sharp),
            title: "Таймер",
            activeColorPrimary: Color.fromARGB(255, 255, 255, 255),
            inactiveColorPrimary: AppColors.iconColor),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.auto_graph),
            title: "Статистика",
            activeColorPrimary: Color.fromARGB(255, 255, 255, 255),
            inactiveColorPrimary: AppColors.iconColor),
      ];
}
