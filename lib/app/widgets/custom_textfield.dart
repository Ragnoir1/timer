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
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
