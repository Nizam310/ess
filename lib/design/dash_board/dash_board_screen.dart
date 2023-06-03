import 'package:employee_self_service_flutter/design/dash_board/widgets/cus_card.dart';
import 'package:employee_self_service_flutter/design/dash_board/widgets/toggle_button.dart';
import 'package:employee_self_service_flutter/design/dash_board/widgets/video_player.dart';
import 'package:employee_self_service_flutter/design/profile/profile_provider.dart';
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
                                  const ToggleButton(),
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

