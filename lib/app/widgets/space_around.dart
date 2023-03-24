import 'package:flutter/cupertino.dart';

class SpaceAround extends StatelessWidget {
  final Widget? child;

  const SpaceAround({super.key, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, -1),
          end: Alignment(0, 1),
          colors: [Color.fromARGB(255, 75, 75, 75), Color.fromARGB(189, 46, 46, 46)],
          stops: [0, 1],
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
