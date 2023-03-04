import 'package:flutter/material.dart';
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
  bool _running = false;

  void _toggleRunning() {
    setState(() {
      if (_running) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }

      _running = !_running;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation =
        CurvedAnimation(curve: Curves.linear, parent: _animationController);
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
              _running
                  ? Theme.of(context).colorScheme.secondary.withAlpha(150)
                  : Theme.of(context).colorScheme.primary.withAlpha(75),
              Colors.transparent
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FittedBox(
                              child: SizedBox(
                                width: 84,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "01:53",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: _running ? 1.0 : 0.0,
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Divider(),
                            ),
                            SessionInfo(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                NavBar(
                  running: _running,
                  left: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecordsPage(
                        running: _running,
                      ),
                    ),
                  ),
                  middle: _toggleRunning,
                  right: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatsPage(
                        running: _running,
                      ),
                    ),
                  ),
                  iconLeft: Icons.calendar_month_outlined,
                  iconMiddle: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: _animation,
                  ),
                  iconRight: Icons.bar_chart_outlined,
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
