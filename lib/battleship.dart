import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'dart:ui';

import 'cell.dart';

class Battleship extends FlameGame with TapCallbacks{

  //late final World world;

  int playerScore = 0;
  int enemyScore = 0;

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

  overlays.add('placar');

  //final worldWidth = tilesize * gridWidth * 2 + menuWidth;
  //final worldHeight = tilesize * gridHeight;

  //world = World();
  //add(world);

  //camera = CameraComponent.withFixedResolution(
    //world: world,
    //width: worldWidth,
    //height: worldHeight,
  //);

  //camera.viewfinder.anchor = Anchor.topLeft;
  //add(camera);

  //final scaleX = size.x / worldWidth;
  //final scaleY = size.y / worldHeight;
  //camera.viewfinder.zoom = scaleX < scaleY ? scaleX : scaleY;

  await load_sprites();



    generate_grid(grid, tilesize, 0, 0);
    generate_grid(enemyGrid, tilesize, 745, 0);

    place_ship(grid, 10, 4);
    place_ship(enemyGrid, 4, 4);
  }


  void addPlayerPoint() {
    playerScore++;
  }

  void addEnemyPoint() {
    enemyScore++;
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


  void place_ship(List<List<Cell>> target, int x, int y){
      target[x][y - 1].set_ship();
      target[x][y].set_ship();
      target[x][y + 1].set_ship();
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
