class Drop {
  float x = random(width+10);
  float y = random(-1500, -10);
  float z = random(0, 20);
  float len = map(z, 0, 20, 8, 30);
  float yspeed = map(z, 0, 20, 1, 20);
  
  void fall() {
    y = y + yspeed;
    float gravity = map(z, 0, 20, 0, 0.2);
    yspeed = yspeed + gravity;
    
    if (y > height) {
      y = random(-1500, -10);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }
  
  void show() {
    float thick = map(z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke(138, 43, 226);
    line(x, y, x, y+len);
  }
}
