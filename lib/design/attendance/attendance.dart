import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant/decoration_card.dart';
import '../../constant/enum.dart';
import '../../constant/themes/theme.dart';

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
      backgroundColor: colorScheme.surface,
      bottomSheet: DecorationCard(
        height: 350,
        child: Card(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '7 Jul,2021',
                              style: context.textTheme.labelMedium
                                  ?.copyWith(color: colorScheme.inversePrimary),
                            ),
                            Text(
                              '09:41:22 AM',
                              style: context.textTheme.headlineMedium?.copyWith(
                                  color: colorScheme.inversePrimary,
                                  fontWeight: FontWeight.w400),
                            ).paddingSymmetric(vertical: 5),
                            Text(
                              'UTC/GMT +3 hours',
                              style: context.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.outline.withOpacity(0.5)),
                              textAlign: TextAlign.center,
                            ).paddingSymmetric(vertical: 5),
                            Text(
                              '4,Yackoub Muanmer St Yaish Commercial\n Center Amman',
                              style: context.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.outline.withOpacity(0.5)),
                              textAlign: TextAlign.center,
                            ).paddingSymmetric(vertical: 5),
                          ],
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
      body: /*const LocationView()*/const SizedBox(),
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
    final themePro = ThemeNotifier.of(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: themePro.themeMode == ThemeModeType.dark
            ? LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                    const Color(0xFF34779D).withOpacity(0.1),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    const Color(0xFF34779D).withOpacity(0.1),
                  ])
            : const LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
              ]),
        border: Border.all(color: const Color(0xFF34779D), width: 0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.5)),
          ),
          Text(
            value,
            textAlign: TextAlign.end,
            style: context.textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
