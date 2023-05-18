import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/button.dart';
import '../dash_board/dash_board_provider.dart';
import '../tasks/task_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
      List<MonthWidget> monthList = const [
        MonthWidget(
          text: "Total Leaves",
          color: Color(0xFF3BBFC0),
        ),
        MonthWidget(text: "Taken leaves", color: Colors.red),
        MonthWidget(text: "Available Leaves", color: Colors.green),
      ];

      return ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Consumer<TaskVm>(
            builder: (context,data,_) {
              return ExpansionTile(
                title: const Text(
                  "Pending Tasks",
                ),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) => Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: const Color(0xFF3BBFC0),
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text("Task")
                                                      .paddingBottom(5),
                                                  const Text("21/12/23")
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(data.timerText),
                                                  Center(
                                                    child: IconButton(
                                                      onPressed: () {
                                                        data.startStop();
                                                        data.refresh();
                                                      },
                                                      icon: Icon(data.isRunning
                                                          ? Icons.stop_circle
                                                          : Icons.play_circle),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ).paddingRight(20),
                                        ),
                                      ),
                                    ],
                                  )),
                        ),
                      ),
                    ],
                  ),
                  CusButton(
                      text: "Show More",
                      onTap: () {
                        context.read<DashBoardVm>().index=5;
                        context.read<DashBoardVm>().refresh();
                      })
                ],
              ).paddingSymmetric(vertical: 5);
            }
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF3BBFC0))),
            width: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 10,
                            runSpacing: 10,
                            children: monthList.map((e) => e).toList()),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Expanded(
                        child: SizedBox(
                            height: 200,
                            child: LeaveGraphicalView())),
                  ],
                ).paddingBottom(20),
              ],
            ).paddingSymmetric(vertical: 10),
          ),
          ListTile(
            tileColor: const Color(
              0xFF3BBFC0,
            ),
            title: const Text(
              "Apply for leave",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            onTap: () {

              context.read<DashBoardVm>().index=2;
              context.read<DashBoardVm>().refresh();
            },
          ).paddingSymmetric(vertical: 10),
        ],
      );
    });
  }
}

class LeaveGraphicalView extends StatelessWidget {
  const LeaveGraphicalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 10);

    List<BarChartGroupData> data = [
      BarChartGroupData(x: 10, barRods: [
        BarChartRodData(
          toY: 10,
          color: const Color(0xFF3BBFC0),
        ),
        BarChartRodData(toY: 5, color: Colors.red),
        BarChartRodData(toY: 5, color: Colors.green),
      ]),
      BarChartGroupData(x: 20, barRods: [
        BarChartRodData(
          toY: 10,
          color: const Color(0xFF3BBFC0),
        ),
        BarChartRodData(toY: 8, color: Colors.red),
        BarChartRodData(toY: 2, color: Colors.green),
      ]),
      BarChartGroupData(x: 30, barRods: [
        BarChartRodData(
          toY: 5,
          color: const Color(0xFF3BBFC0),
        ),
        BarChartRodData(toY: 3, color: Colors.red),
        BarChartRodData(toY: 2, color: Colors.green),
      ]),
      BarChartGroupData(x: 40, barRods: [
        BarChartRodData(
          toY: 10,
          color: const Color(0xFF3BBFC0),
        ),
        BarChartRodData(toY: 5, color: Colors.red),
        BarChartRodData(toY: 5, color: Colors.green),
      ]),
      BarChartGroupData(x: 50, barRods: [
        BarChartRodData(
          toY: 10,
          color: const Color(0xFF3BBFC0),
        ),
        BarChartRodData(toY: 7, color: Colors.red),
        BarChartRodData(toY: 3, color: Colors.green),
      ]),
    ];
    return BarChart(
            swapAnimationCurve: Curves.bounceIn,
            swapAnimationDuration: const Duration(minutes: 1),
            BarChartData(
                maxY: 15,
                borderData: FlBorderData(
                    border: Border.all(color: const Color(0xFF5F6E86)),
                    show: true),
                gridData: FlGridData(
                  verticalInterval: 1,
                  // horizontalInterval: 1,
                  show: true,
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    axisNameWidget: MediaQuery.of(context).size.width > 240
                        ? Column(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Maternity",
                                      style: style,
                                    ),
                                    Text(
                                      "Haj",
                                      style: style,
                                    ),
                                    Text(
                                      "Sick",
                                      style: style,
                                    ),
                                    Text(
                                      "Annual",
                                      style: style,
                                    ),
                                    Text(
                                      "Paternity",
                                      style: style,
                                    ),
                                  ],
                                ).paddingSymmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width < 500
                                            ? 30
                                            : 70),
                              ),
                            ],
                          )
                        : const Text(""),
                  ),
                  topTitles: AxisTitles(axisNameWidget: const Text("")),
                //  leftTitles: AxisTitles(axisNameWidget: const Text("")),
                  rightTitles: AxisTitles(axisNameWidget: const Text("")),
                ),
                rangeAnnotations: RangeAnnotations(horizontalRangeAnnotations: [
                  HorizontalRangeAnnotation(y1: 10, y2: 10)
                ]),
                alignment: BarChartAlignment.spaceEvenly,
                // baselineY: 100,
                barGroups: data,
                barTouchData: BarTouchData(enabled: true)))
        .paddingSymmetric(vertical: 10);
  }
}

class MonthWidget extends StatelessWidget {
  final Color color;
  final String text;

  const MonthWidget({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
            child: CircleAvatar(
              backgroundColor: color,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
