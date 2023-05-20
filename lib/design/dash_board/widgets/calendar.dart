import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:table_calendar/table_calendar.dart';

class MultiCalendar extends StatefulWidget {
  const MultiCalendar({Key? key}) : super(key: key);

  @override
  State<MultiCalendar> createState() => _MultiCalendarState();
}

final today = DateUtils.dateOnly(DateTime.now());

class _MultiCalendarState extends State<MultiCalendar> {
  List<DateTime> selectedDates = []; // List to store the selected dates

  bool isDaySelected(DateTime day) {
    return selectedDates.contains(day);
  }

  bool isSunday(DateTime day) {
    return day.weekday == DateTime.sunday;
  }

  List<DateTime?> _multiDatePickerValueWithDefaultValue = [DateTime.now()];
  final config = CalendarDatePicker2Config(
    calendarType: CalendarDatePicker2Type.range,
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
            const Text(
              'Calendar',
              textAlign: TextAlign.center,
            ).paddingAll(10),
            MediaQuery.of(context).size.width > 318
                ? CalendarDatePicker2(
                    config: config,
                    value: _multiDatePickerValueWithDefaultValue,
                    onValueChanged: (dates) => setState(
                        () => _multiDatePickerValueWithDefaultValue = dates),
                  )
                : TableCalendar(
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      headerPadding: EdgeInsets.symmetric(vertical: 3),
                      headerMargin: EdgeInsets.only(
                        bottom: 20,
                      ),
                    ),
                    firstDay: DateTime.utc(2010, 10, 16),
                    calendarStyle: CalendarStyle(
                      holidayDecoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          shape: BoxShape.circle),
                      todayDecoration: const BoxDecoration(
                        color: Color(0xFF3BBFC0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    onDaySelected: (selectedDay, focusedDay) {
                      if (isDaySelected(selectedDay)) {
                        selectedDates.remove(selectedDay);
                      } else {
                        selectedDates.add(selectedDay);
                      }
                      setState(() {});
                    },
                  ).paddingSymmetric(horizontal: 10, vertical: 10),
          ],
        ),
      ),
    );
  }
}
