import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_tracker/utils.dart';

class TimeRecord extends StatelessWidget {
  final DateTime start;
  final DateTime stop;

  const TimeRecord({super.key, required this.start, required this.stop});

  @override
  Widget build(BuildContext context) {
    String startString = DateFormat('HH:mm').format(start);
    String stopString = DateFormat('HH:mm').format(stop);
    Duration duration = stop.difference(start);

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
                    const Expanded(
                      child: Icon(Icons.timer_outlined),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          Text(
                            "$startString - $stopString",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(width: 32.0),
                          Text(
                            getHoursAndMinutes(duration),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Icon(Icons.edit_outlined),
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
