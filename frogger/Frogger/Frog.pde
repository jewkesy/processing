class Frog extends Rectangle {

  Frog(float x, float y, float w) {
     super(x, y, w, w);
  }
  
  void show() {
    fill(255);
    rectMode(CORNERS);
    rect(left, top, right, bottom);
  }
  
  void move(float xdir, float ydir) {
    left += xdir * grid;
    top += ydir * grid;
  }

}
