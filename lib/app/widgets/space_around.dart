import 'package:flutter/cupertino.dart';

class SpaceAround extends StatelessWidget {
  final Widget? child;

  const SpaceAround({super.key, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 73, 73, 73),
            Color.fromARGB(255, 112, 112, 112),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
