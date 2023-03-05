import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_tracker/hero_divider.dart';
import 'package:time_tracker/nav_bar.dart';
import 'package:time_tracker/records_page.dart';
import 'package:time_tracker/session_info.dart';
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
  late DateTime current;

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
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Row(
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
                  ),
                ),
                const HeroDivider(),
                Expanded(
                    child: Column(
                  children: [
                    SessionInfo(
                      start: start,
                      current: current,
                    ),
                  ],
                )),
                NavBar(
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
                          "Mo": Duration(hours: 8),
                          "Tu": Duration(hours: 8, minutes: 30),
                          "We": Duration(hours: 7, minutes: 30),
                          "Th": Duration(hours: 6),
                          "Fr": Duration(hours: 6, minutes: 30),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
