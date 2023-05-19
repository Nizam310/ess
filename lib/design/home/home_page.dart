import 'package:employee_self_service_flutter/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/button.dart';
import '../dash_board/dash_board_provider.dart';
import '../dash_board/widgets/calendar.dart';
import '../dash_board/widgets/feedback.dart';
import '../dash_board/widgets/leave_chart.dart';
import '../dash_board/widgets/signature.dart';
import 'home_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final snackBar = SnackBar(
          // backgroundColor: Colors.white,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(bottom: 400, right: 30, left: 30),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFF3BBFC0))),
          dismissDirection: DismissDirection.up,
          content: Row(
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
          duration: const Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
      return ListView(
        children: [
          const LeaveChart(),
          Visibility(
            visible:
                context.select((HomeVm value) => value.taskManagement) == false,
            child: CusButton(
                text: "Task management",
                onTap: () {
                  /* context.read<DashBoardVm>().index = 5;
                  context.read<DashBoardVm>().refresh();*/
                  context.read<HomeVm>().taskManagement = true;
                  context.read<HomeVm>().refresh();
                }).paddingSymmetric(vertical: 10, horizontal: 10),
          ),
          Visibility(
            visible:
                context.select((HomeVm value) => value.taskManagement) == true,
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
                                context.read<HomeVm>().taskManagement = false;
                                context.read<HomeVm>().refresh();
                                context.read<DashBoardVm>().refresh();
                              })).paddingRight(10),
                      SizedBox(
                          width: 150,
                          child: CusButton(
                              text: "Recently Updated",
                              onTap: () {
                                context.read<HomeVm>().taskManagement = false;
                                context.read<HomeVm>().refresh();
                              })).paddingRight(10),
                      SizedBox(
                          width: 150,
                          child: CusButton(
                              text: "Recently Completed",
                              onTap: () {
                                context.read<HomeVm>().taskManagement = false;
                                context.read<HomeVm>().refresh();
                              })),
                    ],
                  ),
                ),
              ],
            ),
          ),
          /*   Consumer<TaskVm>(builder: (context, data, _) {
            return ExpansionTile(
              title: const Text(
                "Pending Tasks",
              ),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) => Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: decoration,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text("Task")
                                                    .paddingBottom(5),
                                                const Text("21/12/23")
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(data.timerText),
                                                Center(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      data.startStop();
                                                      data.refresh();
                                                    },
                                                    icon: Icon(data.isRunning
                                                        ? Icons.stop_circle
                                                        : Icons.play_circle),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ).paddingRight(20),
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                    ),
                  ],
                ),
                CusButton(
                    text: "Show More",
                    onTap: () {
                      context.read<DashBoardVm>().index = 5;
                      context.read<DashBoardVm>().refresh();
                    })
              ],
            ).paddingSymmetric(vertical: 5, horizontal: 10);
          }),
        */
          const MultiCalendar().paddingSymmetric(vertical: 5, horizontal: 7),
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
          const FeedBack(),
          ListTile(
            tileColor: const Color(
              0xFF3BBFC0,
            ),
            title: const Text(
              "Apply for leave",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              context.read<DashBoardVm>().index = 2;
              context.read<DashBoardVm>().refresh();
            },
          ).paddingSymmetric(vertical: 5, horizontal: 10),
        ],
      );
    });
  }
}
