import 'package:crickety/providers/game_provider.dart';
import 'package:crickety/widgets/game_screen.dart';
import 'package:crickety/widgets/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';

void main() {
  usePathUrlStrategy();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GameProvider>(create: (_) => GameProvider())
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crickety",
      initialRoute: PlayerScreen.route,
      routes: {
        PlayerScreen.route: (context) => PlayerScreen(),
        GameScreen.route: (context) => GameScreen()
      },
    );
  }
}
