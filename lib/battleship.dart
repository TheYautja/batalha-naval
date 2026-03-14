import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/events.dart';

import 'cell.dart';

class Battleship extends FlameGame with TapCallbacks{

  double gridWidth = 16;
  double gridHeight = 16;

  late Sprite waterCenter;
  late Sprite waterBottom;

  List<List<Cell>> grid = [];


  Battleship(double gridWidth, double gridHeight){
    this.gridWidth = gridWidth;
    this.gridHeight = gridHeight;
  }


  @override
  Future<void> onLoad() async {
    await load_sprites();
    waterCenter = get_sheet_frag(0, 0, 32, 32);
    waterBottom = get_sheet_frag(0, 0, 32, 32);
    generate_grid(40.0, 0.0, 0.0);
    generate_grid(40.0, 200.0, 50.0);
  }


  Future<void> load_sprites() async {
    await Flame.images.load('water.png');
    await Flame.images.load('watertile.png');
  }


  Sprite get_sheet_frag(double x, double y, double width, double height){
    return Sprite(
      Flame.images.fromCache('watertile.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }


  void generate_grid(double cellsize, double startX, double startY){

    for(int i = 0; i < gridWidth; i++){
      List<Cell> row = [];
      for(int j = 0; j < gridHeight; j++){
        final cell = Cell(i, j, false, waterCenter);
        cell.position =Vector2(startX + i * cellsize, startY + j * cellsize);
        row.add(cell);
        add(cell);
      }
      grid.add(row);
    }
  }


}
