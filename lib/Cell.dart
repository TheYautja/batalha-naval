import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'dart:ui';

class Cell extends PositionComponent {

  final int cellX;
  final int cellY;
  bool isShip = false;
  bool discovered = false;
  final Sprite texture;


  static const double tilesize = 32.0;


  Cell(this.cellX, this.cellY, this.isShip, this.texture){
    position = Vector2(cellX * tilesize, cellY * tilesize);
    size = Vector2.all(tilesize);
  }


  @override
  void render(Canvas canvas){
    super.render(canvas);
    texture.render(canvas, size: size);
  }


}
