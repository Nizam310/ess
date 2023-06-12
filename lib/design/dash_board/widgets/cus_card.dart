import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../dash_board_provider.dart';

class CusCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final Function() onTap;
  final int? index;

  const CusCard({
    Key? key,
    required this.title,
    required this.icon,
    this.iconColor,
    required this.onTap,
     this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Consumer<DashBoardVm>(builder: (context, data, _) {
      return MouseRegion(
        onHover: (event) {
          data.hover = true;
          data.refresh();
        },
        onExit: (event) {
          data.hover = false;
          data.refresh();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Icon(
                        icon,
                        color: data.index == index
                            ? colorScheme.primary
                            : (iconColor ??
                            colorScheme.onPrimary),
                      ).paddingRight(20),
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: data.index == index
                                ? colorScheme.primary
                                : (colorScheme.onPrimary)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
