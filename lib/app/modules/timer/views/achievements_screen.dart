part of 'timer_view.dart';

buildAchievements(context) {
  BarNavigator.pushNewScreen(
    context,
    Builder(
      builder: (context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(LocaleKeys.achievements.tr, context),
        body: SpaceAround(
          child: Text(
            LocaleKeys.being_developed.tr,
            style: TextStyle(color: AppColors.textColor, fontSize: 40),
          ),
        ),
      ),
    ),
  );
}
