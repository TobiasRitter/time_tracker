import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white24, size: 32.0),
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 10000,
              color: Colors.white,
            ),
            bodyLarge: const TextStyle(
              fontSize: 20,
              color: Colors.white54,
            ),
            bodyMedium: const TextStyle(
              color: Colors.white24,
            )),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(150, 64, 64, 64),
          secondary: const Color.fromARGB(255, 255, 0, 96),
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _running
                  ? Theme.of(context).colorScheme.secondary.withAlpha(150)
                  : Theme.of(context).colorScheme.primary,
              Colors.transparent
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: AutoSizeText(
                    '01:53',
                    style: Theme.of(context).textTheme.headlineLarge,
                    maxLines: 1,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(children: const [
                        TimeRecord(),
                        TimeRecord(),
                        TimeRecord(),
                      ]),
                    ),
                    Expanded(
                      child: FloatingActionButton.large(
                        backgroundColor: _running
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                        onPressed: _toggleRunning,
                        child: AnimatedIcon(
                          icon: AnimatedIcons.play_pause,
                          progress: _animation,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton.extended(
                          backgroundColor: Colors.transparent,
                          onPressed: null,
                          label: Text("Edit"),
                          icon: Icon(Icons.edit_outlined),
                        ),
                        FloatingActionButton.extended(
                          backgroundColor: Colors.transparent,
                          onPressed: null,
                          label: Text("Export"),
                          icon: Icon(Icons.import_export_outlined),
                        ),
                        FloatingActionButton.extended(
                          backgroundColor: Colors.transparent,
                          onPressed: null,
                          label: Text("Overview"),
                          icon: Icon(Icons.calendar_month_outlined),
                        ),
                      ],
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

class TimeRecord extends StatelessWidget {
  const TimeRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.timer_outlined,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "10:00 - 11:30",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "01.01.2023",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
