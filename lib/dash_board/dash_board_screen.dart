import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 17);
    return Scaffold(
      drawer: const Drawer(
        width: 250,
        child: CusDrawer(),
      ),
      appBar: AppBar(
        title: const Text("Dash Board"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xFFB3D452),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name :",
                        style: style,
                      ).paddingTop(10),
                      const Text(
                        "Resignation :",
                        style: style,
                      ).paddingTop(10),
                      const Text(
                        "Date Of Join :",
                        style: style,
                      ).paddingTop(10),
                      const Text(
                        "Successful years with company :",
                        style: style,
                      ).paddingTop(10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FabCircularMenu(
        children: [
          IconButton(icon: const Icon(Icons.home), onPressed: () {}),
          IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: const Icon(Icons.home), onPressed: () {}),
          IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
        ],
      ),
    );
  }
}

class CusDrawer extends StatelessWidget {
  const CusDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(color: Colors.black));
    return ListView(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(fontSize: 17),
              ).paddingTop(10),
              const Text(
                "Resignation",
                style: TextStyle(fontSize: 12),
              ).paddingTop(10),
            ],
          ).paddingAll(10),
        ).paddingSymmetric(horizontal: 8, vertical: 5),
        ListTile(
          shape: shape,
          trailing: const Icon(Icons.person),
          title: const Text("Profile"),
          onTap: () {},
        ).paddingSymmetric(horizontal: 10, vertical: 5),
        ListTile(
          shape: shape,
          trailing: const Icon(Icons.settings),
          title: const Text("Settings"),
          onTap: () {},
        ).paddingSymmetric(horizontal: 10, vertical: 5),
        ListTile(
          shape: shape,
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
  }
}
