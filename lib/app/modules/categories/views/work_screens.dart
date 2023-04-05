part of 'categories_view.dart';

Builder buildListWork(List<DataJob> list, CategoriesController controller, Function() cash) {
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
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 450,
                child: ListView.separated(
                  itemCount: list.length,
                  controller: controller.listViewController,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
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
                      controller.deletIndexWork(list, index);
                    },
                    onTap: () {
                      list[index].internet == null
                          ? showMyDialog(context, list, index)
                          : HomeController.to.bottomNavigationBarController
                              .jumpToTab(1);
                      TimerController.to.dataUsed.value = list[index];
                    },
                  ),
                ),
              ).paddingOnly(top: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: const Icon(
            Icons.add,
            size: 40,
          ),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [Color(0xFFFb274ff), Color(0xFFe016ff)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ),
        onPressed: () {
          BarNavigator.pushNewScreen(
              context, buildTextFieldScreen(list, controller, context, cash));
        },
      ),
    ),
  );
}

Builder buildTextFieldScreen(List<DataJob> list,
    CategoriesController controller, BuildContext context, Function() cash) {
  return Builder(
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
              child: const Text("Добавить"),
              onPressed: () {
                controller.addWork(list);
                cash;
                // saveJobCash(list);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    ),
  );
}

Future showMyDialog(BuildContext context, List<DataJob> list, int index) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: const Color.fromARGB(64, 0, 0, 0),
        alignment: Alignment.topCenter,
        insetPadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        elevation: 0,
        child: Container(
          height: 700,
          width: Get.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(37),
                  bottomRight: Radius.circular(37))),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4.5,
              sigmaY: 4.5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Требуется ли\n вам интернет\n для вашего\n занятия?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ).paddingOnly(top: 30),
                SimpleButton(
                  text: "Нет",
                  colors: const [Color(0xff50ff77), Color(0xb550eaff)],
                  fontSize: 40,
                  onTap: () {
                    list[index].internet = false;
                    hideDialog(context, list, index);
                  },
                ).paddingOnly(top: 75),
                SimpleButton(
                  text: "Да",
                  colors: const [Color(0xffff4747), Color(0xffff7373)],
                  onTap: () {
                    list[index].internet = true;
                    hideDialog(context, list, index);
                  },
                ).paddingOnly(top: 16),
                SimpleButton(
                  text: "Skip",
                  colors: const [
                    Colors.white,
                    Color.fromARGB(255, 226, 226, 226)
                  ],
                  textColor: Colors.black,
                  height: 30,
                  width: 78,
                  fontSize: 16,
                  borderRadius: 7,
                  onTap: () {
                    HomeController.to.bottomNavigationBarController
                        .jumpToTab(1);
                    TimerController.to.dataUsed.value = list[index];
                  },
                ).paddingOnly(top: 16)
              ],
            ),
          ),
        ),
      );
    },
  );
}

hideDialog(BuildContext context, List<DataJob> list, int index) {
  Navigator.of(context).pop();
  HomeController.to.bottomNavigationBarController.jumpToTab(1);
  TimerController.to.dataUsed.value = list[index];

  TimerController.to.refresh();
}
