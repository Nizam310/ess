import 'package:carousel_slider/carousel_slider.dart';
import 'package:employee_self_service_flutter/design/home/home_provider.dart';
import 'package:flutter/Material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class LeaveTypesCarousel extends StatelessWidget {
  const LeaveTypesCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVm>(builder: (context, data, _) {
      return Column(
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                Expanded(
                  child: CarouselSlider(
                    items: data.list(context).map((item) {
                      return _DayDetailsCard(
                        leaveType: item['leaveType'],
                        takenLeaves: item['takenLeaves'],
                        totalLeaves: item['totalLeaves'],
                        emoji: item['emoji'],
                        emojiSize: item['emojiSize'],
                      );
                    }).toList(),
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      animateToClosest: true,

                      aspectRatio: 0.1 / 9,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class _DayDetailsCard extends StatelessWidget {
  final String leaveType;
  final String takenLeaves;
  final String totalLeaves;
  final String emoji;
  final double emojiSize;

  const _DayDetailsCard({
    Key? key,
    required this.leaveType,
    required this.takenLeaves,
    required this.totalLeaves,
    required this.emoji,
    required this.emojiSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset(emoji,
              key: UniqueKey(),
              animate: true,
              frameRate: FrameRate.max,
              height: emojiSize,
              width: emojiSize),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    takenLeaves,
                    style: context.textTheme.headlineMedium?.copyWith(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold),
                  ).paddingRight(10),
                  Text(
                    '/ $totalLeaves',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                  )
                ],
              ),
              Text(
                leaveType,
                style: context.textTheme.bodySmall
                    ?.copyWith(color: colorScheme.onPrimary),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ).paddingAll(15),
        ],
      ),
    );
  }
}
