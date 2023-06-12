import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class CalendarRangePicker extends StatefulWidget {
  const CalendarRangePicker({Key? key}) : super(key: key);

  @override
  State<CalendarRangePicker> createState() => _CalendarRangePickerState();
}

class _CalendarRangePickerState extends State<CalendarRangePicker> {
  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now()
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final config = CalendarDatePicker2WithActionButtonsConfig(
      customModePickerIcon: Icon(
        Icons.arrow_drop_down_outlined,
        color: colorScheme.outline,
      ),
      cancelButton: const Text(''),
      okButton: const Text(''),
      selectedDayTextStyle: TextStyle(color: colorScheme.surface),
      dayTextStyle: TextStyle(color: colorScheme.onPrimary),
      selectedDayHighlightColor: colorScheme.primary,
      selectedRangeHighlightColor:
          colorScheme.primary.withOpacity(0.5),
      calendarType: CalendarDatePicker2Type.range,
      disableModePicker: false,
      yearTextStyle: TextStyle(color: colorScheme.onPrimary),
      selectedYearTextStyle: TextStyle(color: colorScheme.surface),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      weekdayLabelTextStyle: TextStyle(color: colorScheme.onPrimary),
      nextMonthIcon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colorScheme.outline,
      ),
      controlsTextStyle: TextStyle(color: colorScheme.outline),
      lastMonthIcon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: colorScheme.outline,
      ),
    );

    return CalendarDatePicker2WithActionButtons(
        config: config,
        value: _rangeDatePickerWithActionButtonsWithValue,
        onValueChanged: (dates) =>
            setState(() => _rangeDatePickerWithActionButtonsWithValue = dates));
  }

  /// value of the date picker date
/*String _getValueText(
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
