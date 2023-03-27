// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpaceAround extends StatelessWidget {
  Widget? child;
  PreferredSizeWidget? appBar;
  bool isTransparentAppBar;
  List<Color> colors;
  SpaceAround({
    Key? key,
    this.child,
    this.appBar,
    this.isTransparentAppBar = true,
    this.colors = const [Color(0xFF4c4c4c), Color(0xFF4c4b58)],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: isTransparentAppBar,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: colors,
            stops: [0, 1],
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
