// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardCategory extends StatelessWidget {
  final String label;
  final Function() onTap;
  CardCategory({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
        ).paddingSymmetric(vertical: 15),
      ),
    ).paddingSymmetric(horizontal: 40);
  }
}
