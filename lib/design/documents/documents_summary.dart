import 'package:employee_self_service_flutter/design/dash_board/dash_board_provider.dart';
import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class DocumentsSummary extends StatelessWidget {
  const DocumentsSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> list = [
      {
        'name': 'Aadhaar',
        'added': '17/05/2022',
        'expires': '17/05/2023',
        'date': '17/05/2023',
        'daysLeft': '20',
      },
      {
        'name': 'Pan Card',
        'added': '17/05/2022',
        'expires': '17/05/2023',
        'date': '18/05/2023',
        'daysLeft': '20',
      },
      {
        'name': 'Visa',
        'added': '17/05/2022',
        'expires': '17/05/2023',
        'date': '19/05/2023',
        'daysLeft': '20',
      },
      {
        'name': 'Passport',
        'added': '17/05/2022',
        'expires': '17/05/2023',
        'date': '20/05/2023',
        'daysLeft': '20',
      },
      {
        'name': 'Licence',
        'added': '17/05/2022',
        'expires': '17/05/2023',
        'date': '21/05/2023',
        'daysLeft': '20',
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
        Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                context.read<DashBoardVm>().index = 13;
                context.read<DashBoardVm>().refresh();
              },
              child: const Text('Attach Document'),
            )),
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
                'Name',
                style: headStyle,
                textAlign: TextAlign.center,
              )),
              VerticalDivider(
                color: divColor,
              ),
              Expanded(
                  child: Text(
                'Added',
                style: headStyle,
                textAlign: TextAlign.center,
              )),
              VerticalDivider(
                color: divColor,
              ),
              Expanded(
                  child: Text(
                'Expires',
                style: headStyle,
                textAlign: TextAlign.center,
              )),
              VerticalDivider(
                color: divColor,
              ),
              Expanded(
                  child: Text(
                'Days Left',
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
                        e['name'],
                        style: style,
                        textAlign: TextAlign.center,
                      )),
                      VerticalDivider(
                        color: divColor,
                      ),
                      Expanded(
                          child: Text(
                        e['added'],
                        style: style,
                        textAlign: TextAlign.center,
                      )),
                      VerticalDivider(
                        color: divColor,
                      ),
                      Expanded(
                          child: Text(
                        e['expires'],
                        style: style,
                        textAlign: TextAlign.center,
                      )),
                      VerticalDivider(
                        color: divColor,
                      ),
                      Expanded(
                          child: Text(
                        e['daysLeft'],
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
      ],
    );
  }
}
