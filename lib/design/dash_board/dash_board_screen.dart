import 'package:employee_self_service_flutter/design/dash_board/widgets/video_player.dart';
import 'package:employee_self_service_flutter/design/profile/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../constant/enum.dart';
import '../../constant/themes/theme.dart';
import '../home/home_provider.dart';
import '../tasks/task_provider.dart';
import 'dash_board_provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        SizedBox(
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
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ));
                              }),
                              Text(
                                data.index == 0
                                    ? "Dash Board"
                                    : data.index == 1
                                        ? "Profile"
                                        : data.index == 2
                                            ? "Request Form"
                                            : data.index == 3
                                                ? "Settings"
                                                : data.index == 4
                                                    ? "Chat With HR"
                                                    : data.index == 5
                                                        ? "Task"
                                                        : data.index == 6
                                                            ? "Task Add"
                                                            : data.index == 7
                                                                ? "Notifications"
                                                                : "",
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary),
                              ),
                              Row(
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
                                                        title: Text(
                                                            data.picked != null
                                                                ? "Edit Image"
                                                                : "Add Image"),
                                                        onTap: () {
                                                          data.pickFile();
                                                          data.refresh();
                                                          Navigator.pop(context);
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
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        icon: const Icon(Icons.edit),
                                      )),
                                  ToggleButton(),
                                  const NotificationMenu(),
                                ],
                              )
                            ],
                          ).paddingSymmetric(horizontal: 9),
                        ),
                        Expanded(child: data.screen.elementAt(data.index))
                      ],
                    ),
                  ],
                ),

                /// this was our bottom nav bar
                /* floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: Builder(builder: (context) {
                  return FloatingActionButton(
                          backgroundColor: ColorS.nSecondary,
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: const Icon(Icons.add))
                      .paddingLeft(10);
                }),
                bottomNavigationBar: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: ColorS.nPrimary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BottomAppBar(
                      color: ColorS.nPrimary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      //  color:  const Color(0xFF000000),
                      height: 50,
                      shape: const CircularNotchedRectangle(),
                      // elevation: 29.236,
                      child: Consumer<DashBoardVm>(builder: (context, data, _) {
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.home,
                                color: data.index == 0
                                    ? ColorS.primary
                                    : const Color(0xFF8F9FBC),
                              ),
                              onPressed: () {
                                data.index = 0;
                                data.refresh();
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.timer,
                                color: data.index == 5
                                    ? ColorS.primary
                                    : const Color(0xFF8F9FBC),
                              ),
                              onPressed: () {
                                data.index = 5;

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
                ),*/
              ),
            );
          }),
        ),
      ),
    );
  }
}

class CusDrawer extends StatelessWidget {
  const CusDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            fontSize: 17,
                            color: Theme.of(context).colorScheme.primary),
                      ).paddingTop(10),
                      Text(
                        "Role",
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.primary),
                      ).paddingTop(10),
                    ],
                  ).paddingAll(10),
                ).paddingSymmetric(horizontal: 8, vertical: 5),
                const Divider(
                  // color: Color(0xFFB3D452),
                  thickness: 0.5,
                ),
                CusCard(
                  index: 0,
                  icon: Icons.dashboard_customize_rounded,
                  title: "DashBoard",
                  onTap: () {
                    data.index = 0;
                    Navigator.of(context).pop();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 1,
                  icon: Icons.person,
                  title: "Profile",
                  onTap: () {
                    data.index = 1;
                    Navigator.of(context).pop();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 5,
                  icon: Icons.add_task,
                  title: "Tasks",
                  onTap: () {
                    data.index = 5;
                    Navigator.of(context).pop();
                    data.refresh();
                  },
                ),
                CusCard(
                  index: 2,
                  icon: Icons.receipt_long,
                  title: "Request Form",
                  onTap: () {
                    data.index = 2;
                    Navigator.of(context).pop();
                    data.refresh();
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                CusCard(
                  index: 3,
                  icon: Icons.settings,
                  title: "Settings",
                  onTap: () {
                    data.index = 3;
                    data.refresh();
                    Navigator.of(context).pop();
                  },
                ),
                CusCard(
                  index: -1,
                  icon: Icons.power_settings_new,
                  title: "Logout",
                  iconColor: Theme.of(context).colorScheme.error,
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

class CusCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final Function() onTap;
  final int index;

  const CusCard({
    Key? key,
    required this.title,
    required this.icon,
    this.iconColor,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardVm>(builder: (context, data, _) {
      return MouseRegion(
        onHover: (event) {
          data.hover = true;
          data.refresh();
        },
        onExit: (event) {
          data.hover = false;
          data.refresh();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Icon(
                        icon,
                        color: data.index == index
                            ? Colors.white
                            : (iconColor ??
                                Theme.of(context).colorScheme.primaryContainer),
                      ).paddingRight(20),
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: data.index == index
                                ? Colors.white
                                : (Theme.of(context).colorScheme.primary)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class NotificationMenu extends StatelessWidget {
  const NotificationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
            child: Icon(
              Icons.notifications_none,
              color: Theme.of(context).colorScheme.error,
              size: 15,
            ),
          ),
          const Positioned(
            top: 3,
            left: 0,
            child: SizedBox(
              height: 5,
              width: 5,
              child: CircleAvatar(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  const ToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeNotifier.of(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: themeProvider.themeMode == ThemeModeType.dark
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => themeProvider.toggleThemeMode(),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  border: Border.all(  color: themeProvider.themeMode == ThemeModeType.light
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,),
                  shape: BoxShape.circle,
                  ),
              child: const Icon(
                CupertinoIcons.sun_max,
                color: Colors.white,
                size: 11,
              ),
            ),
          ).paddingRight(5),
          InkWell(
            onTap: () => themeProvider.toggleThemeMode(),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  border: Border.all(color: themeProvider.themeMode == ThemeModeType.dark
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,),
                  shape: BoxShape.circle,
                  ),
              child: const Icon(
                CupertinoIcons.moon_fill,
                color: Colors.white,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
