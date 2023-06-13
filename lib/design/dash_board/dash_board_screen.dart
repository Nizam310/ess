import 'package:employee_self_service_flutter/design/common_widgets/list_cus_card.dart';
import 'package:employee_self_service_flutter/design/dash_board/widgets/cus_card.dart';
import 'package:employee_self_service_flutter/design/dash_board/widgets/sorted_calendar.dart';
import 'package:employee_self_service_flutter/design/dash_board/widgets/toggle_button.dart';
import 'package:employee_self_service_flutter/design/profile/profile_provider.dart';
import 'package:employee_self_service_flutter/design/tasks/location/location_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../home/home_provider.dart';
import '../tasks/task_provider.dart';
import 'dash_board_provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DashBoardVm()),
        ChangeNotifierProvider(create: (context) => TaskVm()),
        ChangeNotifierProvider(create: (context) => HomeVm()),
        ChangeNotifierProvider(create: (context) => ProfileVm()),
        ChangeNotifierProvider(create: (context) => LocationVm()),
      ],
      child: ChangeNotifierProvider.value(
        value: HomeVm(),
        child: ChangeNotifierProvider.value(
          value: ProfileVm(),
          child: Consumer<DashBoardVm>(builder: (context, data, _) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: colorScheme.background,
                drawer: Drawer(
                  backgroundColor: colorScheme.background,
                  width: 250,
                  child: const CusDrawer(),
                ),
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: !(data.index == 0 || data.index == 10),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Builder(builder: (context) {
                              return IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  icon: Icon(
                                    Icons.menu,
                                    color: colorScheme.onPrimary,
                                  ));
                            }),
                            Text(
                              data.index == 0
                                  ? "Dash Board"
                                  : data.index == 1
                                      ? "Profile"
                                      : data.index == 3
                                          ? "Request Leave"
                                          : data.index == 5
                                              ? "Settings"
                                              : data.index == 4
                                                  ? "Chat With HR"
                                                  : data.index == 2
                                                      ? "Task"
                                                      : data.index == 6
                                                          ? "Task Add"
                                                          : data.index == 7
                                                              ? "Notifications"
                                                              : data.index == 9
                                                                  ? "Team Approvals"
                                                                  : data.index ==
                                                                          10
                                                                      ? "Clocking"
                                                                      :data.index ==
                                                                          11
                                                                      ? "Who\'s off"
                                                                      : "",
                              style: TextStyle(color: colorScheme.onPrimary),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Visibility(
                                    visible: data.index == 1,
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (m) {
                                              final data =
                                                  Provider.of<ProfileVm>(
                                                      context);
                                              return AlertDialog(
                                                title: const Text("Edit"),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ListCusCard(
                                                      iconNeeded: true,
                                                      icon: Icons.photo,
                                                      text: data.picked != null
                                                          ? "Edit Image"
                                                          : "Add Image",
                                                      onTap: () {
                                                        data.pickFile();
                                                        data.refresh();
                                                        Navigator.pop(context);
                                                      },
                                                    ).paddingBottom(10),
                                                    ListCusCard(
                                                      iconNeeded: true,
                                                      icon: Icons.receipt,
                                                      text: "Edit Info",
                                                      onTap: () {
                                                        data.enable = true;
                                                        data.refresh();
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: colorScheme.onPrimary,
                                      ),
                                    )),
                                /*  Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: colorScheme.outline)),
                                  child: InkWell(
                                    onTap: () {
                                      data.index = 4;
                                      data.refresh();
                                    },
                                    child: Icon(
                                      CupertinoIcons.chat_bubble,
                                      color: colorScheme.onPrimary,
                                      size: 12,
                                    ),
                                  ),
                                ),*/
                                const ToggleButton()
                                    .paddingSymmetric(horizontal: 8),
                                const NotificationMenu(),
                                const SortCalendar()
                              ],
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 9),
                      ),
                    ),
                    Expanded(child: data.screen.elementAt(data.index))
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: Builder(builder: (context) {
                  return Visibility(
                    visible: (data.index == 0 || data.index == 10),
                    child: FloatingActionButton(
                        backgroundColor: colorScheme.primary,
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(
                          Icons.add,
                          color: colorScheme.surface,
                        )),
                  );
                }),
                bottomNavigationBar: Visibility(
                  visible: ((data.index == 0) || (data.index == 10)),
                  child: BottomAppBar(
                    color: colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 50,
                    elevation: 13,
                    shape: const CircularNotchedRectangle(),
                    child: Consumer<DashBoardVm>(builder: (context, data, _) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.home,
                              color: data.index == 0
                                  ? colorScheme.primary
                                  : colorScheme.outlineVariant,
                            ),
                            onPressed: () {
                              data.index = 0;
                              data.refresh();
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.timer,
                              color: data.index == 10
                                  ? colorScheme.primary
                                  : colorScheme.outlineVariant,
                            ),
                            onPressed: () {
                              data.index = 10;
                              data.refresh();
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class CustomNotchedShape extends CircularNotchedRectangle {
  final Color borderColor;

  CustomNotchedShape({required this.borderColor});

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final path = super.getOuterPath(host, guest);
    final borderPath = Path.combine(
      PathOperation.difference,
      path,
      Path()..addRect(host),
    );

    return borderPath;
  }
}

class CusDrawer extends StatelessWidget {
  const CusDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Consumer<DashBoardVm>(builder: (context, data, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 17, color: colorScheme.onPrimary),
                      ).paddingTop(10),
                      Text(
                        "Role",
                        style: TextStyle(
                            fontSize: 12, color: colorScheme.onPrimary),
                      ).paddingTop(10),
                    ],
                  ).paddingAll(10),
                ).paddingSymmetric(horizontal: 8, vertical: 5),
                Divider(
                  color: colorScheme.outline,
                  thickness: 0.5,
                ),
                CusCard(
                  index: 0,
                  icon: Icons.dashboard_customize_rounded,
                  title: "DashBoard",
                  onTap: () {
                    data.index = 0;
                    Scaffold.of(context).closeDrawer();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 1,
                  icon: Icons.person,
                  title: "Profile",
                  onTap: () {
                    data.index = 1;
                    Scaffold.of(context).closeDrawer();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 2,
                  icon: Icons.add_task,
                  title: "Tasks",
                  onTap: () {
                    data.index = 2;
                    Scaffold.of(context).closeDrawer();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 3,
                  icon: CupertinoIcons.calendar_badge_minus,
                  title: "Request leave",
                  onTap: () {
                    data.index = 3;
                    Scaffold.of(context).closeDrawer();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 4,
                  icon: Icons.chat_bubble_outline,
                  title: "Chat",
                  onTap: () {
                    data.index = 4;
                    Scaffold.of(context).closeDrawer();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 9,
                  icon: Icons.approval,
                  title: "Approvals",
                  onTap: () {
                    data.index = 9;
                    Scaffold.of(context).closeDrawer();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 10,
                  icon: Icons.fact_check,
                  title: "Clocking",
                  onTap: () {
                    data.index = 10;
                    Scaffold.of(context).closeDrawer();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 11,
                  icon: Icons.group_off,
                  title: "Who\'s off",
                  onTap: () {
                    data.index = 11;
                    Scaffold.of(context).closeDrawer();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 7,
                  icon: Icons.notifications_active_outlined,
                  title: "Notifications",
                  onTap: () {
                    data.index = 7;
                    Scaffold.of(context).closeDrawer();
                    data.refresh();
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CusCard(
                  index: 5,
                  icon: Icons.settings,
                  title: "Settings",
                  onTap: () {
                    data.index = 5;
                    data.refresh();
                    Scaffold.of(context).closeDrawer();
                  },
                ),
                CusCard(
                  icon: Icons.power_settings_new,
                  title: "Logout",
                  iconColor: colorScheme.error,
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                  },
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}

class NotificationMenu extends StatelessWidget {
  const NotificationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colorScheme.outline),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              context.read<DashBoardVm>().index = 7;
              context.read<DashBoardVm>().refresh();
            },
            child: Icon(
              Icons.notifications_none,
              color: colorScheme.error,
              size: 15,
            ),
          ),
        ),
        Positioned(
          top: 3,
          left: 0,
          child: SizedBox(
            height: 5,
            width: 5,
            child: CircleAvatar(
              backgroundColor: colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
