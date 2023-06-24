import 'package:employee_self_service_flutter/design/dash_board/dash_board_provider.dart';
import 'package:employee_self_service_flutter/design/employee_dash/employee_dash_provider.dart';
import 'package:employee_self_service_flutter/design/home/widgets/expiring_documents.dart';
import 'package:employee_self_service_flutter/design/home/widgets/leave_type_carousel.dart';
import 'package:employee_self_service_flutter/design/home/widgets/leaves.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../dash_board/dash_board_screen.dart';
import '../dash_board/widgets/toggle_button.dart';
import '../request_history/request_history.dart';

class NewHome extends StatelessWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Consumer<EmployeeDashVm>(builder: (context, data, _) {
      final name = data.list.map((e) => e['first_name']);
      return ListView(
        padding: const EdgeInsets.all(2),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'CloudMe',
                      style: MediaQuery.of(context).size.width < 330
                          ? Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: colorScheme.onPrimary)
                          : Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: colorScheme.onPrimary),
                    ),
                    TextSpan(
                      text: 'HR',
                      style: MediaQuery.of(context).size.width < 330
                          ? Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary)
                          : Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: colorScheme.primary),
                    )
                  ],
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
                'Welcome,  $name'.replaceAll(RegExp(r':'), ''),
                style: MediaQuery.of(context).size.width < 360
                    ? Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: colorScheme.onPrimary)
                    : context.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onPrimary),
              ).paddingOnly(
                top: 10,
              ),
            ],
          ),

          Visibility(
            visible: MediaQuery.of(context).size.width > 300,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your remaining balance',
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: colorScheme.onPrimary),
                ),
                const Leaves()
              ],
            ).paddingSymmetric(vertical: 10),
          ),
          // Lottie.file(File('C:/Users/ADMIN/Downloads/7731-water-loading.json')),
          Visibility(
            visible: MediaQuery.of(context).size.width > 300,
            child: const Row(
              children: [
                Expanded(child: LeaveTypesCarousel()),
              ],
            ).paddingSymmetric(vertical: 10),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tasks').paddingBottom(5),
                    Row(
                      children: [
                        Expanded(
                            child: CusDocCard(
                          onTap: () {
                            context.read<DashBoardVm>().index = 15;
                            context.read<DashBoardVm>().refresh();
                          },
                          expiryValue: '5',
                          monthName: 'Waiting',
                          color: colorScheme.primary,
                        )),
                        Expanded(
                            child: CusDocCard(
                          onTap: () {
                            context.read<DashBoardVm>().index = 15;
                            context.read<DashBoardVm>().refresh();
                          },
                          expiryValue: '1',
                          monthName: 'Acceptance',
                          color: colorScheme.primary,
                        )),
                        Expanded(
                            child: CusDocCard(
                          onTap: () {
                            context.read<DashBoardVm>().index = 15;
                            context.read<DashBoardVm>().refresh();
                          },
                          expiryValue: '0',
                          monthName: 'Rejected',
                          color: colorScheme.error,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(vertical: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Documents').paddingBottom(5),
                    Row(
                      children: [
                        Expanded(
                            child: CusDocCard(
                          onTap: () {
                            context.read<DashBoardVm>().index = 16;
                            context.read<DashBoardVm>().refresh();
                          },
                          expiryValue: '5',
                          monthName: 'Total',
                          color: colorScheme.primary,
                        )),
                        Expanded(
                            child: CusDocCard(
                          onTap: () {
                            context.read<DashBoardVm>().index = 16;
                            context.read<DashBoardVm>().refresh();
                          },
                          expiryValue: '1',
                          monthName: 'Near to expiry',
                          color: colorScheme.primary,
                        )),
                        Expanded(
                            child: CusDocCard(
                          onTap: () {
                            context.read<DashBoardVm>().index = 16;
                            context.read<DashBoardVm>().refresh();
                          },
                          expiryValue: '0',
                          monthName: 'Expired',
                          color: colorScheme.error,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
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
                      child: _CustomCard(
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
                      child: _CustomCard(
                        onTap: () {
                          data.index = 8;
                          data.refresh();
                        },
                        icon: Icons.history,
                        title: 'Request History',
                        iconColor: const Color(0xFFEF9D87),
                      ),
                    ),
                    Expanded(
                      child: _CustomCard(
                        onTap: () {
                          data.index = 9;
                          data.refresh();
                        },
                        icon: Icons.approval_outlined,
                        title: 'Approvals',
                        iconColor: const Color(0xFF8CD0FB),
                      ),
                    ),
                  ],
                ).paddingBottom(6),
                Row(
                  children: [
                    Expanded(
                      child: _CustomCard(
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
                      child: _CustomCard(
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
                      child: _CustomCard(
                        onTap: () {
                          data.index = 13;
                          data.refresh();
                        },
                        icon: Icons.file_copy_sharp,
                        title: 'Documents',
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
          const _RequestWidget()
        ],
      ).paddingSymmetric(horizontal: 8);
    });
  }
}

class _RequestWidget extends StatelessWidget {
  const _RequestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = const [
      RequestCard(),
      RequestCard(),
    ];
    return Column(
      children: list.map((e) => e).toList(),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function() onTap;

  const _CustomCard(
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
