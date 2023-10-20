import 'package:crickety/providers/game_provider.dart';
import 'package:crickety/widgets/game_screen.dart';
import 'package:crickety/widgets/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<GameProvider>(create: (_) => GameProvider())],
      child: MaterialApp(
        title: "Crickety",
        initialRoute: PlayerScreen.route,
        routes: {
          PlayerScreen.route: (context) => PlayerScreen(),
          GameScreen.route: (context) => GameScreen()
        },
      ),
    );
  }
}
