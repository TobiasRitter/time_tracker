import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ColumnChart extends StatelessWidget {
  final Map<String, double> values;

  const ColumnChart({super.key, required this.values});

  Text getDiffText(BuildContext context, int index) {
    double value = values.values.elementAt(index);
    String prefix = value > 0 ? "+" : "";
    return Text(
      prefix + value.toString(),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  List<BarChartGroupData> getBarGroups(Color color) {
    return values.values
        .mapIndexed((index, value) => BarChartGroupData(
              x: index,
              barRods: [BarChartRodData(toY: value, color: color, width: 32.0)],
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
                      values.keys.elementAt(index.toInt()),
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
