import 'package:flutter/material.dart';

class TimeRecord extends StatelessWidget {
  final bool editable;

  const TimeRecord({
    super.key,
    required this.editable,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.timer_outlined),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "10:00 - 11:30",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1 hour",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "30 minutes",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          editable
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.edit_outlined),
                )
              : Container(),
        ],
      ),
    );
  }
}
