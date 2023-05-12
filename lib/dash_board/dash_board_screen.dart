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
            backgroundColor: Color(0xFF4C4C4A) /*.withOpacity(0.9)*/,
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
    return Consumer<DashBoardVm>(builder: (context, data, _) {
      return ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ).paddingTop(10),
                const Text(
                  "Role",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ).paddingTop(10),
              ],
            ).paddingAll(10),
          ).paddingSymmetric(horizontal: 8, vertical: 5),
          const Divider(
            color: Color(0xFFB3D452),
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
            icon: Icons.receipt_long,
            title: "Leave Apply",
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
            iconColor: Colors.red,
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
    return Consumer<DashBoardVm>(
      builder: (context,data,_) {
        return MouseRegion(
          onHover: (event) {
            data.hover=true;
            data.refresh();
          },
          onExit: (event) {
            data.hover=false;
            data.refresh();
          },
          child: Container(
            // color: ,
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFB3D452),)
            ),
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
                          style: const TextStyle(color: Colors.white),
                        ),
                        Icon(
                          icon,
                          color: iconColor ?? white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
