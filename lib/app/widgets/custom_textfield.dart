import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:timer/generated/locales.g.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  CustomTextField({this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      controller: textEditingController,
      autofocus: true,
      textAlign: TextAlign.center,
      maxLength: 15,
      cursorColor: Colors.purple,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        hintText: LocaleKeys.textfield_text.tr,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
