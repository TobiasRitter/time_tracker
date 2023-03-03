import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_tracker/time_record.dart';

class StatsPage extends StatelessWidget {
  final bool running;

  const StatsPage({super.key, required this.running});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                running
                    ? Theme.of(context).colorScheme.secondary.withAlpha(150)
                    : Theme.of(context).colorScheme.primary.withAlpha(100),
                Colors.transparent
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text("Column Chart"),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [Text("Overtime:")],
                    )
                  ],
                ),
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
                          onPressed: () => Navigator.pop(context),
                          label: const Text("Back"),
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    FloatingActionButton.large(
                      heroTag: "main",
                      backgroundColor: running
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primary,
                      onPressed: () {},
                      child: const Icon(Icons.file_download),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
