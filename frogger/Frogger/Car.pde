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
    
    if (x > width+grid) {
      x = -w-grid;
    }
  }

}
