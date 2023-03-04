import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_tracker/home_page.dart';

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
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white, size: 32.0),
        textTheme: GoogleFonts.oswaldTextTheme(textTheme).copyWith(
          headlineMedium: GoogleFonts.oswald(
            textStyle: const TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          headlineSmall: GoogleFonts.oswald(
            textStyle: TextStyle(
              fontSize: 40,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          bodyLarge: GoogleFonts.oswald(
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          bodyMedium: GoogleFonts.oswald(
            textStyle: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          secondary: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
