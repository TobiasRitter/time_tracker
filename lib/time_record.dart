import 'package:flutter/material.dart';

class TimeRecord extends StatelessWidget {
  const TimeRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "10:00 - 11:30",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Opacity(
              opacity: 0.5,
              child: Text(
                "1 hour 30 minutes",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.edit_outlined),
          ),
        ],
      ),
    );
  }
}
