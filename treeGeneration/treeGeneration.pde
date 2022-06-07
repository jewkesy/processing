float angle = PI/4;

void setup() {
  size(400,400);
}

void draw() {
  background(51);
  stroke(255);
  translate(200, height);
  branch(100);
}

void branch(float len) {
  line(0,0,0, -len);
  translate(0, -len);
  
  if (len > 1) {
    push();
    rotate(angle);
    branch(len * 0.67);
    pop();
    push();
    rotate(-angle);
    branch(len * 0.67); 
    pop();
  }
}

void keyPressed() {
  if (keyCode == 37) {
    angle = angle-0.015;
  } else if (keyCode == 39) {
    angle = angle+0.015;
  }
}
