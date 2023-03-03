import 'package:flutter/material.dart';

class TimeRecord extends StatelessWidget {
  const TimeRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "10:00 - 11:30",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Opacity(
            opacity: 0.5,
            child: Text(
              "1 hour 30 minutes",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Icon(Icons.edit_outlined),
        ],
      ),
    );
  }
}
