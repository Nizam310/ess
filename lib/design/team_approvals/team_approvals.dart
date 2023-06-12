import 'package:employee_self_service_flutter/constant/decoration_card.dart';
import 'package:employee_self_service_flutter/design/common_widgets/button.dart';
import 'package:employee_self_service_flutter/design/team_approvals/team_approvals_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../constant/enum.dart';

class TeamApprovals extends StatelessWidget {
  const TeamApprovals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TeamApprovalsVm(),
        child: Builder(builder: (context) {
          return ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              unselectedLabelColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.4),
                              labelColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              indicatorColor:
                                  Theme.of(context).colorScheme.primary,
                              tabs: const [
                                Tab(
                                  text: 'Pending',
                                ),
                                Tab(
                                  text: 'Verified',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: TabBarView(children: [
                                      _AttendanceWidget(
                                        type: AttendanceRequest.Pending,
                                      ),
                                      _AttendanceWidget(
                                        type: AttendanceRequest.Verified,
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ],
          );
        }));
  }
}

class _AttendanceWidget extends StatelessWidget {
  final AttendanceRequest type;
  const _AttendanceWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filteredList = context
        .select((TeamApprovalsVm value) => value.approvalList)
        .where((item) => item['status'] == type.name)
        .toList();

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final list = filteredList[index];
        return _TeamApprovalsCard(
          name: list['name'].toString(),
          position: list['position'].toString(),
          dateFrom: list['dateFrom'].toString(),
          dateTo: list['dateTo'].toString(),
          content: list['content'].toString(),
          leaveType: list['leaveType'].toString(),
          balanceToDate: list['btd'].toString(),
          balanceToYear: list['bty'].toString(),
          deductBalance: list['deductBalance'],
          totalDays: list['totalDays'].toString(),
          status: list['status'],
        );
      },
    );
  }
}

class _TeamApprovalsCard extends StatelessWidget {
  final String name;
  final String position;
  final String dateFrom;
  final String dateTo;
  final String totalDays;
  final String content;
  final String leaveType;
  final String balanceToDate;
  final String balanceToYear;
  final String status;
  final bool? deductBalance;

  const _TeamApprovalsCard(
      {Key? key,
      required this.name,
      required this.position,
      required this.dateFrom,
      required this.dateTo,
      required this.content,
      required this.leaveType,
      required this.balanceToDate,
      required this.balanceToYear,
      required this.deductBalance,
      required this.totalDays,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: colorScheme.outline)),
      child: ListTileTheme(
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: colorScheme.onPrimary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.person,
                    color: colorScheme.onPrimary,
                    size: 15,
                  ),
                ),
              ).paddingRight(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: colorScheme.onPrimary),
                  ),
                  Text(
                    position,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: colorScheme.onPrimary),
                  ),
                ],
              ),
            ],
          ),
          // expandedAlignment: Alignment.topRight,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              '$dateFrom - $dateTo ($totalDays)',
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: colorScheme.onPrimary),
            ).paddingSymmetric(vertical: 10),
            Text(
              content,
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: colorScheme.onPrimary),
              maxLines: 5,
            ).paddingSymmetric(vertical: 10),
            Row(
              children: [
                Text(
                  leaveType,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(color: colorScheme.onPrimary),
                ).paddingRight(10),
                DecorationCard(
                  padding: const EdgeInsets.all(5),
                  radius: BorderRadius.circular(30),
                  child: Text(
                    status.toString(),
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: colorScheme.onPrimary, fontSize: 12),
                  ),
                )
              ],
            ).paddingSymmetric(vertical: 10),
            Text(
              'Balance to date',
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: colorScheme.onPrimary),
            ).paddingSymmetric(vertical: 5),
            Text(
              balanceToDate,
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: colorScheme.onPrimary),
            ).paddingSymmetric(vertical: 5),
            Text(
              'Balance to end of year',
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: colorScheme.onPrimary),
            ).paddingSymmetric(vertical: 5),
            Text(
              balanceToYear,
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: colorScheme.onPrimary),
            ).paddingSymmetric(vertical: 5),
            Row(
              children: [
                Transform.scale(
                  scale: 0.6,
                  child: CupertinoSwitch(
                      activeColor: colorScheme.tertiary,
                      value: deductBalance ?? true,
                      onChanged: (val) {}),
                ),
                Text('Deduct balance',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: colorScheme.onPrimary))
              ],
            ).paddingSymmetric(vertical: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: CusButton(
                  text: 'Reject',
                  onTap: () {},
                  color: colorScheme.outlineVariant,
                  hoverColor: colorScheme.outlineVariant,
                ).paddingSymmetric(horizontal: 10)),
                Expanded(
                    child: CusButton(text: 'Approve', onTap: () {})
                        .paddingSymmetric(horizontal: 10)),
              ],
            ).paddingSymmetric(vertical: 5)
          ],
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }
}
