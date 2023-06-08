import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant/decoration_card.dart';

class Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final List<Map> list = [
      {
        'title': 'Clock-in',
        'value': '09:30:21 AM',
      },
      {
        'title': 'Smoke break start',
        'value': '__ : __',
      },
      {
        'title': 'Smoke break end',
        'value': '__ : __',
      },
      {
        'title': 'Clock-out',
        'value': '__ : __',
      },
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: const [
        //  LocationView(),
        ],
      ),
      bottomSheet: DecorationCard(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        radius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: SizedBox(
          height: 350,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DecorationCard(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '7 Jul,2021',
                                style: context.textTheme.labelMedium
                                    ?.copyWith(color: colorScheme.primary),
                              ),
                              Text(
                                '09:41:22 AM',
                                style: context.textTheme.titleLarge
                                    ?.copyWith(color: colorScheme.primary),
                              ),
                              Text(
                                'UTC/GMT +3 hours',
                                style: context.textTheme.bodySmall
                                    ?.copyWith(color: colorScheme.primary),
                                textAlign: TextAlign.center,
                              ).paddingSymmetric(vertical: 5),
                              Text(
                                '4,Yackoub Muanmer St Yaish Commercial\n Center Amman',
                                style: context.textTheme.bodySmall
                                    ?.copyWith(color: colorScheme.primary),
                                textAlign: TextAlign.center,
                              ).paddingSymmetric(vertical: 5),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: 270,
                        child: GridView.builder(
                            itemCount: list.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.5),
                            itemBuilder: (context, index) => SizedBox(
                                height: 10,
                                child: _CustomCard(
                                    title: list[index]['title'],
                                    value: list[index]['value']))),
                      ))
                    ],
                  ).paddingSymmetric(vertical: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String title;
  final String value;

  const _CustomCard({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecorationCard(
      padding: const EdgeInsets.all(5),
      radius: BorderRadius.circular(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.textTheme.bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          Text(
            value,
            textAlign: TextAlign.end,
            style: context.textTheme.bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          )
        ],
      ),
    );
  }
}
