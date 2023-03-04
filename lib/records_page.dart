import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_tracker/nav_bar.dart';
import 'package:time_tracker/time_record.dart';

class RecordsPage extends StatelessWidget {
  final bool running;

  const RecordsPage({super.key, required this.running});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                running
                    ? Theme.of(context).colorScheme.secondary.withAlpha(150)
                    : Theme.of(context).colorScheme.primary.withAlpha(75),
                Colors.transparent
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(
              children: [
                Expanded(
                  child: TableCalendar(
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    availableCalendarFormats: const {
                      CalendarFormat.month: "Month"
                    },
                    shouldFillViewport: true,
                    daysOfWeekVisible: false,
                    calendarStyle: CalendarStyle(
                        // isTodayHighlighted: false,
                        todayTextStyle:
                            TextStyle(color: Theme.of(context).canvasColor),
                        todayDecoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle),
                        outsideDaysVisible: false,
                        defaultTextStyle:
                            Theme.of(context).textTheme.bodyLarge!,
                        weekendTextStyle:
                            Theme.of(context).textTheme.bodyMedium!),
                    headerStyle: HeaderStyle(
                        titleTextStyle:
                            Theme.of(context).textTheme.headlineMedium!),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Divider(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ListView(
                      children: const [
                        TimeRecord(),
                        TimeRecord(),
                        TimeRecord(),
                      ],
                    ),
                  ),
                ),
                NavBar(
                  running: running,
                  left: () => Navigator.pop(context),
                  middle: () {},
                  iconLeft: Icons.arrow_back,
                  iconMiddle: const Icon(Icons.add),
                  labelLeft: "Back",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
