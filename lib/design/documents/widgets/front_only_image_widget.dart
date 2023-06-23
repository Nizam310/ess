import 'dart:io';

import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';

class FrontOnly extends StatelessWidget {
  final String title;
  final File? image;
  final Function() onTapAttach;
  final Function() onTapImage;
  final Function() onClear;
  final Function() onSave;
  final Widget trailing;

  const FrontOnly(
      {Key? key,
      required this.title,
      required this.image,

      required this.onTapAttach,
      required this.onClear,

      required this.onSave, required this.onTapImage, required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    final colorScheme = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(100);
    final shape = RoundedRectangleBorder(
        borderRadius: radius, side: BorderSide(color: colorScheme.onPrimary));

    return Card(
        child: ListTileTheme(
      child: ExpansionTile(
          title: Text(title),
          trailing: trailing,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: image == null,
                  child: InkWell(
                    onTap: onTapAttach,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorScheme.outline)),
                      child: Text(
                        'Attach Document',
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: colorScheme.outline),
                      ),
                    ),
                  ),
                ).paddingRight(5),
                image != null
                    ? InkWell(
                        onTap: onTapImage,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                image!,
                                height: 150,
                              ),
                            ),
                            Positioned(
                              top: -4,
                              right: -4,
                              child: Card(
                                  shape: shape,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(100),
                                    onTap: onClear,
                                    child: Icon(
                                      Icons.clear,
                                      color: colorScheme.onPrimary,
                                      size: 12,
                                    ).paddingAll(3),
                                  )),
                            )
                          ],
                        ),
                      )
                    : const Text(''),
              ],
            ).paddingSymmetric(vertical: 10),
          ]),
    ));
  }
}
