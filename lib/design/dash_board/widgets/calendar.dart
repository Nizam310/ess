import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class MultiCalendar extends StatefulWidget {
  const MultiCalendar({Key? key}) : super(key: key);

  @override
  State<MultiCalendar> createState() => _MultiCalendarState();
}

final today = DateUtils.dateOnly(DateTime.now());

class _MultiCalendarState extends State<MultiCalendar> {
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];
  final config = CalendarDatePicker2Config(
    calendarType: CalendarDatePicker2Type.multi,
    selectedDayHighlightColor: const Color(0xFF3BBFC0),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Calendar',
              textAlign: TextAlign.center,
            ),
            CalendarDatePicker2(
              config: config,
              value: _multiDatePickerValueWithDefaultValue,
              onValueChanged: (dates) =>
                  setState(() => _multiDatePickerValueWithDefaultValue = dates),
            ),
            // const SizedBox(height: 10),
            /*  Wrap(
              children: [
                const Text('Selection(s):  '),
                const SizedBox(width: 10),
                Text(
                  _getValueText(
                    config.calendarType,
                    _multiDatePickerValueWithDefaultValue,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
              ],
            ),*/
            // const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  ///  value of this selected numbers

/* String _getValueText(
      CalendarDatePicker2Type datePickerType,
      List<DateTime?> values,
      ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
          .map((v) => v.toString().replaceAll('00:00:00.000', ''))
          .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }*/
}
