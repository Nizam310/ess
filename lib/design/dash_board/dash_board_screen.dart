import 'package:employee_self_service_flutter/constant/enum.dart';
import 'package:employee_self_service_flutter/constant/themes/theme.dart';
import 'package:employee_self_service_flutter/design/dash_board/widgets/cus_card.dart';
import 'package:employee_self_service_flutter/design/dash_board/widgets/video_player.dart';
import 'package:employee_self_service_flutter/design/profile/profile_provider.dart';
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
      ],
      child: ChangeNotifierProvider.value(
        value: HomeVm(),
        child: ChangeNotifierProvider.value(
          value: ProfileVm(),
          child: Consumer<DashBoardVm>(builder: (context, data, _) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                drawer: Drawer(
                  backgroundColor: Colors.transparent.withOpacity(0.8),
                  width: 250,
                  child: const CusDrawer(),
                ),
                body: Stack(
                  children: [
                    const VideoPlayerWidget(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: !(data.index == 0),
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
                                        color: colorScheme.primary,
                                      ));
                                }),
                                Text(
                                  data.index == 0
                                      ? "Dash Board"
                                      : data.index == 1
                                          ? "Profile"
                                          : data.index == 3
                                              ? "Request Form"
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
                                                                  : data.index ==
                                                                          9
                                                                      ? "Team Approvals"
                                                                      : data.index ==
                                                                              10
                                                                          ? "Clocking"
                                                                          : "",
                                  style: TextStyle(color: colorScheme.primary),
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
                                                        ListTile(
                                                          leading: const Icon(
                                                              Icons.photo),
                                                          title: Text(data
                                                                      .picked !=
                                                                  null
                                                              ? "Edit Image"
                                                              : "Add Image"),
                                                          onTap: () {
                                                            data.pickFile();
                                                            data.refresh();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ).paddingBottom(10),
                                                        ListTile(
                                                          leading: const Icon(
                                                              Icons.receipt),
                                                          title: const Text(
                                                              "Edit Info"),
                                                          onTap: () {
                                                            data.enable = true;
                                                            data.refresh();
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: colorScheme.surface,
                                          ),
                                        )),
                                    InkWell(
                                      onTap: () {
                                        data.index = 4;
                                        data.refresh();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: colorScheme.primary)),
                                        child: Icon(
                                          CupertinoIcons.chat_bubble,
                                          color: colorScheme.surface,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                    const NotificationMenu(),
                                    const SortCalendar()
                                  ],
                                )
                              ],
                            ).paddingSymmetric(horizontal: 9),
                          ),
                        ),
                        Expanded(child: data.screen.elementAt(data.index))
                      ],
                    ),
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: Builder(builder: (context) {
                  return Visibility(
                    visible: data.index == 0,
                    child: FloatingActionButton(
                        backgroundColor: colorScheme.primary.withOpacity(0.5),
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
                  visible: (data.index == 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BottomAppBar(
                      color: colorScheme.primary.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: 50,
                      elevation: 0.0,
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
                                    ? colorScheme.primaryContainer
                                    : colorScheme.outline,
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
                                    ? colorScheme.primaryContainer
                                    : colorScheme.outline,
                              ),
                              onPressed: () {
                                data.index = 10;
                                data.refresh();
                              },
                            ),
                          ],
                        );
                      }),
                    ).paddingSymmetric(
                      vertical: 5,
                    ),
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
                        style:
                            TextStyle(fontSize: 17, color: colorScheme.primary),
                      ).paddingTop(10),
                      Text(
                        "Role",
                        style:
                            TextStyle(fontSize: 12, color: colorScheme.primary),
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
                  icon: Icons.receipt_long,
                  title: "Request Form",
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
                  icon: Icons.fact_check,
                  title: "Clocking",
                  onTap: () {
                    data.index = 10;
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
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          child: const Text('One Notification'),
          onTap: () {
            context.read<DashBoardVm>().index = 7;
            context.read<DashBoardVm>().refresh();
          },
        ),
      ],
      icon: Stack(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colorScheme.primary),
            ),
            child: Icon(
              Icons.notifications_none,
              color: colorScheme.error,
              size: 15,
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
      ),
    );
  }
}

class SortCalendar extends StatelessWidget {
  const SortCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeNotifier.of(context, listen: false);
    final colorScheme = Theme.of(context).colorScheme;
    final style = TextStyle(
        color: theme.themeMode == ThemeModeType.dark
            ? colorScheme.primary
            : colorScheme.shadow);
    return Visibility(
      visible: context.select((DashBoardVm value) => value.index == 9),
      child: PopupMenuButton(
        icon: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.primary)),
            child: Icon(
              CupertinoIcons.calendar,
              color: colorScheme.primary,
              size: 14,
            )),
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
              child: Text(
            'Today',
            style: style,
          )),
          PopupMenuItem(
              child: Text(
            'Yesterday',
            style: style,
          )),
          PopupMenuItem(
              child: Text(
            'This Week',
            style: style,
          )),
          PopupMenuItem(
              child: Text(
            'Last 7 Days',
            style: style,
          )),
          PopupMenuItem(
              child: Text(
            'This Month',
            style: style,
          )),
          PopupMenuItem(
              child: Text(
            'Last 30 Days',
            style: style,
          )),
          PopupMenuItem(
              child: Text(
            'Last 3 Months',
            style: style,
          )),
          PopupMenuItem(
              child: Text(
            'This Year',
            style: style,
          )),
          PopupMenuItem(
              child: Text(
            'Custom',
            style: style,
          )),
        ],
      ),
    );
  }
}
