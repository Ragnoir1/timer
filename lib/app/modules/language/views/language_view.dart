import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LanguageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LanguageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
