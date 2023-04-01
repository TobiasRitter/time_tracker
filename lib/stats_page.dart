import 'package:flutter/material.dart';
import 'package:time_tracker/balance_entry.dart';
import 'package:time_tracker/column_chart.dart';
import 'package:time_tracker/fading_list_view.dart';
import 'package:time_tracker/nav_bar.dart';
import 'package:time_tracker/skeleton.dart';

class StatsPage extends StatelessWidget {
  final bool running;
  final Map<String, Duration> workingHours;
  final Duration goal = const Duration(hours: 8);

  const StatsPage({
    super.key,
    required this.running,
    required this.workingHours,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, Duration> hourDifferences =
        workingHours.map((key, value) => MapEntry(key, value - goal));

    var navBar = NavBar(
      running: running,
      left: () => Navigator.pop(context),
      middle: () {},
      iconLeft: Icons.arrow_back,
      iconMiddle: const Icon(Icons.settings),
      labelLeft: "Back",
    );
    var balances = const FadingListView(
      children: [
        BalanceEntry(
          title: "This Week",
          icon: Icons.calendar_today,
          duration: Duration(hours: 1, minutes: 45),
        ),
        BalanceEntry(
          title: "This Month",
          icon: Icons.calendar_month,
          duration: Duration(hours: 2, minutes: 40),
        ),
        BalanceEntry(
          title: "Total",
          icon: Icons.watch_later_outlined,
          duration: Duration(hours: 5, minutes: 10),
        ),
      ],
    );
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
                child: Skeleton(
                  upper: ColumnChart(
                    hourDifferences: hourDifferences,
                  ),
                  lower: balances,
                  navBar: navBar,
                )),
          ),
        ),
      ),
    );
  }
}
