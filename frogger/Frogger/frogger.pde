Frog frog;

float grid = 50;

void setup() {
  size(640, 480);
  frog = new Frog(100, 100, grid);
  
}

void draw() {
  background(0);
  frog.show();
}

void keyPressed() {
  if (keyCode == UP) {
    frog.move(0, -1);
  } else if (keyCode == DOWN) {
    frog.move(0, 1);
  } else if (keyCode == RIGHT) {
    frog.move(1, 0);
  } else if (keyCode == LEFT) {
    frog.move(-1, 0);
  }

}
