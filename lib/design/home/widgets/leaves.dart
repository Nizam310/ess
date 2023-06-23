import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';

class Leaves extends StatelessWidget {
  const Leaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Leave> leaveData = [
      Leave(name: "Annual", taken: 5, total: 15),
      Leave(name: "Casual", taken: 2, total: 10),
      Leave(name: "Sick", taken: 3, total: 12),
      Leave(name: "Hajj", taken: 0, total: 5),
    ];
    final colorScheme = Theme.of(context).colorScheme;
    return PopupMenuButton<Leave>(
        child: Text(
          'Full Details',
          style:
              context.textTheme.bodySmall?.copyWith(color: colorScheme.primary),
        ),
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem<Leave>(
              enabled: false,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 60,
                          child: Text(
                            'Leave Type',
                            style: context.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                          width: 50,
                          child: Text(
                            'Taken',
                            style: context.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                          width: 50,
                          child: Text(
                            'Total',
                            style: context.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            ...leaveData.map((Leave leave) {
              return PopupMenuItem<Leave>(
                value: leave,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 60,
                            child: Text(
                              leave.name,
                              style: context.textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            width: 50,
                            child: Text(
                              '${leave.taken}',
                              style: context.textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            width: 50,
                            child: Text(
                              '${leave.total}',
                              style: context.textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ];
        });
  }
}

class Leave {
  final String name;
  final int taken;
  final int total;

  Leave({required this.name, required this.taken, required this.total});
}
