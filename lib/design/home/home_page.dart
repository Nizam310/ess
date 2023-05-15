import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/button.dart';
import '../dash_board/dash_board_provider.dart';
import '../tasks/task_provider.dart';
import 'home_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer3<HomeVm, DashBoardVm, TaskVm>(
        builder: (context, data, dataDash, taskData, _) {
      List<MonthWidget> monthList = const [
        MonthWidget(text: "Jan", color: Colors.red),
        MonthWidget(text: "Feb", color: Colors.blue),
        MonthWidget(text: "Mar", color: Colors.orange),
        MonthWidget(text: "Apr", color: Colors.yellow),
        MonthWidget(text: "May", color: Colors.lightGreen),
        MonthWidget(text: "Jun", color: Colors.deepPurpleAccent),
        MonthWidget(text: "Jul", color: Colors.pink),
        MonthWidget(text: "Aug", color: Colors.greenAccent),
        MonthWidget(text: "Sep", color: Colors.purple),
        MonthWidget(text: "Oct", color: Colors.grey),
        MonthWidget(text: "Nov", color: Colors.brown),
        MonthWidget(text: "Dec", color: Colors.indigo),
      ];

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
          Column(
            children: [
              Row(
                children: const [
                  Expanded(
                      child: SizedBox(
                          height: 200,
                          width: 300,
                          child: LeaveGraphicalView())),
                ],
              ).paddingBottom(10),
              Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: monthList.map((e) => e).toList())
            ],
          ).paddingSymmetric(vertical: 10),
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
    const style = TextStyle(fontSize: 10);
    List<PieChartSectionData> data = [
      PieChartSectionData(
          title: "1", color: Colors.red, value: 1, titleStyle: style),
      PieChartSectionData(
          title: "2", color: Colors.blue, value: 2, titleStyle: style),
      PieChartSectionData(
          title: "3", color: Colors.orange, value: 3, titleStyle: style),
      PieChartSectionData(
          title: "4", color: Colors.yellow, value: 4, titleStyle: style),
      PieChartSectionData(
        title: "5",
        color: Colors.lightGreen,
        value: 1,
        titleStyle: style,
      ),
      PieChartSectionData(
          title: "6",
          color: Colors.deepPurpleAccent,
          value: 6,
          titleStyle: style),
      PieChartSectionData(
          title: "7", color: Colors.pink, value: 7, titleStyle: style),
      PieChartSectionData(
          title: "8", color: Colors.greenAccent, value: 8, titleStyle: style),
      PieChartSectionData(
          title: "9", color: Colors.purple, value: 9, titleStyle: style),
      PieChartSectionData(
          title: "10", color: Colors.grey, value: 10, titleStyle: style),
      PieChartSectionData(
          title: "11", color: Colors.brown, value: 11, titleStyle: style),
      PieChartSectionData(
          title: "12", color: Colors.indigo, value: 12, titleStyle: style),
    ];
    /*List<BarChartGroupData> data = [
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
    ];*/
    return PieChart(PieChartData(
            sectionsSpace: 0.26,
            centerSpaceRadius: 60,
            sections: data,
            pieTouchData: PieTouchData(
              enabled: true,
            )))

        /*BarChart(
            swapAnimationCurve: Curves.bounceIn,
            swapAnimationDuration: const Duration(minutes: 1),
            BarChartData(
                maxY: 30,
                borderData: FlBorderData(
                    */ /*border: Border.all(color: Colors.red),*/ /* show: true),
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
                  HorizontalRangeAnnotation(y1: 10, y2: 10)
                ]),
                alignment: BarChartAlignment.spaceEvenly,
                baselineY: 100,
                barGroups: data,
                barTouchData: BarTouchData(enabled: true)))*/
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
      width: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 10,
            width: 10,
            child: CircleAvatar(
              backgroundColor: color,
            ),
          ),
          Text(text)
        ],
      ),
    );
  }
}
