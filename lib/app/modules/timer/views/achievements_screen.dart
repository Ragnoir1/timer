part of 'timer_view.dart';

buildAchievements(context) {
  BarNavigator.pushNewScreen(
      context,
      Builder(
        builder: (context) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            title: Text(
              "Достижения",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          body: SpaceAround(),
        ),
      ));
}
