class Frog extends Rectangle {

  Obstacle attached = null;
  
  Frog(float x, float y, float w) {
     super(x, y, w, w);
  }
  
  void attach(Obstacle log) {
    attached = log;
  }
  
  void update() {
    if (attached != null) {
      frog.x += attached.speed;
    }
    
    frog.x = constrain(x, 0, width-frog.w);
    frog.y = constrain(y, 0, height-frog.h);
  }
  
  void show() {
    fill(36, 143, 36, 200);
    rect(x, y, w, w);
  }
  
  void move(float xdir, float ydir) {
    x += xdir * grid;
    y += ydir * grid;
    frog.attach(null);
  }
}
