part of 'timer_view.dart';

buildSettings(context) {
  BarNavigator.pushNewScreen(
    context,
    Builder(
      builder: (context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(LocaleKeys.settings.tr, context),
        body: SpaceAround(
          child: InkWell(
            onTap: () {
              buildLanguage(context);
            },
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 35, 35, 35),
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.grey, width: 1.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width * 0.28,
                    child: Icon(
                      Icons.language_rounded,
                      color: AppColors.textColor,
                      size: 55,
                    ),
                  ),
                  Container(
                    width: Get.width * 0.28,
                    child: Text(
                      LocaleKeys.language.tr,
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 20),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.31,
                  ),
                  Container(
                    width: Get.width * 0.12,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColors.textColor,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
