import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/events.dart';

import 'cell.dart';

class Battleship extends FlameGame with TapCallbacks{

  double gridWidth = 16;
  double gridHeight = 16;

  late Sprite waterCenter;

  List<List<Cell>> grid = [];
  List<List<Cell>> enemyGrid = [];


  Battleship(double gridWidth, double gridHeight){
    this.gridWidth = gridWidth;
    this.gridHeight = gridHeight;
  }


  @override
  Future<void> onLoad() async {
    await load_sprites();
    waterCenter = get_sheet_frag(0, 0, 32, 32, "watertile.png");
    generate_grid(grid, 40.0, 0, 0);
    generate_grid(enemyGrid, 40.0, 650, 0);
    place_ship(10, 4);
  }


  Future<void> load_sprites() async {
    await Flame.images.load('watertile.png');
    await Flame.images.load('ship.png');
    await Flame.images.load('miss.png');
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
        final cell = Cell(i, j, false, waterCenter);
        cell.position =Vector2(startX + i * cellsize, startY + j * cellsize);
        row.add(cell);
        add(cell);
      }
      target.add(row);
    }
  }


}







