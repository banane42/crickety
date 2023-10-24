import 'package:crickety/providers/game_provider.dart';
import 'package:crickety/widgets/tracker_columns.dart';
import 'package:crickety/widgets/trackers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  static const String route = '/game';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: context.read<GameProvider>().playerCount,
          itemBuilder: (BuildContext context, int index) {
            // Every Odd column Choose the numbered one
            if (index % 2 == 0) {
              return TrackerColumn(index);
            } else {
              return NumberedTrackerColumn(index);
            }
          },
        ),
      ),
    );
  }
}
