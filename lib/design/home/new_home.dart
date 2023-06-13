import 'package:employee_self_service_flutter/constant/themes/theme.dart';
import 'package:employee_self_service_flutter/design/dash_board/dash_board_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../constant/enum.dart';
import '../dash_board/dash_board_screen.dart';
import '../dash_board/widgets/toggle_button.dart';

class NewHome extends StatelessWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(2),
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
                    style: MediaQuery.of(context).size.width < 330
                        ? Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: colorScheme.onPrimary)
                        : Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: colorScheme.onPrimary),
                  ),
                  TextSpan(
                    text: 'HR',
                    style: MediaQuery.of(context).size.width < 330
                        ? Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary)
                        : Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
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
                const NotificationMenu().paddingSymmetric(horizontal: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: InkWell(
                    onTap: () {
                      context.read<DashBoardVm>().index = 1;
                      context.read<DashBoardVm>().refresh();
                    },
                    child: Image.network(
                      'https://picsum.photos/seed/540/600',
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Welcome,  Sarah',
              style: MediaQuery.of(context).size.width < 360
                  ? Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: colorScheme.onPrimary)
                  : context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onPrimary),
            ).paddingOnly(top: 10, left: 5),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your remaining balance',
              style: context.textTheme.bodySmall
                  ?.copyWith(color: colorScheme.onPrimary),
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
          children: const [
            Expanded(child: _LeaveTypesCarousel()),
          ],
        ).paddingSymmetric(vertical: 10),
        Text(
          'What  would you like to do?',
          style: context.textTheme.bodyMedium
              ?.copyWith(color: colorScheme.onPrimary),
        ).paddingSymmetric(vertical: 10),
        Consumer<DashBoardVm>(builder: (context, data, _) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _CustomCardGrid(
                      onTap: () {
                        data.index = 3;
                        data.refresh();
                      },
                      icon: CupertinoIcons.hourglass,
                      title: 'Requests',
                      iconColor: const Color(0xFF3CD6D4),
                    ),
                  ),
                  Expanded(
                    child: _CustomCardGrid(
                      onTap: () {
                        data.index = 11;
                        data.refresh();
                      },
                      icon: Icons.group_off,
                      title: 'Who\'s off',
                      iconColor: const Color(0xFFEF9D87),
                    ),
                  ),
                  Expanded(
                    child: _CustomCardGrid(
                      onTap: () {
                        data.index = 3;
                        data.refresh();
                      },
                      icon: CupertinoIcons.calendar_badge_minus,
                      title: 'Request leave',
                      iconColor: const Color(0xFF8CD0FB),
                    ),
                  ),
                ],
              ).paddingBottom(6),
              Row(
                children: [
                  Expanded(
                    child: _CustomCardGrid(
                      onTap: () {
                        data.index = 10;
                        data.refresh();
                      },
                      icon: CupertinoIcons.calendar,
                      title: 'Attendance',
                      iconColor: const Color(0xFFEB4E3F),
                    ),
                  ),
                  Expanded(
                    child: _CustomCardGrid(
                      onTap: () {
                        data.index = 2;
                        data.refresh();
                      },
                      icon: CupertinoIcons.timer_fill,
                      title: 'Tasks',
                      iconColor: const Color(0xFFFA9E3A),
                    ),
                  ),
                  Expanded(
                    child: _CustomCardGrid(
                      onTap: () {
                        data.index = 1;
                        data.refresh();
                      },
                      icon: CupertinoIcons.person_solid,
                      title: 'Profile',
                      iconColor: const Color(0xFFA06CF7),
                    ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(vertical: 10);
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pending requests',
              style: context.textTheme.bodySmall
                  ?.copyWith(color: colorScheme.onPrimary),
            ).paddingSymmetric(vertical: 5),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {
                context.read<DashBoardVm>().index = 9;
                context.read<DashBoardVm>().refresh();
              },
              child: Text(
                'Show All',
                style: context.textTheme.bodySmall
                    ?.copyWith(color: colorScheme.primary),
              ).paddingSymmetric(vertical: 5),
            ),
          ],
        ),
        Row(
          children: const [
            Expanded(child: _RequestWidget()),
          ],
        )
      ],
    ).paddingSymmetric(horizontal: 12);
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
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => const _RequestCard()),
          ),
        ),
      ],
    );
  }
}

class _CustomCardGrid extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function() onTap;

  const _CustomCardGrid(
      {Key? key,
      required this.title,
      required this.icon,
      required this.iconColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 110,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23)),
              child: InkWell(
                borderRadius: BorderRadius.circular(23),
                radius: 0.0,
                onTap: onTap,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 20,
                      color: iconColor,
                    ).paddingBottom(5),
                    Text(
                      title,
                      style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DayDetailsCard extends StatelessWidget {
  final String leaveType;
  final String takenLeaves;
  final String totalLeaves;
  final String emoji;
  final double emojiSize;

  const _DayDetailsCard({
    Key? key,
    required this.leaveType,
    required this.takenLeaves,
    required this.totalLeaves,
    required this.emoji,
    required this.emojiSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.network(emoji, height: emojiSize, width: emojiSize),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    takenLeaves,
                    style: context.textTheme.headlineMedium?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold),
                  ).paddingRight(10),
                  Text(
                    '/ $totalLeaves',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                  )
                ],
              ),
              Text(
                leaveType,
                style: context.textTheme.bodySmall
                    ?.copyWith(color: colorScheme.onPrimary),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ).paddingAll(15),
        ],
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  const _RequestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jun 16, 2023 - Jun 18, 2023',
                    style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: colorScheme.onPrimary)),
                Text('Going on vacation',
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: colorScheme.onPrimary))
                    .paddingSymmetric(vertical: 5),
                Row(
                  children: [
                    Text(
                      'Annual leave',
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: colorScheme.onPrimary),
                    ).paddingRight(10),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: colorScheme.outline)),
                      child: Text('pending',
                              style: context.textTheme.labelMedium
                                  ?.copyWith(color: colorScheme.onPrimary))
                          .paddingAll(6),
                    )
                  ],
                ),
              ],
            ),
            InkWell(
                radius: 0.0,
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  context.read<DashBoardVm>().index = 9;
                  context.read<DashBoardVm>().refresh();
                },
                child: Icon(
                  Icons.more_vert,
                  color: colorScheme.primary,
                )),
          ],
        ).paddingAll(20));
  }
}

class _LeaveTypesCarousel extends StatelessWidget {
  const _LeaveTypesCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeNotifier.of(context, listen: false);
    final List<Map<String, dynamic>> list = [
      {
        'leaveType': 'Casual leave',
        'takenLeaves': '18',
        'totalLeaves': '20',
        'emoji':
            'https://assets1.lottiefiles.com/private_files/lf30_bb9bkg1h.json',
        'emojiSize': 100.0,
      },
      {
        'leaveType': 'Annual leave',
        'takenLeaves': '18',
        'totalLeaves': '20',
        'emoji': 'https://assets7.lottiefiles.com/packages/lf20_xlz4hb.json',
        'emojiSize': 60.0,
      },
      {
        'leaveType': 'Sick leave',
        'takenLeaves': '18',
        'totalLeaves': '20',
        'emoji': 'https://assets5.lottiefiles.com/packages/lf20_5Gqhew.json',
        'emojiSize': 60.0,
      },
      {
        'leaveType': 'Emergency leave',
        'takenLeaves': '18',
        'totalLeaves': '20',
        'emoji':  'https://assets9.lottiefiles.com/packages/lf20_jol43osd.json',
        'emojiSize': 90.0,
      },
    ];

    return Column(
      children: [
        SizedBox(
          height: 120,
          child: Row(
            children: [
              Expanded(
                child: CarouselSlider(
                  items: list.map((item) {
                    return _DayDetailsCard(
                      leaveType: item['leaveType'],
                      takenLeaves: item['takenLeaves'],
                      totalLeaves: item['totalLeaves'],
                      emoji: item['emoji'],
                      emojiSize: item['emojiSize'],
                    );
                  }).toList(),
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    animateToClosest: true,
                    aspectRatio: 0.1 / 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
