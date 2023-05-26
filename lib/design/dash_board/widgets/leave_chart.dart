import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/colors.dart';

class LeaveChart extends StatelessWidget {
  const LeaveChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MonthWidget> monthList =  [
      MonthWidget(
        text: "Total Leaves",
        color: ColorS.primary,
      ),
      MonthWidget(text: "Taken leaves", color: ColorS.error),
      MonthWidget(text: "Available Leaves", color: Colors.green),
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
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
      ).paddingSymmetric(vertical: 10,horizontal: 10),
    );
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
          color: ColorS.primary,
        ),
        BarChartRodData(toY: 5, color: Colors.red),
        BarChartRodData(toY: 5, color: Colors.green),
      ]),
      BarChartGroupData(x: 20, barRods: [
        BarChartRodData(
          toY: 10,
          color: ColorS.primary,
        ),
        BarChartRodData(toY: 8, color: Colors.red),
        BarChartRodData(toY: 2, color: Colors.green),
      ]),
      BarChartGroupData(x: 30, barRods: [
        BarChartRodData(
          toY: 5,
          color:ColorS.primary,
        ),
        BarChartRodData(toY: 3, color: Colors.red),
        BarChartRodData(toY: 2, color: Colors.green),
      ]),
      BarChartGroupData(x: 40, barRods: [
        BarChartRodData(
          toY: 10,
          color: ColorS.primary,
        ),
        BarChartRodData(toY: 5, color: Colors.red),
        BarChartRodData(toY: 5, color: Colors.green),
      ]),
      BarChartGroupData(x: 50, barRods: [
        BarChartRodData(
          toY: 10,
          color: ColorS.primary,
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
              // verticalInterval: 1,
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
              leftTitles: AxisTitles(axisNameWidget: const Text("")),
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
