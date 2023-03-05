import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_tracker/utils.dart';

class SessionInfo extends StatelessWidget {
  final DateTime? start;
  final DateTime current;

  const SessionInfo({
    super.key,
    required this.start,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    String duration =
        start != null ? getHoursAndMinutes(current.difference(start!)) : "";

    return Row(
      children: [
        Expanded(
          child: FittedBox(
            child: SizedBox(
              width: 480,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.timer_outlined),
                  ),
                  AnimatedOpacity(
                    opacity: start != null ? 1.0 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        start != null
                            ? DateFormat("hh:mm").format(start!)
                            : "--:--",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    child: SizedBox(
                      width: start != null ? null : 0.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          duration,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
