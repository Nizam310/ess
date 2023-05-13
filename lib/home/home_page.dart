import 'package:employee_self_service_flutter/common_widgets/button.dart';
import 'package:employee_self_service_flutter/tasks/task_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../dash_board/dash_board_provider.dart';
import 'home_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer3<HomeVm, DashBoardVm, TaskVm>(
        builder: (context, data, dataDash, taskData, _) {
      return ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ExpansionTile(
            title: const Text("Pending Tasks"),
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 300,
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
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            width: 0.2,
                                            color: Colors.grey.shade400,
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
                                              Text(taskData.timerText),
                                              Center(
                                                child: IconButton(
                                                  onPressed: () {
                                                    taskData.startStop();
                                                  },
                                                  icon: Icon(taskData.isRunning
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
                    dataDash.index = 5;
                    dataDash.refresh();
                  })
            ],
          ).paddingSymmetric(vertical: 5),
          /*const ListTile(
            title: Text("Leave Balance :   ${'5'}"),
          ).paddingSymmetric(vertical: 5),*/
          Row(
            children: const [
              Expanded(
                  child: SizedBox(
                      height: 300, width: 300, child: LeaveGraphicalView())),
            ],
          ),
          ListTile(
            tileColor: const Color(0xFF4C4C4A),
            hoverColor: const Color(0xFF6B6B68),
            title: const Text(
              "Apply for leave",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              dataDash.index = 2;
              dataDash.refresh();
            },
          ).paddingSymmetric(vertical: 5),
        ],
      );
    });
  }
}

class LeaveGraphicalView extends StatelessWidget {
  const LeaveGraphicalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> data = [
      BarChartGroupData(x: 10, barRods: [
        BarChartRodData(toY: 10, color: Colors.red),
        BarChartRodData(
          toY: 1,
        ),
      ]),
      BarChartGroupData(x: 20, barRods: [
        BarChartRodData(toY: 50, color: Colors.red),
        BarChartRodData(toY: 6),
      ]),
      BarChartGroupData(x: 30, barRods: [
        BarChartRodData(toY: 5, color: Colors.red),
        BarChartRodData(toY: 6),
      ]),
      BarChartGroupData(x: 40, barRods: [
        BarChartRodData(toY: 5, color: Colors.red),
        BarChartRodData(toY: 6),
      ]),
      BarChartGroupData(x: 50, barRods: [
        BarChartRodData(toY: 5, color: Colors.red),
        BarChartRodData(toY: 6),
      ]),
    ];

    return BarChart(
            swapAnimationCurve: Curves.bounceIn,
            swapAnimationDuration: const Duration(minutes: 1),
            BarChartData(
                maxY: 100,
                borderData: FlBorderData(
                    border: Border.all(color: Colors.red), show: true),
                gridData: FlGridData(
                  show: true,
                ),
                groupsSpace: 1000,
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                      axisNameWidget: SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "Jan",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Feb",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Mar",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Apr",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "May",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 35),
                  )),
                  topTitles: AxisTitles(axisNameWidget: const Text("")),
                  leftTitles: AxisTitles(axisNameWidget: const Text("")),
                  rightTitles: AxisTitles(axisNameWidget: const Text("")),
                ),
                rangeAnnotations: RangeAnnotations(horizontalRangeAnnotations: [
                  HorizontalRangeAnnotation(y1: 70, y2: 60)
                ]),
                alignment: BarChartAlignment.spaceEvenly,
                baselineY: 100,
                barGroups: data,
                barTouchData: BarTouchData(enabled: true)))
        .paddingSymmetric(vertical: 10);
  }
}
