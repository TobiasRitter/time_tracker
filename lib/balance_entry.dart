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
          const SizedBox(width: 32.0),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Spacer(),
          Text(
            "1 hour 30 minutes",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
