import 'package:employee_self_service_flutter/design/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';
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
        value: ProfileVm(),
        child: Consumer<DashBoardVm>(builder: (context, data, _) {
          return Scaffold(
            drawer: const Drawer(
              width: 250,
              child: CusDrawer(),
            ),
            appBar: AppBar(
              iconTheme:  IconThemeData(
                color: ColorS.secondary,
              ),
              backgroundColor: Colors.white,
              title: Text(
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
                style:  TextStyle(color: ColorS.secondary),
              ),
              actions: [
                Visibility(
                    visible: data.index == 1,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (m) {
                              final data = Provider.of<ProfileVm>(context);
                              return AlertDialog(
                                title: const Text("Edit"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.photo),
                                      title: Text(data.picked != null
                                          ? "Edit Image"
                                          : "Add Image"),
                                      onTap: () {
                                        data.pickFile();
                                        data.refresh();
                                        Navigator.pop(context);
                                      },
                                    ).paddingBottom(10),
                                    ListTile(
                                      leading: const Icon(Icons.receipt),
                                      title: const Text("Edit Info"),
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
                const NotificationMenu(),
              ],
            ),
            body: Consumer<DashBoardVm>(builder: (context, data, _) {
              return Column(
                children: [
                  Expanded(
                    child: data.screen.elementAt(data.index),
                  ),
                ],
              );
            }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Builder(builder: (context) {
              return FloatingActionButton(
                      backgroundColor: ColorS.primary,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(Icons.add))
                  .paddingLeft(10);
            }),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            ),
          );
        }),
      ),
    );
  }
}

class CusDrawer extends StatelessWidget {
  const CusDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardVm>(builder: (context, data, _) {
      return ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ).paddingTop(10),
                const Text(
                  "Role",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ).paddingTop(10),
              ],
            ).paddingAll(10),
          ).paddingSymmetric(horizontal: 8, vertical: 5),
          const Divider(
            // color: Color(0xFFB3D452),
            thickness: 0.5,
          ),
          CusCard(
            icon: Icons.home,
            title: "Home",
            onTap: () {
              data.index = 0;
              Navigator.of(context).pop();
              data.refresh();
            },
          ),
          CusCard(
            icon: Icons.person,
            title: "Profile",
            onTap: () {
              data.index = 1;
              Navigator.of(context).pop();
              data.refresh();
            },
          ),
          CusCard(
            icon: Icons.add_task,
            title: "Tasks",
            onTap: () {
              data.index = 5;
              Navigator.of(context).pop();
              data.refresh();
            },
          ),
          CusCard(
            icon: Icons.receipt_long,
            title: "Request Form",
            onTap: () {
              data.index = 2;
              Navigator.of(context).pop();
              data.refresh();
            },
          ),
          CusCard(
            icon: Icons.settings,
            title: "Settings",
            onTap: () {
              data.index = 3;
              data.refresh();
              Navigator.of(context).pop();
            },
          ),
          CusCard(
            icon: Icons.logout,
            title: "Logout",
            iconColor: ColorS.error,
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
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

  const CusCard({
    Key? key,
    required this.title,
    required this.icon,
    this.iconColor,
    required this.onTap,
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
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorS.primary,
              )),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: ColorS.secondary),
                      ),
                      Icon(
                        icon,
                        color: iconColor ??  ColorS.secondary,
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
      icon: const Icon(Icons.circle_notifications),
    );
  }
}
