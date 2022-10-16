void keyPressed() {
  if (key == ' ') {
    move.start();
  }
}

void applyMove(char move) {
  switch (move) {
    case 'f':
      turnZ(1, 1);
      break;
    case 'F':
      turnZ(1, -1);
      break;
    case 'b':
      turnY(-1, 1);
      break;
    case 'B':
      turnY(-1, -1);
      break; 
    case 'u':
      turnX(1, 1);
      break;
    case 'U':
      turnX(1, -1);
      break;
    case 'd':
      turnX(-1, 1);
      break;
    case 'D':
      turnX(-1, -1);
      break;
    case 'l':
      turnX(-1, 1);
      break;
    case 'L':
      turnX(-1, -1);
      break;
    case 'r':
      turnX(1, 1);
      break;
    case 'R':
      turnX(1, -1);
      break;
  }
}
