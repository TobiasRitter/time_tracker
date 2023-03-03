import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_tracker/home_page.dart';

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
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white, size: 32.0),
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
              color: Colors.white,
            ),
          ),
          bodyLarge: GoogleFonts.oswald(
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          bodyMedium: GoogleFonts.oswald(
            textStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.grey,
          secondary: secondaryColor,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
