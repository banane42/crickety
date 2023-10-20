import 'package:crickety/providers/game_provider.dart';
import 'package:crickety/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ScoringAreas {
  twenty(points: 20),
  ninteen(points: 19),
  eighteen(points: 18),
  seventeen(points: 17),
  sixteen(points: 16),
  fifteen(points: 15),
  bull(points: 25);

  final int points;

  const ScoringAreas({required this.points});
}

class Tracker extends StatefulWidget {
  const Tracker(this.position, this.scoreArea, {super.key});

  final int position;
  final ScoringAreas scoreArea;

  @override
  State<StatefulWidget> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  int _clicks = 0;
  String _buttonText = "";

  void _buttonPressed() {
    setState(() {
      _clicks++;

      context.read<GameProvider>().notifyPoints(
          clicks: _clicks,
          playerPosition: widget.position,
          scoreArea: widget.scoreArea,
      );

      if (_clicks == 1) {
        _buttonText = "/";
      } else if (_clicks == 2) {
        _buttonText = "X";
      } else if (_clicks >= 3) {
        _buttonText = "@";
        _clicks = 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
        onPressed: _buttonPressed,
        child: AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: Text(
              _buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class TrackerColumn extends StatelessWidget {
  const TrackerColumn(this.position, {super.key});

  final int position;

  @override
  Widget build(BuildContext context) {
    GameProvider gameProvider = Provider.of<GameProvider>(context, listen: true);

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const FlexibleText("Name"),
          ),
          Tracker(position, ScoringAreas.twenty),
          const SizedBox(height: 12),
          Tracker(position, ScoringAreas.ninteen),
          const SizedBox(height: 12),
          Tracker(position, ScoringAreas.eighteen),
          const SizedBox(height: 12),
          Tracker(position, ScoringAreas.seventeen),
          const SizedBox(height: 12),
          Tracker(position, ScoringAreas.sixteen),
          const SizedBox(height: 12),
          Tracker(position, ScoringAreas.fifteen),
          const SizedBox(height: 12),
          Tracker(position, ScoringAreas.bull),
          Container(
              margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
              child: Text(
                  gameProvider.playerPointsString(position),
              ),
          ),
        ],
      ),
    );
  }
}
