part of 'categories_view.dart';

Builder buildWorkScreen(List<DataJob> list, CategoriesController controller) {
  return Builder(
    builder: (context) => Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: SpaceAround(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                list.isEmpty ? "Добавьте занятие" : "Выберите занятие",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 450,
                child: ListView.separated(
                  itemCount: list.length,
                  controller: controller.listViewController,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) => CardCategory(
                    colors: [
                      CategoriesController.to.getLeftColor(index),
                      CategoriesController.to.getRightColor(index),
                    ],
                    label: list[index].label!,
                    delete: () {
                      list.removeAt(index);
                    },
                    onTap: () {
                      list[index].internet == null
                          ? BarNavigator.pushNewScreen(
                              context,
                              buildIsInternetWork(list, controller, index),
                            )
                          : HomeController.to.bottomNavigationBarController
                              .jumpToTab(1);
                      TimerController.to.dataUsed.value = list[index];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.add,
            size: 40,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Color(0xFFFb274ff), Color(0xFFe016ff)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ),
        onPressed: () {
          BarNavigator.pushNewScreen(
            context,
            Builder(
              builder: (_) => Scaffold(
                extendBodyBehindAppBar: true,
                appBar: CustomAppBar(),
                body: SpaceAround(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        textEditingController: controller.controllerTextField,
                      ).paddingSymmetric(horizontal: 50),
                      MaterialButton(
                        color: Colors.white,
                        child: Text("Добавить"),
                        onPressed: () {
                          controller.addWork(list);
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
 
Widget buildIsInternetWork(
    List<DataJob> list, CategoriesController controller, int index) {
  return Builder(
    builder: (_) => Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: SpaceAround(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Требуется ли\n вам интернет\n для вашего\n занятия?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            SimpleButton(
              text: "Нет",
              colors: [Color(0xff50ff77), Color(0xb550eaff)],
              fontSize: 40,
              onTap: ()  {
                list[index].internet = false;

                HomeController.to.bottomNavigationBarController.jumpToTab(1);
                TimerController.to.dataUsed.value = list[index];
                TimerController.to.refresh();
              },
            ).paddingOnly(top: 50),
            SimpleButton(
              text: "Да",
              colors: [Color(0xffff4747), Color(0xffff7373)],
              onTap: () {
                list[index].internet = true;
                HomeController.to.bottomNavigationBarController.jumpToTab(1);
                TimerController.to.dataUsed.value = list[index];
                TimerController.to.refresh();
              },
            ).paddingOnly(top: 16),
            SimpleButton(
              text: "Skip",
              colors: [Colors.white, Color.fromARGB(255, 226, 226, 226)],
              textColor: Colors.black,
              height: 30,
              width: 78,
              fontSize: 16,
              borderRadius: 7,
              onTap: () {
                HomeController.to.bottomNavigationBarController.jumpToTab(1);
                TimerController.to.dataUsed.value = list[index];
              },
            ).paddingOnly(top: 200, left: 250)
          ],
        ),
      ),
    ),
  );
}
