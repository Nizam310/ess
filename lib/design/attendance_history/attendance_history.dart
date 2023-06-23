import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AttendanceHistory extends StatelessWidget {
  const AttendanceHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> list = [
      {
        'name': 'Nisam',
        'clockIn': '09:30 AM',
        'clockOut': '06:30 PM',
        'date': '17/05/2023',
        'breakIn': '05:10 PM ',
        'breakOut': '05:30 PM',
        'total': '8',
      },
      {
        'name': 'Nisam',
        'clockIn': '09:30 AM',
        'clockOut': '06:30 PM',
        'date': '18/05/2023',
        'breakIn': '05:10 PM',
        'breakOut': '01:00 PM',
        'total': '7.9',
      },
      {
        'name': 'Nisam',
        'clockIn': '09:30 AM',
        'clockOut': '06:30 PM',
        'date': '19/05/2023',
        'breakIn': '05:10 PM',
        'breakOut': '01:00 PM',
        'total': '7.8',
      },
      {
        'name': 'Nisam',
        'clockIn': '09:30 AM',
        'clockOut': '06:30 PM',
        'date': '20/05/2023',
        'breakIn': '05:10 PM',
        'breakOut': '01:00 PM',
        'total': '7.6',
      },
      {
        'name': 'Nisam',
        'clockIn': '09:30 AM',
        'clockOut': '06:30 PM',
        'date': '21/05/2023',
        'breakIn': '05:10 PM',
        'breakOut': '01:00 PM',
        'total': '8.2',
      },
    ];
    final colorScheme = Theme.of(context).colorScheme;
    final color = colorScheme.onPrimary;
    final headStyle = context.textTheme.bodySmall
        ?.copyWith(color: color, fontWeight: FontWeight.bold);
    final style = context.textTheme.bodySmall?.copyWith(
      color: color,
      fontSize: 10,
    );
    final divColor = color;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      children: [
        Divider(
          color: divColor,
        ),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Text(
                'Date',
                style: headStyle,
                textAlign: TextAlign.center,
              )),
              VerticalDivider(
                color: divColor,
              ),
              Expanded(
                  child: Text(
                'Check-IN',
                style: headStyle,
                textAlign: TextAlign.center,
              )),
              VerticalDivider(
                color: divColor,
              ),
              Expanded(
                  child: Text(
                'Out',
                style: headStyle,
                textAlign: TextAlign.center,
              )),
              VerticalDivider(
                color: divColor,
              ),
              Expanded(
                  child: Text(
                'Break-IN',
                style: headStyle,
                textAlign: TextAlign.center,
              )),
              VerticalDivider(
                color: divColor,
              ),
              Expanded(
                  child: Text(
                'Out',
                style: headStyle,
                textAlign: TextAlign.center,
              )),
              VerticalDivider(
                color: divColor,
              ),
              Expanded(
                  child: Text(
                'Total',
                style: headStyle,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
        Divider(
          color: divColor,
        ),
        Column(children: [
          for (var e in list)
            Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Text(
                        e['date'],
                        style: style,
                        textAlign: TextAlign.center,
                      )),
                      VerticalDivider(
                        color: divColor,
                      ),
                      Expanded(
                          child: Text(
                        e['clockIn'],
                        style: style,
                        textAlign: TextAlign.center,
                      )),
                      VerticalDivider(
                        color: divColor,
                      ),
                      Expanded(
                          child: Text(
                        e['clockOut'],
                        style: style,
                        textAlign: TextAlign.center,
                      )),
                      VerticalDivider(
                        color: divColor,
                      ),
                      Expanded(
                          child: Text(
                        e['breakIn'],
                        style: style,
                        textAlign: TextAlign.center,
                      )),
                      VerticalDivider(
                        color: divColor,
                      ),
                      Expanded(
                          child: Text(
                        e['breakOut'],
                        style: style,
                        textAlign: TextAlign.center,
                      )),
                      VerticalDivider(
                        color: divColor,
                      ),
                      Expanded(
                          child: Text(
                        e['total'],
                        style: style,
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                ),
                Divider(
                  color: divColor,
                )
              ],
            )
        ]),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Card(
              child: SizedBox(
                  height: 50,
                  child: Center(
                      child: Text(
                    'Grand Total : 121.HRS',
                    style: context.textTheme.titleSmall
                        ?.copyWith(color: colorScheme.onPrimary),
                  )))),
        )
      ],
    );
  }
}
