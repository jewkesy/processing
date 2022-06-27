Frog frog;
Car[] cars;
Log[] logs;

float grid = 50;

void resetGame() {
  frog = new Frog(width / 2-grid / 2, height-grid*5, grid);
}

void setup() {
  size(550, 500);
  resetGame();
  
  cars = new Car[10];

  int index = 0;
  
  // Row 1
  for (int i = 0; i < 2; i++) {
    float x = i * 300;
    cars[index] = new Car(x, height-grid*2, grid*2, grid, 2);
    index++;
  } 
  
  // Row 2
  for (int i = 0; i < 2; i++) {
    float x = i * 200 + 150;
    cars[index] = new Car(x, height-grid*3, grid, grid, -3.5);
    index++;
  } 
  
  // Row 3
  for (int i = 0; i < 4; i++) {
    float x = i * 200 + 25;
    cars[index] = new Car(x, height-grid*4, grid, grid, 1.2);
    index++;
  } 
  
  logs = new Log[2];
  
  // Row 5
  index = 0;
  for (int i = 0; i < 2; i++) {
    float x = i * 200 + 100;
    logs[index] = new Log(x, height-grid*6, grid*3, grid, 2.3);
    index++;
  } 
}

void draw() {
  background(0);
  fill(255, 100);
  rect(0, height-grid, width, grid);
  rect(0, height-grid*5, width, grid);

  for (Car car : cars) { 
    if (car != null) {
      car.show();
      car.update();
      if (frog.intersects(car)) {
        println("Game Over");
        resetGame();
      }
    }
  }
  
  for (Log log : logs) { 
    if (log != null) {
      log.show();
      log.update();
    }
  }
  
  if (frog.y < height-grid*5) {
    boolean ok = false;
    for (Log log : logs) { 
      if (log != null) {
        if (frog.intersects(log)) {
          ok = true;
        }
      }
    }
    if (!ok) {
      resetGame();
    }
  }
   


    
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
