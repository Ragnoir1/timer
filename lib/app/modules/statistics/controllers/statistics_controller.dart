import 'package:get/get.dart';
import 'package:timer/app/data/data_job.dart';
import 'package:timer/app/modules/categories/controllers/categories_controller.dart';

class StatisticsController extends GetxController {
  RxList<DataJob> ollLists = RxList<DataJob>([
    CategoriesController.to.listJob,
    CategoriesController.to.listSport,
    CategoriesController.to.listHobby,
    CategoriesController.to.listEducation,
  ].expand((e) => e).toList());

  final count = 0.obs;
  @override
  void onInit() {
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
