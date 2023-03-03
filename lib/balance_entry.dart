import 'package:flutter/material.dart';

class BalanceEntry extends StatelessWidget {
  final String title;
  final IconData icon;

  const BalanceEntry({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 32.0),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Spacer(),
          Opacity(
            opacity: 0.5,
            child: Text(
              "1 hour 30 minutes",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
