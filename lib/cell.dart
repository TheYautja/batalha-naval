import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'dart:ui';

import 'placar.dart';
import 'battleship.dart';

enum CellState {
  water,
  ship,
  hit,
  miss,
  enemyHit,
}

class Cell extends SpriteGroupComponent<CellState> with TapCallbacks, HasGameRef<Battleship> {

  final int cellX;
  final int cellY;
  bool isShip = false;
  bool discovered = false;
  bool isEnemy = false;

  late Sprite startingSprite;
  late Sprite missSprite;
  late Sprite shipSprite;
  late Sprite hitSprite;
  late Sprite enemyHitSprite;

  static const double tilesize = 40.0;


  Cell(this.cellX, this.cellY, this.isShip, this.isEnemy){
    size = Vector2.all(tilesize);
  }


  void set_ship(){
    this.isShip = true;
  }


  Future<void> load_sprites() async {

    startingSprite = await gameRef.loadSprite("watertile.png");
    missSprite = await gameRef.loadSprite("miss.png");
    shipSprite = await gameRef.loadSprite("ship.png");
    hitSprite = await gameRef.loadSprite("hit.png");
    enemyHitSprite = await gameRef.loadSprite("enemyHit.png");

  }


  @override
  Future<void>? onLoad() async {

    await load_sprites();

    sprites = {
      CellState.water: startingSprite,
      CellState.miss: missSprite,
      CellState.ship: shipSprite,
      CellState.hit: hitSprite,
      CellState.enemyHit: enemyHitSprite
    };

    if(!isEnemy){
      if(isShip){
        current = CellState.ship;
      } else {
        current = CellState.water;
      }
    } else {
      current = CellState.water;
    }


  }


  @override
  void onTapDown(TapDownEvent event){

    if(discovered)return;

    if(!isShip){
      discovered = true;
      current = CellState.miss;
    } else if(isShip){
      if(isEnemy){
        gameRef.addEnemyPoint();
        discovered = true;
        current = CellState.hit;
      } else {
        gameRef.addPlayerPoint();
        discovered = true;
        current = CellState.enemyHit;
      }

    }

  }


}
