class Car extends Rectangle {
  float speed;
  
  Car(float x, float y, float w, float h, float s) {
     super(x, y, w, h);
     speed = s;
  }
  
  void show() {
    fill(200);
    rect(x, y, w, h);
  }
  
  void update() {
    x = x + speed;
    
    if (speed > 0 && x > width+grid) {
      x = -w-grid;
    } else if (speed < 0 && x < -grid) {
      x = width+grid;
    }
  }

}
