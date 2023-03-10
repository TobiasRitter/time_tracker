import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_tracker/nav_bar.dart';
import 'package:time_tracker/records_page.dart';
import 'package:time_tracker/session_info.dart';
import 'package:time_tracker/skeleton.dart';
import 'package:time_tracker/stats_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  DateTime? start;
  DateTime current = DateTime.now();

  void _toggleRunning() => setState(
        () {
          if (start != null) {
            _animationController.reverse();
            start = null;
          } else {
            _animationController.forward();
            start = DateTime.now();
          }
        },
      );

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation =
        CurvedAnimation(curve: Curves.linear, parent: _animationController);
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => setState(() => current = DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var navBar = NavBar(
      running: start != null,
      left: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecordsPage(
            running: start != null,
          ),
        ),
      ),
      middle: _toggleRunning,
      right: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StatsPage(
            running: start != null,
            workingHours: const {
              "Mo": Duration(hours: 9),
              "Tu": Duration(hours: 9, minutes: 30),
              "We": Duration(hours: 8, minutes: 30),
              "Th": Duration(hours: 7),
              "Fr": Duration(hours: 7, minutes: 30),
            },
          ),
        ),
      ),
      iconLeft: Icons.calendar_month,
      iconMiddle: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: _animation,
      ),
      iconRight: Icons.bar_chart,
      labelLeft: "Records",
      labelRight: "Stats",
    );
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              start != null
                  ? Theme.of(context).colorScheme.secondary.withAlpha(150)
                  : Theme.of(context).colorScheme.primary.withAlpha(75),
              Colors.transparent,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Skeleton(
              upper: const TotalTime(),
              lower: SessionInfo(
                current: current,
                start: start,
              ),
              navBar: navBar,
            ),
          ),
        ),
      ),
    );
  }
}

class TotalTime extends StatelessWidget {
  const TotalTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: FittedBox(
            child: SizedBox(
              width: 84,
              child: Text(
                "01:53",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
