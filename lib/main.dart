import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'battleship.dart';
import 'placar.dart';

void main() {
  runApp(
    GameWidget(
      game: Battleship(16, 16),
      overlayBuilderMap: {
        'placar': (context, game) {
          return Placar(game: game as Battleship);
        }
      }
    ),
  );
}

/*
Tamanho do tabuleiro: 16x16
2 times.
1 navio por time.
Placar.
Utilizar matrizes e Classe Ponto.
*/
