import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color.fromARGB(255, 128, 128, 128);
const titleColor = Color.fromARGB(255, 144, 144, 144);
const textColor = Color.fromARGB(255, 96, 96, 96);
const secondaryColor = Color.fromARGB(255, 255, 0, 96);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: textColor, size: 32.0),
        textTheme: GoogleFonts.oswaldTextTheme(textTheme).copyWith(
          headlineLarge: GoogleFonts.oswald(
            textStyle: const TextStyle(
              fontSize: 10000,
              color: Colors.white,
            ),
          ),
          headlineMedium: GoogleFonts.oswald(
            textStyle: const TextStyle(
              fontSize: 40,
              color: titleColor,
            ),
          ),
          bodyLarge: GoogleFonts.oswald(
            textStyle: const TextStyle(
              fontSize: 18,
              color: primaryColor,
            ),
          ),
          bodyMedium: GoogleFonts.oswald(
            textStyle: const TextStyle(
              color: textColor,
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TimeRecord(),
                    TimeRecord(),
                    TimeRecord(),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(Icons.more_vert_outlined),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FloatingActionButton.extended(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        backgroundColor: Colors.transparent,
                        onPressed: null,
                        label: Text("Records"),
                        icon: Icon(Icons.edit_outlined),
                      ),
                    ),
                    FloatingActionButton.large(
                      backgroundColor: _running
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(150),
                      onPressed: _toggleRunning,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: _animation,
                      ),
                    ),
                    Expanded(
                      child: FloatingActionButton.extended(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        backgroundColor: Colors.transparent,
                        onPressed: null,
                        label: Text("Summary"),
                        icon: Icon(Icons.calendar_month_outlined),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.timer_outlined),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "10:00 - 11:30",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1h 30min",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "01.01.2023",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
