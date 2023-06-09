import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  final controller = MeeduPlayerController(
    controlsEnabled: false,
  );

  @override
  void initState() {
    super.initState();
    try {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.setDataSource(
          looping: true,
          DataSource(
            type: DataSourceType.asset,
            source: "assets/videos/cluster_turn_by_gleb.mp4",
          ),
          autoplay: true,
        );

        controller.setVolume(0);
      });
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double height = width / 16 / 9;
        return Stack(
          children: [
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: SizedBox(
                  width: width,
                  height: height,
                  child: MeeduVideoPlayer(
                    controller: controller,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.4),
                        Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.4),
                      ],
                      stops: const [0.0, 1.0],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                color: kIsWeb?Colors.black.withOpacity(0.9):Colors.black.withOpacity(0.6),
              ),
            ),
          ],
        );
      },
    );
  }
}
