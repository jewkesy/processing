Drop[] drops = new Drop[1500];

void setup() {
  size(800, 600);
  //fullScreen();
  
  for (var i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(230, 230, 250);
  for (var i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
}
