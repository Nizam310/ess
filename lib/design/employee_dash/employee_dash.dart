import 'package:employee_self_service_flutter/design/common_widgets/cus_tab_bar.dart';
import 'package:employee_self_service_flutter/design/common_widgets/expansion_card_custom.dart';
import 'package:employee_self_service_flutter/design/common_widgets/loading_anim.dart';
import 'package:employee_self_service_flutter/design/dash_board/dash_board_provider.dart';
import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../constant/date_converter.dart';
import 'employee_dash_provider.dart';

class EmployeeDash extends StatelessWidget {
  const EmployeeDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeDashVm>(builder: (context, data, _) {
      return ListView(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {
                  context.read<DashBoardVm>().index = 13;
                  context.read<DashBoardVm>().refresh();
                },
                child: const Text('Attach Documents')),
          ),
          const CusTabBar(
              scroll: true,
              tabs: [
                Tab(
                  text: 'Details',
                ),
                Tab(
                  text: 'Leave',
                ),
                Tab(
                  text: 'Documents',
                ),
                Tab(
                  text: 'Salary',
                ),
                Tab(
                  text: 'Bank',
                ),
                Tab(
                  text: 'Contract',
                ),
              ],
              length: 6,
              children: [
                _DetailsTab(),
                _LeavesTab(),
                _DocumentsTab(),
                _SalaryTab(),
                _BankTab(),
                _ContractTab(),
              ])
        ],
      );
    });
  }
}

class _DetailsTab extends StatelessWidget {
  const _DetailsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeDashVm>(builder: (context, data, _) {
      final colorScheme = Theme.of(context).colorScheme;
      final textStyle =
          context.textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary);
      final mainHead = context.textTheme.titleMedium?.copyWith(
        color: colorScheme.onPrimary,
      );
      final headStyle = context.textTheme.titleMedium
          ?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold);
      return data.res?.data != null
          ? ListView(children: [
              ExpansionCusCard(
                title: Text.rich(TextSpan(
                    text: data.model?.firstName ?? '',
                    style: mainHead,
                    children: [
                      TextSpan(
                        text:
                            ' ${data.model?.middleName != '' ? '' : data.model?.middleName ?? ''}',
                        style: mainHead,
                      ),
                      TextSpan(
                        text: ' ${data.model?.lastName ?? ''}',
                        style: mainHead,
                      )
                    ])),
                children: [
                  /// basic details..........................

                  _CustomWidget(
                    children: [
                      Text(
                        'Basic Details',
                        style: headStyle,
                      ).paddingSymmetric(vertical: 10),
                      const Divider(),
                      Text(
                        'ID : ${data.model?.id ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Employee No : ${data.model?.empNumber ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'User id : ${data.model?.userId ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Gender: ${data.model?.gender ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Martial Status:  : ${data.model?.martialStatus ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Place Of Birth : ${data.model?.placeOfBirth ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                    ],
                  ),

                  /// contact..............................

                  _CustomWidget(
                    children: [
                      Text(
                        'Contact  Details',
                        style: headStyle,
                      ).paddingSymmetric(vertical: 10),
                      const Divider(),
                      Text(
                        'Mobile  : ${data.model?.mobile ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Email : ${data.model?.email ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Alternative Phone : ${data.model?.altPhone ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Current Address : ${data.model?.cAddress ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Residential Address : ${data.model?.rAddress ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                    ],
                  ),

                  /// work..............................

                  _CustomWidget(
                    children: [
                      Text(
                        'Work Details',
                        style: headStyle,
                      ).paddingSymmetric(vertical: 10),
                      const Divider(),
                      Text(
                        'Department name : ${data.model?.department?.name ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Department ID : ${data.model?.department?.id?.oid ?? ''}'
                            .toString(),
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Designation : ${data.model?.designation?.name ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Designation ID: ${data.model?.designation?.id?.oid ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Break Time : ${data.model?.breakTime ?? ''} hr',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Working Hours : ${data.model?.workingHours ?? ''} hr',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Date Of Birth : ${data.model?.dob ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                    ],
                  ),
                ],
              )
            ])
          : const LoadingAnim();
    });
  }
}

class _LeavesTab extends StatelessWidget {
  const _LeavesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeDashVm>(builder: (context, data, _) {
      final colorScheme = Theme.of(context).colorScheme;
      final textStyle =
          context.textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary);
      final headStyle = context.textTheme.titleMedium
          ?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold);
      final mainHeadStyle =
          context.textTheme.titleMedium?.copyWith(color: colorScheme.onPrimary);
      return data.res?.data != null
          ? ListView(
              children: data.list.map((e) {
              return ExpansionCusCard(
                title: Text.rich(TextSpan(
                    text: data.model?.firstName,
                    style: mainHeadStyle,
                    children: [
                      TextSpan(
                        style: mainHeadStyle,
                        text:
                            ' ${data.model?.middleName ?? '' != '' ? '' : data.model?.middleName ?? ''}',
                      ),
                      TextSpan(
                          style: mainHeadStyle,
                          text: ' ${data.model?.lastName ?? ''}'),
                    ])),
                children: [
                  _CustomWidget(
                    children: [
                      Text(
                        'Leave',
                        style: headStyle,
                      ).paddingBottom(10),
                      const Divider(),
                      Text(
                        'Leave Count : ${data.model?.leaveCount ?? ''}',
                        style: textStyle,
                      ).paddingSymmetric(vertical: 5),
                    ],
                  ),
                ],
              );
            }).toList())
          : const LoadingAnim();
    });
  }
}

class _DocumentsTab extends StatelessWidget {
  const _DocumentsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeDashVm>(builder: (context, data, _) {
      final colorScheme = Theme.of(context).colorScheme;
      final textStyle =
          context.textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary);
      final headStyle = context.textTheme.titleMedium
          ?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold);
      final mainHeadStyle =
          context.textTheme.titleMedium?.copyWith(color: colorScheme.onPrimary);
      return data.res?.data != null
          ? ListView(
              children: data.list.map((e) {
              return ExpansionCusCard(
                title: Text.rich(TextSpan(
                    style: mainHeadStyle,
                    text: data.model?.firstName,
                    children: [
                      TextSpan(
                        style: mainHeadStyle,
                        text:
                            ' ${data.model?.middleName ?? '' != '' ? '' : data.model?.middleName ?? ''}',
                      ),
                      TextSpan(
                          style: mainHeadStyle,
                          text: ' ${data.model?.lastName ?? ''}'),
                    ])),
                children: [
                  _CustomWidget(
                    children: [
                      Text(
                        'Date Of Join : ${convertDateFormat(data.model?.doj ?? '')}',
                        style: textStyle,
                      ).paddingBottom(5),
                    ],
                  ),
                  _CustomWidget(
                    children: [
                      Text(
                        'Expiring Details',
                        style: headStyle,
                      ).paddingSymmetric(vertical: 10),
                      const Divider(),
                      Text(
                        'Passport : ${convertDateFormat(data.model?.ppExpiry ?? '')}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'ID : ${convertDateFormat(data.model?.idExpiry ?? '')}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Visa : ${convertDateFormat(data.model?.visaExpiry ?? '')}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Dl : ${convertDateFormat(data.model?.dlExpiry ?? '')}',
                        style: textStyle,
                      ).paddingBottom(5),
                    ],
                  ),
                ],
              );
            }).toList())
          : const LoadingAnim();
    });
  }
}

class _SalaryTab extends StatelessWidget {
  const _SalaryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeDashVm>(builder: (context, data, _) {
      final colorScheme = Theme.of(context).colorScheme;
      final textStyle =
          context.textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary);
      final headStyle = context.textTheme.titleMedium
          ?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold);
      final mainHeadStyle =
          context.textTheme.titleMedium?.copyWith(color: colorScheme.onPrimary);
      return data.res?.data != null
          ? ListView(
              children: data.list.map((e) {
              return ExpansionCusCard(
                title: Text.rich(TextSpan(
                    style: mainHeadStyle,
                    text: data.model?.firstName,
                    children: [
                      TextSpan(
                        style: mainHeadStyle,
                        text:
                            ' ${data.model?.middleName ?? '' != '' ? '' : data.model?.middleName ?? ''}',
                      ),
                      TextSpan(
                          style: mainHeadStyle,
                          text: ' ${data.model?.lastName ?? ''}'),
                    ]))
/*Text(data.model?.firstName)*/
                ,
                children: [
                  _CustomWidget(
                    children: [
                      Text(
                        'Salary',
                        style: headStyle,
                      ).paddingBottom(10),
                      const Divider(),
                      Text(
                        'Basic Salary : ${data.model?.salary?.basicSalary ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Total Salary : ${data.model?.salary?.totalSalary ?? ''}',
                        style: textStyle,
                      ).paddingBottom(5),
                    ],
                  ),
                ],
              );
            }).toList())
          : const LoadingAnim();
    });
  }
}

class _BankTab extends StatelessWidget {
  const _BankTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeDashVm>(builder: (context, data, _) {
      final colorScheme = Theme.of(context).colorScheme;
      final textStyle =
          context.textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary);
      final headStyle = context.textTheme.titleMedium
          ?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold);
      final mainHeadStyle =
          context.textTheme.titleMedium?.copyWith(color: colorScheme.onPrimary);
      return data.res?.data != null
          ? ListView(
              children: data.list.map((e) {
              return ExpansionCusCard(
                title: Text.rich(TextSpan(
                    style: mainHeadStyle,
                    text: data.model?.firstName,
                    children: [
                      TextSpan(
                        style: mainHeadStyle,
                        text:
                            ' ${data.model?.middleName ?? '' != '' ? '' : data.model?.middleName ?? ''}',
                      ),
                      TextSpan(
                          style: mainHeadStyle,
                          text: ' ${data.model?.lastName ?? ''}'),
                    ]))
/*Text(data.model?.firstName)*/
                ,
                children: [
                  _CustomWidget(
                    children: [
                      Text(
                        'Bank Details',
                        style: headStyle,
                      ).paddingBottom(10),
                      const Divider(),
                      Text(
                        'Holder Name : ${data.model?.bankDetails?.holderName ?? ' '}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Bank Name : ${data.model?.bankDetails?.bankName ?? ' '}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Acc No : ${data.model?.bankDetails?.accNumber ?? ' '}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'ISBN No : ${data.model?.bankDetails?.isbnNum ?? ' '}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Swift Code : ${data.model?.bankDetails?.swiftCode ?? ' '}',
                        style: textStyle,
                      ).paddingBottom(5),
                    ],
                  ),
                ],
              );
            }).toList())
          : const LoadingAnim();
    });
  }
}

class _ContractTab extends StatelessWidget {
  const _ContractTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeDashVm>(builder: (context, data, _) {
      final colorScheme = Theme.of(context).colorScheme;
      final textStyle =
          context.textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary);
      final headStyle =
          context.textTheme.titleMedium?.copyWith(color: colorScheme.onPrimary);

      return ListView(children: [
        ExpansionCusCard(
          title: Text.rich(TextSpan(
              style: headStyle,
              text: data.model?.firstName ?? '',
              children: [
                TextSpan(
                  style: headStyle,
                  text:
                      ' ${data.model?.middleName ?? '' != '' ? '' : data.model?.middleName ?? ''}',
                ),
                TextSpan(
                    style: headStyle, text: ' ${data.model?.lastName ?? ''}'),
              ])),
          children: [
            FutureBuilder<bool>(
              future: Future.delayed(const Duration(seconds: 6), () => true),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingAnim();
                } else if (snapshot.hasError) {
                  return const Text('Error');
                } else {
                  if (snapshot.data == true) {
                    return Center(
                      child: Text(
                        'No Data Available!',
                        style: textStyle,
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return Container();
                  }
                }
              },
            )
          ],
        )
      ]);
    });
  }
}

class _CustomWidget extends StatelessWidget {
  final List<Widget> children;

  const _CustomWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 0.6, color: colorScheme.outline)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ).paddingSymmetric(horizontal: 10, vertical: 10),
    );
  }
}
