import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../dash_board/dash_board_provider.dart';
import 'home_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeVm(),
      child:
          Consumer2<HomeVm, DashBoardVm>(builder: (context, data, dataDash, _) {
        return ListView(
          padding: const EdgeInsets.all(10),
          children: [
            ExpansionTile(
              title: const Text("Pending Tasks"),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 300,
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) => Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              width: 0.2,
                                              color: Colors.grey.shade400,
                                            )),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text("Task"),
                                                Text(data.timerText),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
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
                                        ).paddingRight(20),
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(vertical: 5),
            const ListTile(
              title: Text("Leave Balance :   ${'5'}"),
            ).paddingSymmetric(vertical: 5),
            ListTile(
              tileColor: const Color(0xFF4C4C4A),
              hoverColor: const Color(0xFF6B6B68),
              title: const Text(
                "Apply for leave",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                dataDash.index = 2;
                dataDash.refresh();
              },
            ).paddingSymmetric(vertical: 5),
          ],
        );
      }),
    );
  }
}
