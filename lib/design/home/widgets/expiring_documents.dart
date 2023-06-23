import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';

class CusDocCard extends StatelessWidget {
  final String monthName;
  final String expiryValue;
  final Function() onTap;
  final Color color;

  const CusDocCard(
      {Key? key,
      required this.monthName,
      required this.expiryValue,
      required this.color, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 110,
      child: /*Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),

        ),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              monthName,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: colorScheme.onPrimary),
            ),
            Text(
              expiryValue,
              style: context.textTheme.titleMedium?.copyWith(
                  color: colorScheme.tertiary,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ).paddingSymmetric(vertical: 10),
      )*/Card(
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(monthName,
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onPrimary,fontSize: 12,
                          fontWeight: FontWeight.bold))
                      ,
                  Center(
                    child: Text(
                      expiryValue,
                      style: context.textTheme.titleSmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w800,
                          fontSize: 25),
                    ),
                  ),
                ]),
          )),
    );
  }
}



