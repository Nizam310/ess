import 'package:cherry_toast/cherry_toast.dart';
import 'package:employee_self_service_flutter/design/common_widgets/button.dart';
import 'package:employee_self_service_flutter/design/common_widgets/expansion_card_custom.dart';
import 'package:employee_self_service_flutter/design/common_widgets/text_field.dart';
import 'package:employee_self_service_flutter/design/tasks/task_provider.dart';
import 'package:employee_self_service_flutter/design/tasks/work_items/widget/timer.dart';
import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/cus_tab_bar.dart';

class TaskSummary extends StatelessWidget {
  const TaskSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
                child: CusTabBar(
              length: 4,
              tabs: const [
                Tab(
                  text: 'Waiting',
                ),
                Tab(
                  text: 'Acceptance',
                ),
                Tab(
                  text: 'Rejected',
                ),
                Tab(
                  text: 'Completed',
                ),
              ],
              children: [
                ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  children: const [
                    _CusCard(
                      type: TaskSummaryType.waiting,
                    ),
                  ],
                ),
                ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  children: const [
                    _CusCard(
                      type: TaskSummaryType.acceptance,
                    ),
                  ],
                ),
                ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  children: const [
                    _CusCard(
                      type: TaskSummaryType.rejected,
                    ),
                  ],
                ),
                ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  children: const [
                    _CusCard(
                      type: TaskSummaryType.completed,
                    ),
                  ],
                ),
              ],
            ))
          ],
        )
      ],
    );
  }
}

class _CusCard extends StatefulWidget {
  final TaskSummaryType type;

  const _CusCard({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<_CusCard> createState() => _CusCardState();
}

class _CusCardState extends State<_CusCard> {
  List<TaskModel> list = [
    TaskModel(
        title: 'Connect Api',
        assignedBy: 'Hr',
        assignedTo: 'Nizam',
        ended: '00:00',
        started: '00:00',
        period: '3 Hr',
        reject: false,
        rejectNote: 'I have Pending tasks assign to someone else',
        submitted: false,
        type: TaskSummaryType.waiting),
    TaskModel(
        title: 'Create homepage',
        assignedBy: 'Manager',
        assignedTo: 'Nizam',
        ended: '00:00',
        started: '00:00',
        period: '3 Hr',
        rejectNote: 'I have Pending tasks assign to someone else',
        reject: false,
        submitted: false,
        type: TaskSummaryType.acceptance),
    TaskModel(
        title: 'Create homepage',
        assignedBy: 'Manager',
        assignedTo: 'Nizam',
        ended: '00:00',
        started: '00:00',
        period: '3 Hr',
        rejectNote: 'I have Pending tasks assign to someone else',
        reject: false,
        submitted: false,
        type: TaskSummaryType.rejected),
    TaskModel(
        title: 'Create homepage',
        assignedBy: 'Manager',
        assignedTo: 'Nizam',
        ended: '00:00',
        started: '00:00',
        period: '3 Hr',
        rejectNote: 'I have Pending tasks assign to someone else',
        reject: false,
        submitted: false,
        type: TaskSummaryType.completed),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final style = TextStyle(color: colorScheme.onPrimary);
    return Column(
      children: [
        for (var e in list)
          ExpansionCusCard(
            title: Text(
              '${e.title}',
              style: style,
            ),
            children: [
              Text(
                'Assigned By : ${e.assignedBy}',
                style: style,
              ),
              Text(
                'Assigned To : ${e.assignedTo}',
                style: style,
              ),
              Text(
                'Period : ${e.period}',
                style: style,
              ),
              Text(
                'Started : ${e.started}',
                style: style,
              ),
              Text(
                'Ended : ${e.ended}',
                style: style,
              ),
              Visibility(
                visible: widget.type == TaskSummaryType.rejected,
                child: Text(
                  'Reason for the rejection : ${e.rejectNote}',
                  style: style,
                ),
              ),
              Visibility(
                  visible: widget.type == TaskSummaryType.acceptance,
                  child: const TimerClass()),
              Visibility(
                visible: e.submitted == false,
                child: Visibility(
                    visible: (e.reject == true &&
                        widget.type == TaskSummaryType.waiting),
                    child: Column(
                      children: [
                        CusTextField(
                          labelText: 'Note',
                          onChanged: (val) {
                            setState(() {
                              e.note = val;
                            });
                          },
                        ).paddingSymmetric(vertical: 10),
                        CusButton(
                            text: 'Submit',
                            onTap: () {
                              setState(() {});

                              e.note == ''
                                  ? CherryToast.error(
                                      title: Text(
                                      'Type something first',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(color: colorScheme.shadow),
                                    )).show(context)
                                  : e.submitted = true;
                              e.note == ''
                                      ? ''
                                      : CherryToast.error(
                                          title: Text(
                                          'Rejected',
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                                  color: colorScheme.shadow),
                                        )).show(
                                          context) /*ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Rejected')))*/
                                  ;
                              e.note == '' ? '' : e.note = '';
                              context.read<TaskVm>().refresh();
                            })
                      ],
                    )),
              ),
              Visibility(
                  visible: !e.submitted! &&
                      !e.reject! &&
                      widget.type == TaskSummaryType.waiting &&
                      e.accepted == true,
                  child: Row(
                    children: [
                      Expanded(
                          child: CusButton(
                        text: 'Reject',
                        onTap: () {
                          e.reject = true;
                          setState(() {});
                          context.read<TaskVm>().refresh();
                        },
                        hoverColor: colorScheme.error,
                        color: colorScheme.onError,
                      ).paddingSymmetric(horizontal: 5)),
                      Expanded(
                          child: CusButton(
                              text: 'Accept',
                              onTap: () {
                                CherryToast.success(
                                    displayCloseButton: false,
                                    title: Text(
                                      'Accepted',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(color: colorScheme.shadow),
                                    )).show(context);
                                setState(() {
                                  e.accepted = false;
                                  widget.type == TaskSummaryType.acceptance;
                                });
                                /*
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Accepted')));*/
                              }).paddingSymmetric(horizontal: 5))
                    ],
                  ).paddingSymmetric(vertical: 10)),
            ],
          ).paddingSymmetric(vertical: 3),
      ],
    );
  }
}

enum TaskSummaryType { waiting, acceptance, rejected, completed }

class TaskModel {
  String? note;
  bool? submitted;
  bool? reject;
  bool? accepted;
  String? title;
  String? assignedBy;
  String? assignedTo;
  String? period;
  String? started;
  String? ended;
  TaskSummaryType? type;
  String? rejectNote;

  TaskModel({
    this.rejectNote,
    this.note,
    this.submitted = false,
    this.reject = false,
    this.accepted = true,
    this.title,
    this.assignedBy,
    this.assignedTo,
    this.period,
    this.started,
    this.ended,
    this.type,
  });
}
