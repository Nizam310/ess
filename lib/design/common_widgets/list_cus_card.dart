import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ListCusCard extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Widget? trailing;
  final bool? trailingNeeded;
  final bool? iconNeeded;
  final TextStyle? textStyle;
  final Color? iconColor;
  final Color? tileColor;
  final Function()? onTap;

  const ListCusCard(
      {Key? key,
      required this.text,
      this.icon,
      this.trailing,
      this.trailingNeeded = false,
      this.iconNeeded = false,
      this.textStyle,
      this.iconColor,
      this.onTap,
      this.tileColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color:
                          tileColor ?? Theme.of(context).colorScheme.primary)),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Visibility(
                          visible: iconNeeded == true,
                          child: Icon(
                            icon,
                            color: iconColor ??
                                Theme.of(context).colorScheme.primary,
                          )).paddingRight(10),
                      Text(
                        text,
                        style: textStyle ??
                            TextStyle(
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
      ),
    );
  }
}
