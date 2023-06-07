import 'package:employee_self_service_flutter/constant/themes/theme.dart';
import 'package:flutter/material.dart';

import 'enum.dart';

class DecorationCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final Function()? onTap;
  const DecorationCard(
      {Key? key,
      required this.child,
      this.padding,
      this.margin,
      this.height,
      this.radius,
      this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themePro = ThemeNotifier.of(context, listen: false);

    return InkWell(
      radius: 0.0,
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: radius ?? BorderRadius.circular(5),
          gradient: themePro.themeMode == ThemeModeType.dark
              ? LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    ])
              : const LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                ]),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 0.2),
        ),
        child: child,
      ),
    );
  }
}
