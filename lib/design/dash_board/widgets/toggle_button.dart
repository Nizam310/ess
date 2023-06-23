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
            color: Theme.of(context).colorScheme.outline/*themeProvider.themeMode == ThemeModeType.dark
                ? Theme.of(context).colorScheme.onPrimary
                : Colors.white*/,
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => themeProvider.toggleThemeMode(),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(  color: themeProvider.themeMode == ThemeModeType.light
                    ? Theme.of(context).colorScheme.outline
                    : Colors.transparent,),
                shape: BoxShape.circle,
              ),
              child:  Icon(
                CupertinoIcons.sun_max,
                color:Theme.of(context).colorScheme.onPrimary,
                size: 11,
              ),
            ),
          ).paddingRight(1),
          InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () => themeProvider.toggleThemeMode(),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                border: Border.all(color: themeProvider.themeMode == ThemeModeType.dark
                    ? Theme.of(context).colorScheme.onPrimary
                    : Colors.transparent,),
                shape: BoxShape.circle,
              ),
              child:  Icon(
                CupertinoIcons.moon_fill,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
