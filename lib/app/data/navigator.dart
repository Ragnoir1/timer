import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BarNavigator {
  static Future<void> pushNewScreen(BuildContext context, Widget child) async {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: child,
      withNavBar: true, 
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
    return;
  }
}
