import 'package:flutter/material.dart';
import 'package:time_tracker/hero_divider.dart';
import 'package:time_tracker/nav_bar.dart';

class Skeleton extends StatelessWidget {
  final Widget upper;
  final Widget lower;
  final NavBar navBar;

  const Skeleton({
    super.key,
    required this.navBar,
    required this.upper,
    required this.lower,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: upper,
        ),
        const HeroDivider(),
        Expanded(
          child: lower,
        ),
        navBar
      ],
    );
  }
}
