import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../dash_board/dash_board_provider.dart';
import 'home_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side:  BorderSide(color: Colors.grey.shade400));

    return ChangeNotifierProvider(
      create: (context) => HomeVm(),
      child:
          Consumer2<HomeVm, DashBoardVm>(builder: (context, data, dataDash, _) {
        return ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey.shade400,
                  )),
              child: ExpansionTile(
                title: const Text("Pending Tasks"),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context,
                                    index) =>  Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.grey.shade400,)
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text("Task"),
                                                  Text(data.timerText),
                                                ],
                                              ),
                                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: IconButton(
                                                      onPressed: () {
                                                        data.startStop();
                                                      },
                                                      icon: Icon(data.isRunning
                                                          ? Icons.stop_circle
                                                          : Icons.play_circle),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                  ),
                                ],
                              )
                       ),
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 20, vertical: 5),
            ),
            ListTile(
              shape: shape,
              title: const Text("Leave Balance :   ${'5'}"),
            ).paddingSymmetric(horizontal: 20, vertical: 5),
            ListTile(
              shape: shape,
              hoverColor: Color(0xFF6098FE),
              title: const Text("Apply for leave"),
              onTap: () {
                dataDash.index = 2;
                dataDash.refresh();
              },
            ).paddingSymmetric(horizontal: 20, vertical: 5),
          ],
        );
      }),
    );
  }
}
