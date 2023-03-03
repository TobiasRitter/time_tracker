import 'package:flutter/material.dart';

class TimeRecord extends StatelessWidget {
  const TimeRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Text(
            "10:00 - 11:30",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(width: 32.0),
          Opacity(
            opacity: 0.5,
            child: Text(
              "1 hour 30 minutes",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const Spacer(),
          Icon(Icons.edit_outlined),
        ],
      ),
    );
  }
}
