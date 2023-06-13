import 'package:employee_self_service_flutter/design/common_widgets/list_cus_card.dart';
import 'package:employee_self_service_flutter/design/who_iS_off/who_is_off_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class WhoIsOff extends StatelessWidget {
  const WhoIsOff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WhoIsOffVm(),
      child: Builder(builder: (context) {
        final list = context.select((WhoIsOffVm value) => value.list);
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                  itemBuilder: (context, index) => _LeaveCard(
                      name: list[index]['name'],
                      position: list[index]['position'],
                      leaveType: list[index]['leaveType'],
                      leaveEmoji: list[index]['emoji'])),
            ),
          ],
        );
      }),
    );
  }
}

class _LeaveCard extends StatelessWidget {
  final String name;
  final String position;
  final String leaveType;
  final String leaveEmoji;

  const _LeaveCard(
      {Key? key,
      required this.name,
      required this.position,
      required this.leaveType,
      required this.leaveEmoji})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      minVerticalPadding: 10,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: colorScheme.onPrimary),
        ),
        child: Icon(
          CupertinoIcons.person,
          size: 15,
          color: colorScheme.onPrimary,
        ),
      ),
      title: Text(
        name,
        style:
            context.textTheme.bodyLarge?.copyWith(color: colorScheme.onPrimary),
      ),
      subtitle: Text(
        position,
        style:
            context.textTheme.bodySmall?.copyWith(color: colorScheme.onPrimary),
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end
        ,
        children: [
          Text(leaveEmoji,textAlign: TextAlign.end,).paddingBottom(5),
          Expanded(
            child: Text(
              leaveType,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: colorScheme.onPrimary),
            ),
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 10,vertical: 5);
  }
}
