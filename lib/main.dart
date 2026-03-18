import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'dart:io';
import 'package:window_size/window_size.dart';

import 'battleship.dart';
import 'placar.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    setWindowTitle('Battleship');

   // const size = Size(1000, 600);

   // setWindowMinSize(size);
    //setWindowMaxSize(size);
  }

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
