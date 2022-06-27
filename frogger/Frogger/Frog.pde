class Frog extends Rectangle {

  Log attached;
  
  Frog(float x, float y, float w) {
     super(x, y, w, w);
  }
  
  void attach(Log log) {
    attached = log;
  }
  
  void show() {
    fill(255);
    rect(x, y, w, w);
  }
  
  void move(float xdir, float ydir) {
    float tmpx = x;
    float tmpy = y;
    tmpx += xdir * grid;
    tmpy += ydir * grid;
    if (tmpx < 0 || tmpx >= width) return;
    if (tmpy < 0 || tmpy >= height) return;
    
    x += xdir * grid;
    y += ydir * grid;
  }

}
