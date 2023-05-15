import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      children: const [
        ListTile(
          leading: Icon(Icons.help_outline),
          title: Text("Help center",style: TextStyle(fontSize: 15),),
        )
      ],
    );
  }
}
