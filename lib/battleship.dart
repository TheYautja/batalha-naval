import 'package:flame/game.dart';
import 'Cell.dart';

class Battleship extends FlameGame {

  int gridWidth = 1;
  int gridHeight = 1;


  Battleship(int gridWidth, int gridHeight){
    this.gridWidth = gridWidth;
    this.gridHeight = gridHeight;
  }


  @override
  Future<void> onLoad() async {
    print("teeeeste batalhanaval");
  }


  void generate_grid(){
    List<List<Cell>> grid = [];
    for(int i = 0; i < gridWidth; i++){
      for(int j = 0; j < gridHeight; j++){
        grid[i][j] = Cell(i, j, false);
      }
    }
  }


}
