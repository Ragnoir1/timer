part of 'timer_view.dart';

buildLanguage(BuildContext context) {
  BarNavigator.pushNewScreen(
    context,
    Builder(
      builder: (context) => SpaceAround(
        appBar: CustomAppBar(
          size: MediaQuery.of(context).size.height * 0.2,
          bottom: Text(
            LocaleKeys.choose_your_languege.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: AppColors.textColor,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageButton(
              flag: russian,
              language: "Русский",
              locale: 'ru',
            ),
            LanguageButton(
              flag: british,
              language: "English",
              locale: 'en',
            ).paddingOnly(top: 30)
          ],
        ),
      ),
    ),
  );
}
