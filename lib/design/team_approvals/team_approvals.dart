import 'package:employee_self_service_flutter/constant/decoration_card.dart';
import 'package:employee_self_service_flutter/design/common_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class TeamApprovals extends StatelessWidget {
  const TeamApprovals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _TeamApprovalsCard(),
      ],
    );
  }
}

class _TeamApprovalsCard extends StatelessWidget {
  const _TeamApprovalsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecorationCard(
        child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.person),
              ),
            ),
            Column(
              children: [
                Text(
                  'Beatrix Mike',
                  style: context.textTheme.bodyLarge?.copyWith(),
                ),
                Text(
                  'sr.ux Designer',
                  style: context.textTheme.bodyLarge?.copyWith(),
                ),
              ],
            ),
          ],
        ),
        Text(
          'Oct 16 - Oct 18 (2 days)',
          style: context.textTheme.bodyLarge?.copyWith(),
        ),
        Text(
          'Going to Mt,Fuji to visit a friend in Japan will be back on october 18 at 12:00 PM in the afternoon will bring some treats!',
          style: context.textTheme.bodyLarge?.copyWith(),
          maxLines: 5,
        ),
        Row(
          children: [
            Text(
              'Annual Leave',
              style: context.textTheme.bodyLarge?.copyWith(),
            ),
            DecorationCard(
              radius: BorderRadius.circular(30),
              child: Text(
                'pending',
                style: context.textTheme.bodyLarge?.copyWith(),
              ),
            )
          ],
        ),
        Text(
          'Balance to date',
          style: context.textTheme.bodyLarge?.copyWith(),
        ),
        Text(
          '15.50 days',
          style: context.textTheme.bodyLarge?.copyWith(),
        ),
        Text(
          'Balance to end of year',
          style: context.textTheme.bodyLarge?.copyWith(),
        ),
        Text(
          '24.12 days',
          style: context.textTheme.bodyLarge?.copyWith(),
        ),
        Row(
          children: [
            StatefulBuilder(builder: (context, setState) {
              bool value = true;
              return Switch(
                  value: value,
                  onChanged: (val) {
                    setState(() {
                      value = val;
                    });
                  });
            }),
            Text('Deduct balance',
                style: context.textTheme.bodyLarge?.copyWith())
          ],
        ),
        Row(
          children: [
            CusButton(text: 'Reject', onTap: () {}),
            CusButton(text: 'Approve', onTap: () {}),
          ],
        )
      ],
    ));
  }
}
