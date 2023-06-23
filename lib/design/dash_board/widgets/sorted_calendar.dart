import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SortCalendar extends StatelessWidget {
  const SortCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final style = TextStyle(color: colorScheme.onPrimary);
    return PopupMenuButton(
      splashRadius: 0.1,
      shape: const RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(100.0),
          ),
      icon: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colorScheme.outline)),
          child: Center(
            child: Icon(
              CupertinoIcons.calendar,
              color: colorScheme.outline,
              size: 12,
            ),
          )),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
            child: Text(
          'Today',
          style: style,
        )),
        PopupMenuItem(
            child: Text(
          'Yesterday',
          style: style,
        )),
        PopupMenuItem(
            child: Text(
          'This Week',
          style: style,
        )),
        PopupMenuItem(
            child: Text(
          'Last 7 Days',
          style: style,
        )),
        PopupMenuItem(
            child: Text(
          'This Month',
          style: style,
        )),
        PopupMenuItem(
            child: Text(
          'Last 30 Days',
          style: style,
        )),
        PopupMenuItem(
            child: Text(
          'Last 3 Months',
          style: style,
        )),
        PopupMenuItem(
            child: Text(
          'This Year',
          style: style,
        )),
        PopupMenuItem(
          child: Text(
            'Custom',
            style: style,
          ),
          onTap: () {
            Future.delayed(
              const Duration(minutes: 0),
              () async => calendarDialogue(context),
            );
          },
        ),
      ],
    );
  }

  calendarDialogue(BuildContext context) async {
    final colorScheme = Theme.of(context).colorScheme;
    final dayTextStyle =
        TextStyle(color: colorScheme.onPrimary, fontWeight: FontWeight.w700);
    final weekendTextStyle =
        TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
    final anniversaryTextStyle = TextStyle(
      color: colorScheme.onPrimary,
      fontWeight: FontWeight.w700,
    );
    List<DateTime?> dialogCalendarPickerValue = [
      DateTime.now(),
    ];

    final config = CalendarDatePicker2WithActionButtonsConfig(
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: colorScheme.primary,
      selectedYearTextStyle: TextStyle(
        color: colorScheme.surface,
      ),
      lastMonthIcon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: colorScheme.primary,
        size: 15,
      ),
      nextMonthIcon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colorScheme.primary,
        size: 15,
      ),
      yearTextStyle: TextStyle(
        color: colorScheme.onPrimary,
      ),
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: TextStyle(
        color: colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: TextStyle(
        color: colorScheme.onPrimary,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: colorScheme.surface),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday) {
          textStyle = weekendTextStyle;
        }
        if (DateUtils.isSameDay(date, DateTime.now())) {
          textStyle = anniversaryTextStyle;
        }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        if (date.day % 3 == 0 && date.day % 9 != 0) {
          dayWidget = Container(
            decoration: decoration,
            child: Center(
              child: Text(
                MaterialLocalizations.of(context).formatDecimal(date.day),
                style: textStyle,
              ),
            ),
          );
        }
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Text(
                  year.toString(),
                  style: textStyle,
                ),
              ),
            ),
          ),
        );
      },
    );
    await showCalendarDatePicker2Dialog(
      context: context,
      config: config,
      dialogSize: const Size(325, 400),
      borderRadius: BorderRadius.circular(15),
      value: dialogCalendarPickerValue,
      dialogBackgroundColor: colorScheme.background,
    );
  }
}
