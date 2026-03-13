import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'Cell.dart';

class Battleship extends FlameGame {

  int gridWidth = 16;
  int gridHeight = 16;

  List<List<Cell>> grid = [];

  Battleship(int gridWidth, int gridHeight){
    this.gridWidth = gridWidth;
    this.gridHeight = gridHeight;
  }


  @override
  Future<void> onLoad() async {
    await load_sprites();
    generate_grid();
  }


  Future<void> load_sprites() async {
    await Flame.images.load('water.png');
  }


  Sprite get_sheet_frag(double x, double y, double width, double height){
    return Sprite(
      Flame.images.fromCache('water.png'),
      srcPosition: Vector2(x, y),
      srcSize: Vector2(width, height),
    );
  }


  void generate_grid(){
    for(int i = 0; i < gridWidth; i++){
      List<Cell> row = [];
      for(int j = 0; j < gridHeight; j++){
        final cell = Cell(i, j, false, get_sheet_frag(70.0, 30.0, 32.0, 32.0));
        row.add(cell);
        add(cell);
      }
      grid.add(row);
    }
  }


}
