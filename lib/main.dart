import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'games/game_1/base_one.dart';

void main() {
  runApp(
    GameWidget(
      game: GameOne(),
    ),
  );
}
