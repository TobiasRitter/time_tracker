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
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 200,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
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
      body: Center(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.large(
                    onPressed: _toggleRunning,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _animation,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
