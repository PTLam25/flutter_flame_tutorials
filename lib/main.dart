import 'package:flame/game.dart';
import 'package:flame_tutorial/games/game_2/game_two.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget(
      // game: GameOne(),
      game: GameTwo(),
    ),
  );
}
