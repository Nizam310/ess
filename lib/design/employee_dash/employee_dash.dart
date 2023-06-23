import 'package:employee_self_service_flutter/design/common_widgets/cusTabBar.dart';
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
    return ChangeNotifierProvider(
      create: (_) => EmployeeDashVm(),
      child: Consumer<EmployeeDashVm>(builder: (context, data, _) {
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
      }),
    );
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
          ? ListView(
              children: data.list.map((e) {
              return ExpansionCusCard(
                title: Text.rich(
                    TextSpan(text: e['first_name'], style: mainHead, children: [
                  TextSpan(
                    text: ' ${e['middle_name'] != '' ? '' : e['middle_name']}',
                    style: mainHead,
                  ),
                  TextSpan(
                    text: ' ${e['last_name']}',
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
                        'ID : ${e['_id']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Employee No : ${e['emp_number']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'User id : ${e['user_id']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Gender: ${e['user_id']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Martial Status:  : ${e['martial_status']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Place Of Birth : ${e['place_of_birth']}',
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
                        'Mobile  : ${e['mobile']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Email : ${e['email']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Alternative Phone : ${e['alt_phone']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Current Address : ${e['c_address']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Residential Address : ${e['r_address']}',
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
                        'Department name : ${e['department']['name']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Designation : ${e['designation']['name']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Break Time : ${e['break_time']} hr',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Working Hours : ${e['working_hours']} hr',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Date Of Birth : ${e['dob']}',
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
                    text: e['first_name'],
                    style: mainHeadStyle,
                    children: [
                      TextSpan(
                        style: mainHeadStyle,
                        text:
                            ' ${e['middle_name'] != '' ? '' : e['middle_name']}',
                      ),
                      TextSpan(
                          style: mainHeadStyle, text: ' ${e['last_name']}'),
                    ])) /*Text(e['first_name'])*/,
                children: [
                  _CustomWidget(
                    children: [
                      Text(
                        'Leave',
                        style: headStyle,
                      ).paddingBottom(10),
                      const Divider(),
                      Text(
                        'Leave Count : ${e['leave_count']}',
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
                    text: e['first_name'],
                    children: [
                      TextSpan(
                        style: mainHeadStyle,
                        text:
                            ' ${e['middle_name'] != '' ? '' : e['middle_name']}',
                      ),
                      TextSpan(
                          style: mainHeadStyle, text: ' ${e['last_name']}'),
                    ])),
                children: [
                  _CustomWidget(
                    children: [
                      Text(
                        'Date Of Join : ${convertDateFormat(e['doj'])}',
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
                        'Passport : ${convertDateFormat(e['pp_expiry'])}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'ID : ${convertDateFormat(e['id_expiry'])}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Visa : ${convertDateFormat(e['visa_expiry'])}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Dl : ${convertDateFormat(e['dl_expiry'])}',
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
                    text: e['first_name'],
                    children: [
                      TextSpan(
                        style: mainHeadStyle,
                        text:
                            ' ${e['middle_name'] != '' ? '' : e['middle_name']}',
                      ),
                      TextSpan(
                          style: mainHeadStyle, text: ' ${e['last_name']}'),
                    ])) /*Text(e['first_name'])*/,
                children: [
                  _CustomWidget(
                    children: [
                      Text(
                        'Salary',
                        style: headStyle,
                      ).paddingBottom(10),
                      const Divider(),
                      Text(
                        'Basic Salary : ${e['salary']['basic_salary']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Total Salary : ${e['salary']['total_salary']}',
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
                    text: e['first_name'],
                    children: [
                      TextSpan(
                        style: mainHeadStyle,
                        text:
                            ' ${e['middle_name'] != '' ? '' : e['middle_name']}',
                      ),
                      TextSpan(
                          style: mainHeadStyle, text: ' ${e['last_name']}'),
                    ])) /*Text(e['first_name'])*/,
                children: [
                  _CustomWidget(
                    children: [
                      Text(
                        'Bank Details',
                        style: headStyle,
                      ).paddingBottom(10),
                      const Divider(),
                      Text(
                        'Holder Name : ${e['bank_details']['holder_name']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Bank Name : ${e['bank_details']['bank_name']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Acc No : ${e['bank_details']['acc_number']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'ISBN No : ${e['bank_details']['isbn_num']}',
                        style: textStyle,
                      ).paddingBottom(5),
                      Text(
                        'Swift Code : ${e['bank_details']['swift_code']}',
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
      return ListView(
          children: data.list.map((e) {
        return ExpansionCusCard(
          title: Text.rich(
              TextSpan(style: headStyle, text: e['first_name'], children: [
            TextSpan(
              style: headStyle,
              text: ' ${e['middle_name'] != '' ? '' : e['middle_name']}',
            ),
            TextSpan(style: headStyle, text: ' ${e['last_name']}'),
          ])),
          children: [
            FutureBuilder<bool>(
              future: Future.delayed(const Duration(seconds: 100), () => true),
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
        );
      }).toList());
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
