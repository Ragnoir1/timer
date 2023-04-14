part of 'timer_view.dart';

buildSettings(context) {
  BarNavigator.pushNewScreen(
      context,
      Builder(
        builder: (context) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            title: Text(
              "Настройки",
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
