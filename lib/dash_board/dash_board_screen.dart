import 'package:employee_self_service_flutter/dash_board/dash_board_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashBoardVm(),
      child: Consumer<DashBoardVm>(builder: (context, data, _) {
        return Scaffold(

          drawer: const Drawer(
            width: 250,
            child: CusDrawer(),
          ),
          appBar: AppBar(
            backgroundColor: const Color(0xFF4C4C4A),
            title: Text(data.index == 0
                ? "Dash Board"
                : data.index == 1
                    ? "Profile"
                    : data.index == 2
                        ? "Leave Form"
                        : data.index == 3
                            ? "Settings"
                            : ""),
          ),
          body: Column(
            children: [
              Expanded(
                child: data.screen.elementAt(data.index),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CusDrawer extends StatelessWidget {
  const CusDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF6098FE);
    return Consumer<DashBoardVm>(builder: (context, data, _) {
      return ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 17),
                ).paddingTop(10),
                const Text(
                  "Role",
                  style: TextStyle(fontSize: 12),
                ).paddingTop(10),
              ],
            ).paddingAll(10),
          ).paddingSymmetric(horizontal: 8, vertical: 5),
          ListTile(
            hoverColor: color,
            trailing: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              data.index = 0;
              Navigator.of(context).pop();
              data.refresh();
            },
          ).paddingSymmetric(horizontal: 10, vertical: 5),
          ListTile(
            hoverColor: color,
            trailing: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              data.index = 1;
              Navigator.of(context).pop();
              data.refresh();
            },
          ).paddingSymmetric(horizontal: 10, vertical: 5),
          ListTile(
            hoverColor: color,
            trailing: const Icon(Icons.receipt_long),
            title: const Text("Leave Apply"),
            onTap: () {
              data.index = 2;
              Navigator.of(context).pop();
              data.refresh();
            },
          ).paddingSymmetric(horizontal: 10, vertical: 5),
          ListTile(
            hoverColor: color,
            trailing: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              data.index = 3;
              data.refresh();
              Navigator.of(context).pop();
            },
          ).paddingSymmetric(horizontal: 10, vertical: 5),
          ListTile(
            hoverColor: color,
            trailing: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ).paddingSymmetric(horizontal: 10, vertical: 5),
        ],
      );
    });
  }
}
