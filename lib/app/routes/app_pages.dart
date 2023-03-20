import 'package:get/get.dart';

import 'package:timer/app/modules/categories/bindings/categories_binding.dart';
import 'package:timer/app/modules/categories/views/categories_view.dart';
import 'package:timer/app/modules/home/bindings/home_binding.dart';
import 'package:timer/app/modules/home/views/home_view.dart';
import 'package:timer/app/modules/statistics/bindings/statistics_binding.dart';
import 'package:timer/app/modules/statistics/views/statistics_view.dart';
import 'package:timer/app/modules/timer/bindings/timer_binding.dart';
import 'package:timer/app/modules/timer/views/timer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.TIMER,
      page: () => TimerView(),
      binding: TimerBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICS,
      page: () => StatisticsView(),
      binding: StatisticsBinding(),
    ),
  ];
}
