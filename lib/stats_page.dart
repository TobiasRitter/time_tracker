import 'package:fl_chart/fl_chart.dart';
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
                  child: ColumnChart(),
                ),
                const HeroDivider(),
                Expanded(
                  child: Column(
                    children: const [
                      BalanceEntry(
                        title: "Week",
                        icon: Icons.calendar_today_outlined,
                      ),
                      BalanceEntry(
                        title: "Month",
                        icon: Icons.calendar_month_outlined,
                      ),
                      BalanceEntry(
                        title: "Total",
                        icon: Icons.watch_later_outlined,
                      ),
                    ],
                  ),
                ),
                NavBar(
                  running: running,
                  left: () => Navigator.pop(context),
                  middle: () {},
                  iconLeft: Icons.arrow_back,
                  iconMiddle: const Icon(Icons.download_outlined),
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
