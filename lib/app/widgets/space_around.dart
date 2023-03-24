import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpaceAround extends StatelessWidget {
  final Widget? child;
  final PreferredSizeWidget? appBar;
  final bool isTransparentAppBar;
  const SpaceAround(
      {super.key, this.child, this.appBar, this.isTransparentAppBar = false});
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
            colors: [
              Color.fromARGB(255, 75, 75, 75),
              Color.fromARGB(189, 46, 46, 46)
            ],
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
