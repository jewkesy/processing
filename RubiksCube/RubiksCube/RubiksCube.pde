import peasy.*;

PeasyCam cam;
float speed = 0.2;
int dim = 3;
float MOVES = 10;
Box[] cube = new Box [dim*dim*dim]; 
Move[] allMoves = new Move[] {
  new Move(0, 1, 0, 1),
  new Move(0, 1, 0, -1),
  new Move(0, -1, 0, 1),
  new Move(0, -1, 0, -1),
  new Move(1, 0, 0, 1),
  new Move(1, 0, 0, -1),
  new Move(-1, 0, 0, 1),
  new Move(-1, 0, 0, -1),
  new Move(0, 0, 1, 1),
  new Move(0, 0, 1, -1),
  new Move(0, 0, -1, 1),
  new Move(0, 0, -1, -1)
};

ArrayList<Move> sequence = new ArrayList<Move>();
int counter = 0;
boolean started = false;

Move currentMove;

void setup() {
  size(600, 600, P3D);
  //fullScreen(P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Box(matrix, x, y, z); 
        index++;
      }
    }
  }
  
  for (int i = 0; i < MOVES; i++) {
    int r = int(random(allMoves.length));
    Move m = allMoves[r];
    sequence.add(m);
  }
  
  currentMove = sequence.get(counter);
  
  for (int i = sequence.size()-1; i >= 0; i-- ){
    Move nextMove = sequence.get(i).copy();
    nextMove.reverse();
    sequence.add(nextMove);
  }
}

void turnX(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Box qb = cube[i];
    if (qb.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.y, qb.z);
      qb.update(qb.x, round(matrix.m02), round(matrix.m12));
      qb.turnFacesX(dir);
    }
  }
}

void turnY(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Box qb = cube[i];
    if (qb.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.z);
      qb.update(round(matrix.m02), qb.y, round(matrix.m12));
      qb.turnFacesY(dir);
    }
  }
}

void turnZ(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Box qb = cube[i];
    if (qb.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.y);
      qb.update(round(matrix.m02), round(matrix.m12), qb.z);
      qb.turnFacesZ(dir);
    }
  } 
}

void draw () {
  background(51);
  
  fill(255);
  textSize(32); 
  text(counter, 100, 100);
  
  rotateX(-0.5);
  rotateY(0.4);
  rotateZ(0.1);

  currentMove.update();
  if (currentMove.finished()) {
    if (counter < sequence.size()-1) {
      counter++;
      currentMove = sequence.get(counter);
      currentMove.start();
    }
  }

  scale(50);
  for (int i = 0; i < cube.length; i++) {
    push();
    if (abs(cube[i].z) > 0 && cube[i].z == currentMove.z) {
      rotateZ(currentMove.angle);
    } else if (abs(cube[i].x) > 0 && cube[i].x == currentMove.x) {
      rotateX(currentMove.angle);
    } else if (abs (cube[i].y) > 0 && cube[i].y == currentMove.y) {
      rotateY(-currentMove.angle);
    }
    cube[i].show();
    pop();
  }
}
