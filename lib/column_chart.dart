import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({super.key});

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

  @override
  Widget build(BuildContext context) {
    return BarChart(
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
    );
  }
}
