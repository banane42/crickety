import 'package:crickety/providers/game_provider.dart';
import 'package:crickety/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ScoringAreas {
  twenty(20, "20"),
  ninteen(19, "19"),
  eighteen(18, "18"),
  seventeen(17, "17"),
  sixteen(16, "16"),
  fifteen(15, "15"),
  bull(25, " B");

  final int points;
  final String name;

  const ScoringAreas(this.points, this.name);
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
          scoreArea: widget.scoreArea);

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
    return AspectRatio(
      aspectRatio: 1,
      child: ElevatedButton(
        onPressed: _buttonPressed,
        child: Center(
          child: Text(
            _buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class NumberedTracker extends StatefulWidget {
  const NumberedTracker(this.position, this.scoreArea, {super.key});

  final int position;
  final ScoringAreas scoreArea;

  @override
  State<StatefulWidget> createState() => _NumberedTrackerState();
}

class _NumberedTrackerState extends State<NumberedTracker> {
  int _clicks = 0;
  String _buttonText = "";

  void _buttonPressed() {
    setState(() {
      _clicks++;

      context.read<GameProvider>().notifyPoints(
          clicks: _clicks,
          playerPosition: widget.position,
          scoreArea: widget.scoreArea);

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
    return RandColorContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            widget.scoreArea.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: ElevatedButton(
              onPressed: _buttonPressed,
              child: Center(
                child: Text(
                  _buttonText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
