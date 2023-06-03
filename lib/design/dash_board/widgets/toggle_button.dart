import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/enum.dart';
import '../../../constant/themes/theme.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeNotifier.of(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 1.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: themeProvider.themeMode == ThemeModeType.dark
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => themeProvider.toggleThemeMode(),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(  color: themeProvider.themeMode == ThemeModeType.light
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.sun_max,
                color: Colors.white,
                size: 11,
              ),
            ),
          ).paddingRight(5),
          InkWell(
            onTap: () => themeProvider.toggleThemeMode(),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(color: themeProvider.themeMode == ThemeModeType.dark
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.moon_fill,
                color: Colors.white,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
