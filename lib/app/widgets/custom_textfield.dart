import 'package:flutter/material.dart';

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
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        hintText: "Введите текст",
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
