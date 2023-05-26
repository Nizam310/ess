import 'package:employee_self_service_flutter/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/button.dart';
import '../dash_board/dash_board_provider.dart';
import '../dash_board/widgets/calendar.dart';
import '../dash_board/widgets/leave_chart.dart';
import '../tasks/task_provider.dart';
import 'home_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: ColorS.primary)),
          dismissDirection: DismissDirection.horizontal,
          content: Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                const Icon(
                  Icons.notifications_active_outlined,
                  color: white,
                ).paddingRight(10),
                const Text(
                  "New Task Assigned",
                  style: TextStyle(color: white),
                ),
              ],
            ),
          ),
          duration: const Duration(seconds: 3),
        );
        //ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });

      return ListView(
        children: [
          const LeaveChart(),
          Consumer<TaskVm>(builder: (context, data, _) {
            return Card(
              child: ListTileTheme(
                shape: const RoundedRectangleBorder(),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: const Text(
                    "Task Management",
                  ),
                  children: [
                    SizedBox(
                      height: 90,
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Text('Completed Task',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith()),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                    child: Text('Updated Task',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith()),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                    child: Text('Created Task',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith()),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Text('10',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith()),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                    child: Text('10',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith()),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                    child: Text('10',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith()),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).paddingSymmetric(horizontal: 5, vertical: 10),
                    Visibility(
                      visible: context
                              .select((HomeVm value) => value.taskManagement) ==
                          false,
                      child: CusButton(
                          text: "Task management",
                          onTap: () {
                            context.read<HomeVm>().taskManagement = true;
                            context.read<HomeVm>().refresh();
                          }).paddingSymmetric(vertical: 10, horizontal: 10),
                    ),
                    Visibility(
                      visible: context
                              .select((HomeVm value) => value.taskManagement) ==
                          true,
                      child: Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              runSpacing: 5,
                              children: [
                                SizedBox(
                                    width: 150,
                                    child: CusButton(
                                        text: "Recently Created",
                                        onTap: () {
                                          context.read<DashBoardVm>().index = 5;
                                          context
                                              .read<HomeVm>()
                                              .taskManagement = false;
                                          context.read<HomeVm>().refresh();
                                          context.read<DashBoardVm>().refresh();
                                        })).paddingRight(5),
                                SizedBox(
                                    width: 150,
                                    child: CusButton(
                                        text: "Recently Updated",
                                        onTap: () {
                                          context
                                              .read<HomeVm>()
                                              .taskManagement = false;
                                          context.read<HomeVm>().refresh();
                                        })).paddingRight(5),
                                SizedBox(
                                    width: 150,
                                    child: CusButton(
                                        text: "Recently Completed",
                                        onTap: () {
                                          context
                                              .read<HomeVm>()
                                              .taskManagement = false;
                                          context.read<HomeVm>().refresh();
                                        })),
                              ],
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 7, vertical: 10),
                    ),
                  ],
                ),
              ),
            ).paddingSymmetric(vertical: 5, horizontal: 10);
          }),
          Row(
            children: const [
              Expanded(child: CalendarPage()),
            ],
          ).paddingSymmetric(horizontal: 10),
          ListTile(
            tileColor: ColorS.primary,
            title: const Text(
              "Apply for leave",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              context.read<DashBoardVm>().index = 2;
              context.read<DashBoardVm>().refresh();
            },
          ).paddingSymmetric(vertical: 5, horizontal: 15),
        ],
      );
    });
  }
}

/// signature and feedback
/*
          const Signature(
            link:
                'https://i.pinimg.com/originals/6a/14/a2/6a14a2565834045849ddda1eba92f92c.jpg',
            name: 'Attendee',
            type: CusAttendeeType.attendee,
          ),
          const Signature(
            link:
                'https://www.cognidox.com/hubfs/Digital%20Signature%20MHRA%20Remote%20Working.jpg',
            name: 'Customer',
            type: CusAttendeeType.customer,
          ),
          const FeedBack(),*/
