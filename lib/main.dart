import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'battleship.dart';

void main() {
  runApp(
    GameWidget(
      game: Battleship(16, 16),
    ),
  );
}
