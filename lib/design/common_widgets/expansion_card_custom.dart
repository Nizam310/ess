import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';

class ExpansionCusCard extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final List<Widget> children;
  const ExpansionCusCard({Key? key, required this.title, required this.children, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
       /* side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),*/
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTileTheme(
        child: ExpansionTile(
          initiallyExpanded: false,
          title: title,
          subtitle: subtitle,
          expandedAlignment: Alignment.topLeft,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ).paddingSymmetric(horizontal: 10,vertical: 10)
          ]
          ,
        ),
      ),
    );
  }
}
