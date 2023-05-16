import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

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
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 71,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: label??"",
                isDense: true,
              ),
              child: DropdownButton<T>(
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
                  color: Colors.transparent,
                ),
                icon: const Icon(null),
                focusColor: Colors.transparent,
              ),
            ).paddingSymmetric( horizontal: horPadding ?? 10, vertical: verPadding ?? 10),
          ),
        ),

      ],
    );
  }
}
