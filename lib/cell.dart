import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'dart:ui';

import 'battleship.dart';

enum CellState {
  water,
  ship,
  hit,
  miss,
}

class Cell extends SpriteGroupComponent<CellState> with TapCallbacks, HasGameRef<Battleship>{

  final int cellX;
  final int cellY;
  bool isShip = false;
  bool discovered = false;
  Sprite texture;


  static const double tilesize = 40.0;


  Cell(this.cellX, this.cellY, this.isShip, this.texture){
    position = Vector2(cellX * tilesize, cellY * tilesize);
    size = Vector2.all(tilesize);
  }


  void set_texture(Sprite newTexture){
    this.texture = newTexture;
  }


  void set_ship(){
    this.isShip = true;
  }


  void set_discovered(){
    this.discovered = true;
  }


  @override
  Future<void>? onLoad() async {

    final startingSprite = await gameRef.loadSprite("watertile.png");
    final missSprite = await gameRef.loadSprite("miss.png");
    final shipSprite = await gameRef.loadSprite("ship.png");
    final hitSprite = await gameRef.loadSprite("hit.png");

    sprites = {
      CellState.water: startingSprite,
      CellState.miss: missSprite,
      CellState.ship: shipSprite,
      CellState.hit: hitSprite
    };

    current = CellState.water;

  }


  @override
  void onTapDown(TapDownEvent event){
    discovered = true;
  }


}
