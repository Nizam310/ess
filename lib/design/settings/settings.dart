import 'package:employee_self_service_flutter/design/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsVm(),
      child: Builder(
        builder: (context) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            children: [
              ListTile(
                leading:  Icon(Icons.help_outline_rounded,color: Theme.of(context).colorScheme.onPrimary,),
                title: const Text(
                  "Help center",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                onTap: () {},
              ).paddingBottom(10),
              ListTile(
                leading:  Icon(Icons.notifications_active_outlined,color: Theme.of(context).colorScheme.onPrimary,),
                title: const Text(
                  "Notifications",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                trailing: Switch(
                    value: context.select((SettingsVm value) => value.switchOn) ?? true,
                    onChanged: (val) {
                      context.read<SettingsVm>().switchOn = val;
                      context.read<SettingsVm>().refresh();
                    }),
              ),
            ],
          );
        }
      ),
    );
  }
}
