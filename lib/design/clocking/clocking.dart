import 'package:employee_self_service_flutter/design/tasks/location/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../tasks/location/location.dart';

class Clocking extends StatelessWidget {
  const Clocking({Key? key}) : super(key: key);

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
      backgroundColor: colorScheme.background,
      body: const LocationView(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        height: 350,
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
                                ?.copyWith(color: colorScheme.onPrimary),
                          ),
                          Text(
                            '09:41:22 AM',
                            style: context.textTheme.headlineMedium?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.w700),
                          ).paddingSymmetric(vertical: 5),
                          Text(
                            context.select((LocationVm value) =>
                                value.address ?? 'No Data'),
                            style: context.textTheme.labelSmall
                                ?.copyWith(color: colorScheme.outlineVariant),
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.textTheme.bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          Text(
            value,
            textAlign: TextAlign.end,
            style: context.textTheme.bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          )
        ],
      ),
    );
  }
}
