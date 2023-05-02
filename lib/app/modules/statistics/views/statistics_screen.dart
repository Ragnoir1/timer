part of 'statistics_view.dart';

buildStatistic(BuildContext context, List<DataJob> list, String label) {
  const double crossAxisSpacing = 40;
  const double contentPadding = 20;
  BarNavigator.pushNewScreen(
    context,
    Builder(
      builder: (context) => SpaceAround(
        appBar: CustomAppBar(
          size: MediaQuery.of(context).size.height * 0.12,
          bottom: Text(
            label,
            style: TextStyle(
              fontSize: 40,
              color: AppColors.textColor,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.green)),
              height: ((Get.width / 2) - 40) * 2,
              child: SingleChildScrollView(
                child: StaggeredGrid.count(
                  mainAxisSpacing: 0,
                  crossAxisSpacing: crossAxisSpacing,
                  crossAxisCount: 2,
                  children: [
                    ...list.mapIndexed((index, e) => StaggeredGridTile.count(
                          mainAxisCellCount: ((Get.width -
                                  (contentPadding * 2) -
                                  (crossAxisSpacing)) /
                              Get.width),
                          crossAxisCellCount: ((index + 1) == list.length) &
                                  (list.length % 2 != 0)
                              ? 2
                              : 1,
                          child: Container(
                            padding: EdgeInsets.zero,
                            alignment: ((index + 1) == list.length) &
                                    (list.length % 2 != 0)
                                ? Alignment.center
                                : index % 2 != 0
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: StatisticSingleTimeWidget(
                              work: list[index],
                              colors: StatisticsController.to.colors[index % 4],
                            ),
                          ),
                        ))
                  ],
                ),
              ).paddingSymmetric(horizontal: contentPadding),
            ).paddingOnly(top: 100),
            Container(child: StatisticAllTimeWidget(list: list))
                .paddingOnly(top: 30),
          ],
        ),
      ),
    ),
  );
}

CustomAppBar _appBarStatistic(BuildContext context, String text) {
  return CustomAppBar(
    size: MediaQuery.of(context).size.height * 0.2,
    title: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
        shadows: [
          Shadow(
            offset: Offset(0, 2),
            color: Color.fromARGB(80, 0, 0, 0),
          )
        ],
      ),
    ),
  );
}
