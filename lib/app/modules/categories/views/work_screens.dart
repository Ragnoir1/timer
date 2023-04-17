part of 'categories_view.dart';

Builder buildListWork(
    List<DataJob> list, CategoriesController controller, JobType type) {
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
                alignment: Alignment.topCenter,
                height: 400,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: list.length,
                  controller: controller.listViewController,
                  itemBuilder: (context, index) => CardCategory(
                    colors: [
                      CategoriesController.to.getLeftColor(index * 2),
                      CategoriesController.to.getRightColor(index * 2),
                    ],
                    label: list[index].label!,
                    delete: () {
                      controller.deletIndexWork(list, index, type);
                    },
                    onTap: () {
                      list[index].internet == null
                          ? showMyDialog(context, controller, list, index, type)
                          : HomeController.to.bottomNavigationBarController
                              .jumpToTab(1);
                      TimerController.to.dataUsed.value = list[index];
                    },
                  ).paddingOnly(top: 25, left: 20, right: 20),
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
              context, buildTextFieldScreen(list, controller, context, type));
        },
      ),
    ),
  );
}

Builder buildTextFieldScreen(List<DataJob> list,
    CategoriesController controller, BuildContext context, JobType type) {
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
            InkWell(
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    "Добавить",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                controller.controllerTextField.text.isEmpty
                    ? {}
                    : {
                        controller.addWork(list, type),
                        controller.saveJobCash(list, type),
                        Navigator.pop(context)
                      };
              },
            ).paddingOnly(top: 20)
          ],
        ),
      ),
    ),
  );
}

Future showMyDialog(BuildContext context, CategoriesController controller,
    List<DataJob> list, int index, JobType type) async {
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
                    controller.saveJobCash(list, type);
                    hideDialog(context, list, index);
                    print(list[index]);
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
                    list[index].internet = true;
                    hideDialog(context, list, index);
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
