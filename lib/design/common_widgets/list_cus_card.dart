import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ListCusCard extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Widget? trailing;
  final bool? trailingNeeded;
  final bool? iconNeeded;

  const ListCusCard(
      {Key? key,
      required this.text,
      this.icon,
      this.trailing,
      this.trailingNeeded = false,
      this.iconNeeded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary)),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Visibility(
                        visible: iconNeeded == true,
                        child: Icon(
                          icon,
                          color: Theme.of(context).colorScheme.primary,
                        )).paddingRight(10),
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
                if (trailingNeeded! && trailing != null) trailing!,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
