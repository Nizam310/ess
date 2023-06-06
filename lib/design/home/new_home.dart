import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant/decoration_card.dart';
import '../dash_board/dash_board_screen.dart';
import '../dash_board/widgets/toggle_button.dart';

class NewHome extends StatelessWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'CloudMe',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primaryContainer),
                  ),
                  TextSpan(
                    text: 'HR',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary),
                  )
                ],
                style: context.textTheme.labelSmall,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const ToggleButton(),
                const NotificationMenu(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://picsum.photos/seed/540/600',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(vertical: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Welcome,  Sarah',
              style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w400, color: colorScheme.surface),
            ).paddingTop(10),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your remaining balance',
              style: context.textTheme.bodySmall
                  ?.copyWith(color: colorScheme.primary),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'Full Details',
                style: context.textTheme.bodySmall
                    ?.copyWith(color: colorScheme.primary),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10),
        Row(
          children: [
            Expanded(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 10.0,
                runSpacing: 10.0,
                children: const [
                  _DayDetailsCard(
                    title: 'Annual Vacation for',
                    value: '18.34',
                    subValue: '21.00',
                  ),
                  _DayDetailsCard(
                    title: 'Sick Days',
                    value: '12.00',
                    subValue: '14.00',
                  ),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(vertical: 10),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
          child: Text(
            'What  would you like to do?',
            style: context.textTheme.bodyMedium
                ?.copyWith(color: colorScheme.primary),
          ),
        ),
        SizedBox(
          height: 240,
          child: Column(
            children: [
              Expanded(
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  scrollDirection: Axis.vertical,
                  children: const [
                    _CustomCardGrid(
                      icon: CupertinoIcons.hourglass,
                      title: 'Requests',
                      iconColor: Color(0xFF3CD6D4),
                    ),
                    _CustomCardGrid(
                      icon: Icons.wallet_outlined,
                      title: 'Payroll',
                      iconColor: Color(0xFFEF9D87),
                    ),
                    _CustomCardGrid(
                      icon: Icons.file_copy_outlined,
                      title: 'Documents',
                      iconColor: Color(0xFF8CD0FB),
                    ),
                    _CustomCardGrid(
                      icon: CupertinoIcons.calendar,
                      title: 'Attendance',
                      iconColor: Color(0xFFEB4E3F),
                    ),
                    _CustomCardGrid(
                      icon: CupertinoIcons.timer_fill,
                      title: 'Schedule',
                      iconColor: Color(0xFFFA9E3A),
                    ),
                    _CustomCardGrid(
                      icon: CupertinoIcons.person_solid,
                      title: 'Profile',
                      iconColor: Color(0xFFA06CF7),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          'Pending requests',
          style:
              context.textTheme.bodySmall?.copyWith(color: colorScheme.primary),
        ).paddingSymmetric(vertical: 5),
        Row(
          children: const [
            Expanded(child: _RequestWidget()),
          ],
        )
      ],
    ).paddingSymmetric(horizontal: 12);
  }
}

class _CustomCardGrid extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;

  const _CustomCardGrid(
      {Key? key,
      required this.title,
      required this.icon,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecorationCard(
      radius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
          Text(
            title,
            style: context.textTheme.bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}

class _DayDetailsCard extends StatelessWidget {
  final String title;
  final String value;
  final String subValue;

  const _DayDetailsCard(
      {Key? key,
      required this.title,
      required this.value,
      required this.subValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecorationCard(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: colorScheme.primary),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$value/',
                  style: context.textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: subValue,
                  style: const TextStyle(),
                )
              ],
              style: context.textTheme.bodySmall
                  ?.copyWith(color: colorScheme.primary),
            ),
          ).paddingSymmetric(vertical: 10),
          Text(
            'Days',
            style: context.textTheme.bodySmall
                ?.copyWith(color: colorScheme.primary),
          ),
        ],
      ),
    );
  }
}

class _RequestWidget extends StatelessWidget {
  const _RequestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => const _RequestCard()),
          ),
        ),
      ],
    );
  }
}

class _RequestCard extends StatelessWidget {
  const _RequestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecorationCard(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jun 16,2023-Jun 18,2023',
                    style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary)),
                Text('Going on vacation',
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: colorScheme.outline)),
                Row(
                  children: [
                    Text(
                      'Annual leave',
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: colorScheme.outline),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: colorScheme.primary)),
                      child: Text('pending',
                              style: context.textTheme.labelMedium
                                  ?.copyWith(color: colorScheme.tertiary))
                          .paddingAll(5),
                    )
                  ],
                ),
              ],
            ),
            InkWell(
                onTap: () {},
                child: Icon(
                  Icons.more_vert,
                  color: colorScheme.primary,
                )),
          ],
        ));
  }
}
