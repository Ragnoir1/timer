part of 'statistics_view.dart';

 buildStatistic(context) {
  BarNavigator.pushNewScreen(
      context,
      Builder(
        builder: (context) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(),
          body: SpaceAround(),
        ),
      ));
}
