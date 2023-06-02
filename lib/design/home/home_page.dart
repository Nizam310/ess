import 'package:employee_self_service_flutter/design/home/widgets/monthly_capacity.dart';
import 'package:employee_self_service_flutter/design/home/widgets/task_indicaters.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

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
              side: BorderSide(color: Theme.of(context).colorScheme.primary)),
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
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        children:  [
          const Indicators(),
          const MonthlyCapacity().paddingSymmetric(vertical: 20),

        ],
      );
      /*   return ListView(
        children: [
          const LeaveChart(),
          Consumer<TaskVm>(builder: (context, data, _) {
            return Card(color: Colors.transparent,
              child: ListTileTheme(
                tileColor: Colors.transparent,
                shape: const RoundedRectangleBorder(),
                child: ExpansionTile(
                  backgroundColor: Colors.transparent,
                  initiallyExpanded: true,
                  title: const Text(
                    "Task Management",
                  ),
                  children: [
                    SizedBox(
                      height: 90,
                      child: Card(
                        color: Colors.transparent,
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
                                            ?.copyWith(color: ColorS.primary)),
                                  ),
                                   VerticalDivider(color: ColorS.primary),
                                  Expanded(
                                    child: Text('Updated Task',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith(color: ColorS.primary)),
                                  ),
                                   VerticalDivider(color: ColorS.primary),
                                  Expanded(
                                    child: Text('Created Task',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith(color: ColorS.primary)),
                                  ),
                                ],
                              ),
                            ),
                             Divider(color: ColorS.primary),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Text('10',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith(color: ColorS.primary)),
                                  ),
                                   VerticalDivider(color: ColorS.primary),
                                  Expanded(
                                    child: Text('10',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith(color: ColorS.primary)),
                                  ),
                                   VerticalDivider(color: ColorS.primary),
                                  Expanded(
                                    child: Text('10',
                                        textAlign: TextAlign.center,
                                        style: context.textTheme.labelSmall
                                            ?.copyWith(color: ColorS.primary)),
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
                                          ActivityType.RecentlyCreated;
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
                                          ActivityType.RecentlyUpdated;
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
                                        text: "Recently Completed",
                                        onTap: () {
                                          ActivityType.RecentlyCompleted;
                                           context.read<DashBoardVm>().index = 5;
                                          context
                                              .read<HomeVm>()
                                              .taskManagement = false;
                                          context.read<HomeVm>().refresh();
                                          context.read<DashBoardVm>().refresh();
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
      );*/
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
