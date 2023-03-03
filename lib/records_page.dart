import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
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
                    : Theme.of(context).colorScheme.primary.withAlpha(100),
                Colors.transparent
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
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
                        todayTextStyle: const TextStyle(color: Colors.black),
                        todayDecoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        outsideDaysVisible: false,
                        defaultTextStyle:
                            Theme.of(context).textTheme.bodyLarge!,
                        weekendTextStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey)),
                    headerStyle: HeaderStyle(
                        titleTextStyle:
                            Theme.of(context).textTheme.headlineMedium!),
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 28.0),
                  child: ListView(children: const [
                    TimeRecord(),
                    TimeRecord(),
                    TimeRecord(),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: FloatingActionButton.extended(
                          heroTag: "records",
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          backgroundColor: Colors.transparent,
                          onPressed: () => Navigator.pop(context),
                          label: const Text("Back"),
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    FloatingActionButton.large(
                      heroTag: "main",
                      backgroundColor: running
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primary,
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
