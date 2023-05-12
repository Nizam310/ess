import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(T item);
typedef OnChanged<T> = void Function(T? value);

class CusDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final ItemBuilder<T> itemBuilder;
  final OnChanged<T>? onChanged;
  final double? horPadding;
  final double? verPadding;
  const CusDropdown({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.value,
    this.onChanged,
    this.horPadding,
    this.verPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: horPadding ?? 10, vertical: verPadding ?? 10),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey,
          width: 0.2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
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
          ),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
