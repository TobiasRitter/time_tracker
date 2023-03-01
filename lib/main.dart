import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_tracker/home_page.dart';
import 'package:time_tracker/time_record.dart';

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
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.black,
        ),
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
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
