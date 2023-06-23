import 'dart:io';

import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';

class FrontAndBackFiles extends StatelessWidget {
  final String title;
  final File? frontImage;
  final File? backImage;
  final Function() onTapFront;
  final Function() attachFront;
  final Function() attachBack;
  final Function() onTapBack;
  final Function() onClearFront;
  final Function() onClearBack;
  final Widget trailing;

  const FrontAndBackFiles(
      {Key? key,
      required this.title,
      required this.frontImage,
      required this.backImage,
      required this.onTapFront,
      required this.onTapBack,
      required this.onClearFront,
      required this.onClearBack,
      required this.attachFront,
      required this.attachBack,
      required this.trailing})
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
                  visible: frontImage == null,
                  child: InkWell(
                    onTap: attachFront,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorScheme.outline)),
                      child: Text(
                        'Attach Front',
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: colorScheme.outline),
                      ),
                    ),
                  ),
                ).paddingRight(5),
                frontImage != null
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: onTapFront,
                              child: Image.file(
                                frontImage!,
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -4,
                            right: -4,
                            child: Card(
                                shape: shape,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: onClearFront,
                                  child: Icon(
                                    Icons.clear,
                                    color: colorScheme.onPrimary,
                                    size: 12,
                                  ).paddingAll(3),
                                )),
                          ),
                        ],
                      ).paddingRight(5)
                    : const Text(''),
                Visibility(
                  visible: backImage == null,
                  child: InkWell(
                    onTap: attachBack,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorScheme.outline)),
                      child: Text(
                        'Attach Back',
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: colorScheme.outline),
                      ),
                    ),
                  ),
                ),
                backImage != null
                    ? InkWell(
                        onTap: onTapBack,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                backImage!,
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: -4,
                              right: -4,
                              child: Card(
                                  shape: shape,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(100),
                                    onTap: onClearBack,
                                    child: Icon(
                                      Icons.clear,
                                      color: colorScheme.onPrimary,
                                      size: 12,
                                    ).paddingAll(3),
                                  )),
                            ),
                          ],
                        ),
                      )
                    : const Text(''),
              ],
            ).paddingSymmetric(vertical: 10),
          ],
        ),
      ),
    );
  }
}
