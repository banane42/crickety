import 'package:crickety/providers/game_provider.dart';
import 'package:crickety/widgets/trackers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrackerColumn extends StatelessWidget {
  const TrackerColumn(this.position, {super.key});

  final int position;

  @override
  Widget build(BuildContext context) {
    GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: true);

    return Column(
      children: <Widget>[
        SizedBox(
          width: 32,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Player ${position + 1}",
              border: InputBorder.none,
            ),
          ),
        ),
        for (var area in ScoringAreas.values)
          Expanded(child: Tracker(position, area)),
        Container(
            margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
            child: Text(gameProvider.playerPointsString(position)))
      ],
    );
  }
}

class NumberedTrackerColumn extends StatelessWidget {
  const NumberedTrackerColumn(this.position, {super.key});

  final int position;

  @override
  Widget build(BuildContext context) {
    GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: true);

    return Column(
      children: <Widget>[
        SizedBox(
          width: 32,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "NPlayer ${position + 1}",
              border: InputBorder.none,
            ),
          ),
        ),
        for (var area in ScoringAreas.values)
          Expanded(child: NumberedTracker(position, area)),
        Container(
            margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
            child: Text(gameProvider.playerPointsString(position)))
      ],
    );
  }
}
