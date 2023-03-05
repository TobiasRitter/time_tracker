import 'package:flutter/material.dart';
import 'package:time_tracker/balance_entry.dart';
import 'package:time_tracker/column_chart.dart';
import 'package:time_tracker/hero_divider.dart';
import 'package:time_tracker/nav_bar.dart';

class StatsPage extends StatelessWidget {
  final bool running;
  final Map<String, Duration> workingHours;

  const StatsPage({
    super.key,
    required this.running,
    required this.workingHours,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(children: [
                Expanded(
                  flex: 2,
                  child: ColumnChart(workingHours: workingHours),
                ),
                const HeroDivider(),
                Expanded(
                  child: Column(
                    children: const [
                      BalanceEntry(
                        title: "Week",
                        icon: Icons.calendar_today,
                        duration: Duration(hours: 1, minutes: 30),
                      ),
                      BalanceEntry(
                        title: "Month",
                        icon: Icons.calendar_month,
                        duration: Duration(hours: 2, minutes: 40),
                      ),
                      BalanceEntry(
                        title: "Total",
                        icon: Icons.watch_later_outlined,
                        duration: Duration(hours: 5, minutes: 10),
                      ),
                    ],
                  ),
                ),
                NavBar(
                  running: running,
                  left: () => Navigator.pop(context),
                  middle: () {},
                  iconLeft: Icons.arrow_back,
                  iconMiddle: const Icon(Icons.settings),
                  labelLeft: "Back",
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
