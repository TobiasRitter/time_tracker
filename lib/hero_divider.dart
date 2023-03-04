import 'package:flutter/material.dart';

class HeroDivider extends StatelessWidget {
  const HeroDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Hero(
      tag: "divider",
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Divider(),
      ),
    );
  }
}
