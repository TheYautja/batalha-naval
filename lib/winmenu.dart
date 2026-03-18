import 'package:flutter/material.dart';
import 'battleship.dart';

class WinMenu extends StatelessWidget {
  final Battleship game;

  const WinMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    String winner =
        game.enemyScore >= game.totalShipParts ? "Você venceu!" : "Inimigo venceu!";

    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.black.withOpacity(0.8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              winner,
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
            const SizedBox(height: 20),

            Text(
              "Vitórias:\nVocê: ${game.playerWins}\nInimigo: ${game.enemyWins}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                game.resetGame();
              },
              child: const Text("Jogar novamente"),
            ),
          ],
        ),
      ),
    );
  }
}
