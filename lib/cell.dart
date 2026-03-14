import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'dart:ui';

enum CellState {
  water,
  ship,
  hit,
  miss,
}

class Cell extends PositionComponent with TapCallbacks{

  final int cellX;
  final int cellY;
  bool isShip = false;
  bool discovered = false;
  final Sprite texture;


  static const double tilesize = 40.0;


  Cell(this.cellX, this.cellY, this.isShip, this.texture){
    position = Vector2(cellX * tilesize, cellY * tilesize);
    size = Vector2.all(tilesize);
  }


  @override
  void render(Canvas canvas){
    super.render(canvas);
    texture.render(canvas, size: size);
  }


  @override
  void onTapDown(TapDownEvent event){
    discovered = true;
  }


}
