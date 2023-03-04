import 'package:flutter/material.dart';
import 'package:time_tracker/balance_entry.dart';
import 'package:time_tracker/column_chart.dart';
import 'package:time_tracker/hero_divider.dart';
import 'package:time_tracker/nav_bar.dart';

class StatsPage extends StatelessWidget {
  final bool running;

  const StatsPage({super.key, required this.running});

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
                const Expanded(
                  flex: 2,
                  child: ColumnChart(
                    values: {
                      "Mo": 1.0,
                      "Tu": 1.5,
                      "We": 0.5,
                      "Th": -1.0,
                      "Fr": -0.5
                    },
                  ),
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
                  iconMiddle: const Icon(Icons.share),
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
