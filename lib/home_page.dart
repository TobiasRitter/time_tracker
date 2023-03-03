import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/records_page.dart';
import 'package:time_tracker/stats_page.dart';
import 'package:time_tracker/time_record.dart';

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
                  : Theme.of(context).colorScheme.primary.withAlpha(100),
              Colors.transparent
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                  child: AutoSizeText(
                    '01:53',
                    style: Theme.of(context).textTheme.headlineLarge,
                    maxLines: 1,
                  ),
                ),
              ),
              Expanded(
                child: ListView(children: const [
                  TimeRecord(editable: false),
                  TimeRecord(editable: false),
                  TimeRecord(editable: false),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: FloatingActionButton.extended(
                          heroTag: "records",
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          backgroundColor: Colors.transparent,
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecordsPage(
                                        running: _running,
                                      ))),
                          label: const Text("Records"),
                          icon: const Icon(Icons.calendar_month_outlined),
                        ),
                      ),
                    ),
                    FloatingActionButton.large(
                      heroTag: "main",
                      backgroundColor: _running
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primary,
                      onPressed: _toggleRunning,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: _animation,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: FloatingActionButton.extended(
                          heroTag: "stats",
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          backgroundColor: Colors.transparent,
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StatsPage(
                                        running: _running,
                                      ))),
                          label: const Text("Stats"),
                          icon: const Icon(Icons.bar_chart_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
