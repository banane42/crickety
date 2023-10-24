import 'package:crickety/widgets/trackers.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  int playerCount = 3;
  List<List<int>> gameState = [];
  List<int> playerPoints = [];

  GameProvider() {
    setPlayerCount(count: playerCount);
  }

  void setPlayerCount({required int count}) {
    playerCount = count;
    gameState = List.generate(
        playerCount, (index) => List.filled(ScoringAreas.values.length, 0));
    playerPoints = List.filled(playerCount, 0);

    notifyListeners();
  }

  void notifyPoints(
      {required int clicks,
      required int playerPosition,
      required ScoringAreas scoreArea}) {
    gameState[playerPosition][scoreArea.index] = clicks;

    if (clicks <= 3) return;

    var isClosed = true;

    for (var pIndex = 0; pIndex < playerCount; pIndex++) {
      if (gameState[pIndex][scoreArea.index] < 3) {
        isClosed = false;
        break;
      }
    }

    if (isClosed) return;

    playerPoints[playerPosition] += scoreArea.points;
    notifyListeners();
  }

  String playerPointsString(int position) {
    return playerPoints[position].toString();
  }
}
