part of 'timer_view.dart';

buildAchievements(context) {
  BarNavigator.pushNewScreen(
    context,
    Builder(
      builder: (context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar('achievements'.tr, context),
        body: SpaceAround(
          child: Text(
            'being_developed'.tr,
            style: TextStyle(color: AppColors.textColor, fontSize: 40),
          ),
        ),
      ),
    ),
  );
}
