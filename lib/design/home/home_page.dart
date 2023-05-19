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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      /*final decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFF3BBFC0),
          ));*/
      return ListView(
        // padding: const EdgeInsets.all(10),
        children: [

          const LeaveChart(),
          CusButton(text: "Task management", onTap:(){
            context.read<DashBoardVm>().index = 5;
            context.read<DashBoardVm>().refresh();
          }).paddingSymmetric(vertical: 10,horizontal: 10),
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
