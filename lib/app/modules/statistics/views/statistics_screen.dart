part of 'statistics_view.dart';

buildStatistic(BuildContext context, List<DataJob> list, String label) {
  const double crossAxisSpacing = 40;
  const double contentPadding = 20;
  BarNavigator.pushNewScreen(
      context,
      Builder(
        builder: (context) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(),
          body: SpaceAround(
            child: Column(
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 40, color: AppColors.textColor),
                ).paddingOnly(top: 80),
                Container(
                  height: ((Get.width / 2) - 40) * 2,
                  child: SingleChildScrollView(
                    child: StaggeredGrid.count(
                      mainAxisSpacing: 0,
                      crossAxisSpacing: crossAxisSpacing,
                      crossAxisCount: 2,
                      children: [
                        ...list
                            .mapIndexed((index, e) => StaggeredGridTile.count(
                                  mainAxisCellCount: ((Get.width -
                                          (contentPadding * 2) -
                                          (crossAxisSpacing)) /
                                      Get.width),
                                  crossAxisCellCount:
                                      ((index + 1) == list.length) &
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
                                      colors: StatisticsController
                                          .to.colors[index % 4],
                                    ),
                                  ),
                                ))
                      ],
                    ),
                  ).paddingSymmetric(horizontal: contentPadding),
                ).paddingOnly(top: 50),
                StatisticAllTimeWidget(list: list),
              ],
            ),
          ),
        ),
      ));
}
