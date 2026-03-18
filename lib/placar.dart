import 'package:flutter/material.dart';
import 'battleship.dart';

class Placar extends StatefulWidget {
  final Battleship game;

  const Placar({
    super.key,
    required this.game,
  });

  @override
  State<Placar> createState() => _PlacarState();
}

class _PlacarState extends State<Placar> {

  int playerScore = 0;
  int enemyScore = 0;


  @override
  void initState() {
    super.initState();

    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      if (!mounted) return false;

      setState(() {});
      return true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 552,
      bottom: 0,
      width: 100,
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nós: ${widget.game.enemyScore}",
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "Eles: ${widget.game.playerScore}",
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
