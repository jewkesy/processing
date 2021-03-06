class Obstacle extends Rectangle {
  float speed;
  
  Obstacle(float x, float y, float w, float h, float s) {
     super(x, y, w, h);
     speed = s;
  }
  
  void show() {
    fill(255);
    rect(x, y, w, h);
  }
  
  void update() {
    x = x + speed;
    
    if (speed > 0 && x > width+grid) {
      x = -w-grid;
    } else if (speed < 0 && x < -w-grid) {
      x = width+grid;
    }
  }

}
