part of 'timer_view.dart';

buildAchievements(context) {
  BarNavigator.pushNewScreen(
    context,
    Builder(
      builder: (context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar("Достижения", context),
        body: SpaceAround(
          child: Text(
            "В разработке",
            style: TextStyle(color: AppColors.textColor, fontSize: 40),
          ),
        ),
      ),
    ),
  );
}
