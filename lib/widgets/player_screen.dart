import 'package:crickety/providers/game_provider.dart';
import 'package:crickety/widgets/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Choose number of Players",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Flexible(
                    child: ListView(
                  children: [
                    for (var i = 1; i <= 12; i++)
                      Container(
                          margin: EdgeInsets.all(16),
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<GameProvider>()
                                  .setPlayerCount(count: i);
                              Navigator.of(context).pushNamed(GameScreen.route);
                            },
                            child: AspectRatio(
                                aspectRatio: 4,
                                child: Center(
                                  child: Text(i.toString(),
                                      textAlign: TextAlign.center),
                                )),
                          ))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
