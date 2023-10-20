import 'package:crickety/providers/game_provider.dart';
import 'package:crickety/widgets/text_widgets.dart';
import 'package:crickety/widgets/tracker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  static const String route = '/game';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlexibleText("20"),
                  FlexibleText("19"),
                  FlexibleText("18"),
                  FlexibleText("17"),
                  FlexibleText("16"),
                  FlexibleText("15"),
                  FlexibleText("B"),
                ],
              ),
              Flexible(
                flex: 2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var i = 0;
                        i < context.read<GameProvider>().playerCount;
                        i++)
                      TrackerColumn(i)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
