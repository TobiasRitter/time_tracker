import 'package:flutter/material.dart';
import 'package:time_tracker/calendar.dart';
import 'package:time_tracker/fading_list_view.dart';
import 'package:time_tracker/nav_bar.dart';
import 'package:time_tracker/skeleton.dart';
import 'package:time_tracker/time_record.dart';

class RecordsPage extends StatelessWidget {
  final bool running;

  const RecordsPage({super.key, required this.running});

  @override
  Widget build(BuildContext context) {
    var navBar = NavBar(
      running: running,
      left: () => Navigator.pop(context),
      middle: () {},
      iconLeft: Icons.arrow_back,
      iconMiddle: const Icon(Icons.add),
      labelLeft: "Back",
      iconRight: Icons.import_export,
      labelRight: "Sync",
      right: () {},
    );
    var fadingListView = FadingListView(
      children: [
        TimeRecord(
          start: DateTime(2023, 1, 1, 10, 0),
          stop: DateTime(2023, 1, 1, 11, 30),
        ),
        TimeRecord(
          start: DateTime(2023, 1, 1, 12, 0),
          stop: DateTime(2023, 1, 1, 14, 30),
        ),
        TimeRecord(
          start: DateTime(2023, 1, 1, 15, 0),
          stop: DateTime(2023, 1, 1, 15, 30),
        ),
        TimeRecord(
          start: DateTime(2023, 1, 1, 16, 0),
          stop: DateTime(2023, 1, 1, 16, 45),
        ),
      ],
    );
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
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Skeleton(
              upper: const Calendar(),
              lower: fadingListView,
              navBar: navBar,
            ),
          ),
        ),
      ),
    );
  }
}
