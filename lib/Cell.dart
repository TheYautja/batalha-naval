
class Cell {

  int? x;
  int? y;
  bool isShip = false;
  bool discovered = false;
  //add textura dps

  Cell(int x, int y, bool isShip){
    this.x = x;
    this.y = y;
    this.isShip = false;
  }

}
