import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/categories/controllers/categories_controller.dart';

class CustomTextField extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.controllerTextField,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
