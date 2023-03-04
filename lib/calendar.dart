import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
  });

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime focusedDay = DateTime.now();

  void updateFocusedDay(DateTime newFocusedDay) {
    setState(() {
      focusedDay = newFocusedDay;
    });
  }

  void showPreviousMonth() {
    DateTime currentMonthStart = focusedDay.copyWith(day: 1);
    setState(() {
      focusedDay =
          currentMonthStart.subtract(const Duration(days: 1)).copyWith(day: 1);
    });
  }

  void showNextMonth() {
    DateTime currentMonthStart = focusedDay.copyWith(day: 1);
    setState(() {
      focusedDay =
          currentMonthStart.add(const Duration(days: 31)).copyWith(day: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Row(
            children: [
              Expanded(
                child: FittedBox(
                  child: SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: showPreviousMonth,
                            icon: const Icon(Icons.chevron_left_rounded)),
                        Text(
                          DateFormat('MMMM yyyy').format(focusedDay),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        IconButton(
                            onPressed: showNextMonth,
                            icon: const Icon(Icons.chevron_right_rounded)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TableCalendar(
            headerVisible: false,
            onDaySelected: (selectedDay, _) => updateFocusedDay(selectedDay),
            startingDayOfWeek: StartingDayOfWeek.monday,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: focusedDay,
            currentDay: focusedDay,
            availableCalendarFormats: const {CalendarFormat.month: "Month"},
            shouldFillViewport: true,
            daysOfWeekVisible: false,
            calendarStyle: CalendarStyle(
                todayTextStyle: TextStyle(color: Theme.of(context).canvasColor),
                todayDecoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle),
                outsideDaysVisible: false,
                defaultTextStyle: Theme.of(context).textTheme.bodyLarge!,
                weekendTextStyle: Theme.of(context).textTheme.bodyMedium!),
          ),
        ),
      ],
    );
  }
}
