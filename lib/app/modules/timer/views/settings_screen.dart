part of 'timer_view.dart';

buildSettings(context) {
  BarNavigator.pushNewScreen(
    context,
    Builder(
      builder: (context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar('settings'.tr, context),
        body: SpaceAround(
          child: InkWell(
            onTap: () {
              buildLanguage(context);
            },
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 35, 35, 35),
                  border: Border.all(
                    color: Color.fromARGB(255, 125, 125, 125),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width * 0.24,
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: Colors.red)),
                    child: Icon(
                      Icons.language_rounded,
                      color: AppColors.textColor,
                      size: 55,
                    ),
                  ),
                  Container(
                    width: Get.width * 0.26,
                    child: Text(
                      'language'.tr,
                      style:
                          TextStyle(color: AppColors.textColor, fontSize: 20),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.37,
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
