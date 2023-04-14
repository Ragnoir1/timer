part of 'statistics_view.dart';

buildStatistic(BuildContext context, List<DataJob> list) {
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
                  "Работа",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ).paddingOnly(top: 100),
                Container(
                  height: 450,
                  child: SingleChildScrollView(
                    child: StaggeredGrid.count(
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 40,
                      crossAxisCount: 2,
                      children: [
                        ...list
                            .mapIndexed((index, e) => StaggeredGridTile.count(
                                  mainAxisCellCount: 1,
                                  crossAxisCellCount:
                                      ((index + 1) == list.length) &
                                              (list.length % 2 != 0)
                                          ? 2
                                          : 1,
                                  child: Container(
                                    alignment: ((index + 1) == list.length) &
                                            (list.length % 2 != 0)
                                        ? Alignment.center
                                        : index % 2 != 0
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.red)),
                                    child:
                                        // Container(
                                        //   height: 150,
                                        //   width: 150,
                                        //   color: Colors.white,
                                        // )
                                        StatisticSingleTimeWidget(
                                            work: list[index]),
                                  ),
                                ))
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 20),
                ).paddingOnly(top: 50),
                StatisticAllTimeWidget(list: list),
              ],
            ),
          ),
        ),
      ));
}
