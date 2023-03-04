import 'package:flutter/material.dart';

class BalanceEntry extends StatelessWidget {
  final Duration duration;
  final String title;
  final IconData icon;

  const BalanceEntry({
    super.key,
    required this.title,
    required this.icon,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    int overallMinutes = duration.inMinutes;
    int hours = (overallMinutes / 60).floor();
    int minutes = overallMinutes - 60 * hours;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              child: SizedBox(
                width: 560,
                child: Row(
                  children: [
                    Icon(icon),
                    const SizedBox(width: 32.0),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Spacer(),
                    Text(
                      "${hours}h ${minutes}min",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
