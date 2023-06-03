import 'package:employee_self_service_flutter/design/common_widgets/list_cus_card.dart';
import 'package:employee_self_service_flutter/design/settings/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsVm(),
      child: Builder(builder: (context) {
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          children: [
            const ListCusCard(
                iconNeeded: true,
                icon: Icons.help_outline_rounded,
                text: 'Help Center'),
            ListCusCard(iconNeeded: true,
                icon: Icons.help_outline_rounded,
                text: 'Notifications',
              trailingNeeded: true,
              trailing: Switch(
                  value: context.select((SettingsVm value) => value.switchOn) ??
                      true,
                  onChanged: (val) {
                    context.read<SettingsVm>().switchOn = val;
                    context.read<SettingsVm>().refresh();
                  }),),
          ],
        );
      }),
    );
  }
}
