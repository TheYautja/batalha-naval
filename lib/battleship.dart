import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'dart:ui';

import 'cell.dart';

class Battleship extends FlameGame with TapCallbacks{

  double gridWidth = 16;
  double gridHeight = 16;

  double tilesize = 40.0;

  late double menuStart;
  late double menuWidth;

  List<List<Cell>> grid = [];
  List<List<Cell>> enemyGrid = [];


  Battleship(double gridWidth, double gridHeight){
    this.gridWidth = gridWidth;
    this.gridHeight = gridHeight;
  }


  @override
  Future<void> onLoad() async {

    menuStart = tilesize * gridWidth;
    menuWidth = menuStart / 3;

    camera.viewport = FixedResolutionViewport(
      resolution: Vector2(menuStart * 2 + menuWidth, tilesize * gridHeight),
    );

    await load_sprites();

    add(RectangleComponent(
      position: Vector2(menuStart, 0),
      size: Vector2(menuWidth, tilesize * gridHeight),
      paint: Paint()..color = const Color(0x88000000),
    ));

    generate_grid(grid, tilesize, 0, 0);
    generate_grid(enemyGrid, tilesize, menuStart + menuWidth, 0);
    place_ship(10, 4);
  }


  Future<void> load_sprites() async {
    await Flame.images.load('watertile.png');
    await Flame.images.load('ship.png');
    await Flame.images.load('miss.png');
    await Flame.images.load('hit.png');
  }


  Sprite get_sheet_frag(double x, double y, double width, double height, String file){
    return Sprite(
      Flame.images.fromCache(file),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }


  void place_ship(int x, int y){
      grid[x][y - 1].set_ship();
      grid[x][y].set_ship();
      grid[x][y + 1].set_ship();
  }


  void generate_grid(List<List<Cell>> target, double cellsize, double startX, double startY){

    for(int i = 0; i < gridWidth; i++){
      List<Cell> row = [];
      for(int j = 0; j < gridHeight; j++){
        bool enemy = (target == enemyGrid) ? true : false;
        final cell = Cell(i, j, false, enemy);
        cell.position =Vector2(startX + i * cellsize, startY + j * cellsize);
        row.add(cell);
        add(cell);
      }
      target.add(row);
    }
  }


}







