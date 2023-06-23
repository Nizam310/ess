import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../task_provider.dart';

class TimerClass extends StatelessWidget {
  const TimerClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskVm>(builder: (context, data, _) {
      return Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            data.pauseResume == false
                ? CusRoundCard(
                    icon: CupertinoIcons.pause,
                    onTap: () {
                      data.stopWatchTimer.onStopTimer();
                      data.pauseResume = true;
                      data.refresh();
                    },
                  ).paddingSymmetric(horizontal: 5)
                : CusRoundCard(
                    icon: CupertinoIcons.play,
                    onTap: () {
                      data.stopWatchTimer.onStartTimer();
                      data.pauseResume = false;
                      data.tapped=true;
                      data.refresh();
                    },
                  ).paddingSymmetric(horizontal: 5),
            data.tapped == false
                ? const Text('Start Tracking')
                : StreamBuilder<int>(
                    stream: data.stopWatchTimer.rawTime,
                    initialData: 0,
                    builder: (context, snap) {
                      final displayTime =
                          StopWatchTimer.getDisplayTime(snap.data!);
                      return Text(
                        displayTime,
                        style: const TextStyle(
                          fontFamily: 'Helvetica',
                        ),
                      );
                    },
                  ),
            Visibility(
              visible: data.tapped == true,
              child: CusRoundCard(
                icon: CupertinoIcons.restart,
                onTap: () {
                  data.stopWatchTimer.onResetTimer();
                 data.pauseResume = true;
                  data.tapped= false;
                  data.refresh();
                },
              ),
            ).paddingSymmetric(horizontal: 5),
          ],
        ).paddingAll(10),
      );
    });
  }
}

class CusRoundCard extends StatelessWidget {
  final IconData icon;
  final Function() onTap;

  const CusRoundCard({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        child: Icon(
          icon,
          size: 15,
        ),
      ),
    );
  }
}
