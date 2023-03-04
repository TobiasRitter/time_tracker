import 'package:flutter/material.dart';
import 'package:time_tracker/nav_bar.dart';
import 'package:time_tracker/records_page.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(64.0),
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
                              width: 100,
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
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: Divider(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FittedBox(
                            child: SizedBox(
                              width: 480,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Icon(Icons.timer_outlined),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      "10:00",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      "1 hour 30 minutes",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
                iconLeft: Icons.calendar_month,
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
    );
  }
}
