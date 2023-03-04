import 'package:flutter/material.dart';
import 'package:time_tracker/calendar.dart';
import 'package:time_tracker/fading_list_view.dart';
import 'package:time_tracker/nav_bar.dart';
import 'package:time_tracker/time_record.dart';

class RecordsPage extends StatelessWidget {
  final bool running;

  const RecordsPage({super.key, required this.running});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              running
                  ? Theme.of(context).colorScheme.secondary.withAlpha(150)
                  : Theme.of(context).colorScheme.primary.withAlpha(75),
              Colors.transparent
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Calendar(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  ),
                  const Expanded(
                    child: FadingListView(
                      children: [
                        TimeRecord(),
                        TimeRecord(),
                        TimeRecord(),
                        TimeRecord(),
                        TimeRecord(),
                        TimeRecord(),
                      ],
                    ),
                  ),
                  NavBar(
                    running: running,
                    left: () => Navigator.pop(context),
                    middle: () {},
                    iconLeft: Icons.arrow_back,
                    iconMiddle: const Icon(Icons.add),
                    labelLeft: "Back",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
