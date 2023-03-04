import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/balance_entry.dart';
import 'package:time_tracker/nav_bar.dart';

class StatsPage extends StatelessWidget {
  final bool running;

  const StatsPage({super.key, required this.running});

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
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 16.0),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceBetween,
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, _) => Padding(
                              padding: const EdgeInsets.only(top: 64.0),
                              child: Text(
                                getWeekDay(value.toInt()),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            reservedSize: 96,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      rangeAnnotations: RangeAnnotations(),
                      gridData: FlGridData(show: false),
                      barGroups: [
                        getBar(0, 1.0, Theme.of(context).colorScheme.primary),
                        getBar(1, 1.5, Theme.of(context).colorScheme.primary),
                        getBar(2, 0.5, Theme.of(context).colorScheme.primary),
                        getBar(3, -1.0, Theme.of(context).colorScheme.primary),
                        getBar(4, -0.5, Theme.of(context).colorScheme.primary),
                      ],
                    ),
                  ),
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
                      BalanceEntry(
                        title: "This week",
                        icon: Icons.calendar_today,
                      ),
                      BalanceEntry(
                        title: "This month",
                        icon: Icons.calendar_month,
                      ),
                      BalanceEntry(
                        title: "Total balance",
                        icon: Icons.watch_later_outlined,
                      ),
                    ],
                  ),
                ),
              ),
              NavBar(
                running: running,
                left: () => Navigator.pop(context),
                middle: () {},
                iconLeft: Icons.arrow_back,
                iconMiddle: const Icon(Icons.file_download),
                labelLeft: "Back",
              ),
            ]),
          ),
        ),
      ),
    );
  }

  String getWeekDay(int x) {
    List<String> weekdays = ["M", "T", "W", "T", "F"];
    return weekdays[x];
  }

  BarChartGroupData getBar(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [BarChartRodData(toY: y, color: color, width: 32.0)],
    );
  }
}
