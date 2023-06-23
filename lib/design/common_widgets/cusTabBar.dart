import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';

class CusTabBar extends StatelessWidget {
  final List<Widget> children;
  final List<Widget> tabs;
  final int length;
  const CusTabBar(
      {Key? key,
      required this.children,
      required this.tabs,
      required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: length,
        child: Column(
          children: [
            TabBar(
              unselectedLabelStyle: context.textTheme.bodySmall?.copyWith(
                color:Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
              ),
              labelColor: Theme.of(context).colorScheme.onPrimary,
              labelStyle: context.textTheme.bodyMedium?.copyWith(),
              indicatorColor: Theme.of(context).colorScheme.primary,
              tabs: tabs,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  Expanded(
                    child: TabBarView(children: children),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
