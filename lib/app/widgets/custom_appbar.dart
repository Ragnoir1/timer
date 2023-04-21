// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget? title;
  double size;
  CustomAppBar({
    Key? key,
    this.title,
    this.size = kToolbarHeight,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(size);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: size,
      backgroundColor: const Color(0x00000000),
      elevation: 0,
      title: title,
      centerTitle: true,

      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back),
      //   onPressed: () => Navigator.pop(context),
      // ),
    );
  }
}
