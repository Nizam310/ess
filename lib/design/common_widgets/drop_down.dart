import 'package:employee_self_service_flutter/constant/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant/enum.dart';

typedef ItemBuilder<T> = Widget Function(T item);
typedef OnChanged<T> = void Function(T? value);

class CusDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final ItemBuilder<T> itemBuilder;
  final OnChanged<T>? onChanged;
  final double? horPadding;
  final double? verPadding;
  final String? label;

  const CusDropdown({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.value,
    this.onChanged,
    this.horPadding,
    this.verPadding,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themePro = ThemeNotifier.of(context, listen: false);
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 71,
            child: InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.error),
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary)),
                labelText: label ?? "",
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                isDense: true,
              ),
              child: DropdownButton<T>(
                dropdownColor: themePro.themeMode == ThemeModeType.light
                    ? Colors.black
                    : Colors.white,
                key: UniqueKey(),
                value: value,
                items: items
                    .map<DropdownMenuItem<T>>((item) => DropdownMenuItem<T>(
                          value: item,
                          child: itemBuilder(item),
                        ))
                    .toList(),
                onChanged: onChanged,
                underline: Container(
                  height: 0,
                  // color: Colors.transparent,
                ),
                icon: const Icon(null),

              ),
            ).paddingSymmetric(
                horizontal: horPadding ?? 10, vertical: verPadding ?? 10),
          ),
        ),
      ],
    );
  }
}
