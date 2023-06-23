import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common_widgets/decoration_card.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate = DateTime.now();
  Map<DateTime, List<String>> events = {};
  DateTime? clickedDate;
  DateTime? hoveredDate;

  void _addEvent(DateTime date) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Event'),
        content: TextField(
          decoration: const InputDecoration(labelText: 'Event Name'),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              setState(() {
                events[date] ??= [];
                events[date]!.add(value);
              });
              Navigator.of(ctx).pop();
            }
          },
        ),
      ),
    );
  }

  Widget _buildCalendarTile(DateTime date) {
    final isCurrentDate = date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day;

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        setState(() {
          if (clickedDate == date) {
            clickedDate = null;
          } else {
            clickedDate = date;
          }
        });
      },
      onHover: (value) {
        setState(() {
          hoveredDate = value ? date : null;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: (clickedDate == date)
                ? Theme.of(context).colorScheme.tertiary
                : isCurrentDate
                    ? white
                    : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            if (hoveredDate == date && clickedDate == null)
              Positioned(
                right: 0.0,
                top: 0.0,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  radius: 0.0,
                  onTap: () => _addEvent(date),
                  child: Container(
                    height: MediaQuery.of(context).size.width >287?15:10,
                    width: MediaQuery.of(context).size.width >287?15:10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child:  Icon(
                      Icons.add,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width >287?15:9,
                    ),
                  ),
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    date.day.toString(),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.surface),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    final year = _selectedDate.year;
    final month = _selectedDate.month;
    final firstDayOfMonth = DateTime(year, month, 1);
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final startIndex = firstDayOfMonth.weekday;
    final endIndex = startIndex + daysInMonth;
    final monthName = DateFormat.MMMM().format(_selectedDate);
    final color = Theme.of(context).colorScheme.surface;
    final weekdayLabels = [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: color,
              ),
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime(year, month - 1, 1);
                });
              },
            ),
            Text(
              '$monthName/$year',
              style: TextStyle(color: color),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                size: 20,
                color: color,
              ),
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime(year, month + 1, 1);
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekdayLabels
              .map((label) => Center(
                    child: Text(
                      label,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 13, color: color),
                    ),
                  ))
              .toList(),
        ).paddingSymmetric(vertical: 10),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (ctx, index) {
            if (index < startIndex || index >= endIndex) {
              return Container();
            }

            final day = index - startIndex + 1;
            final date = DateTime(year, month, day);

            return _buildCalendarTile(date);
          },
          itemCount: 7 * 6, // 7 days a week, 6 rows maximum
        ),
        if (clickedDate != null && events.containsKey(clickedDate))
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.6),
                        width: 0.56),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: events[clickedDate]!
                        .map((event) => Text(
                              '- $event',
                              style: TextStyle(fontSize: 14.0, color: color),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text(
          'View and add task by clicking',
          style: context.textTheme.titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.surface),
        ).paddingSymmetric(vertical: 10),
        DecorationCard(
            padding: const EdgeInsets.all(10),
            child: _buildCalendar()),
      ],
    );
  }
}
