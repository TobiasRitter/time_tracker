import 'package:flutter/material.dart';

class TimeRecord extends StatelessWidget {
  const TimeRecord({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      "10:00 - 11:30",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(width: 32.0),
                    Text(
                      "1h 30min",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                    const Icon(Icons.edit_outlined),
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
