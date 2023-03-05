import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/utils.dart';

class ColumnChart extends StatelessWidget {
  final Map<String, Duration> workingHours;

  const ColumnChart({super.key, required this.workingHours});

  Text getDiffText(BuildContext context, int index) {
    Duration duration = workingHours.values.elementAt(index);
    String prefix = duration.isNegative ? "" : "+";
    return Text(
      prefix + getHoursAndMinutes(duration, short: true),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  List<BarChartGroupData> getBarGroups(Color color) {
    return workingHours.values
        .mapIndexed((index, duration) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                    toY: duration.inMinutes.toDouble(),
                    color: color,
                    width: 32.0)
              ],
            ))
        .toList();
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
              getTitlesWidget: (index, _) => Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: Column(
                  children: [
                    Text(
                      workingHours.keys.elementAt(index.toInt()),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    getDiffText(context, index.toInt()),
                  ],
                ),
              ),
              reservedSize: 128,
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
        barGroups: getBarGroups(Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
