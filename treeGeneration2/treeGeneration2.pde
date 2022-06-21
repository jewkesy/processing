ArrayList<Branch> tree = new ArrayList<Branch>();
ArrayList<PVector> leaves = new ArrayList<PVector>();
int count = 0;

void setup() {
  size(400, 400);
  var a = new PVector(width / 2, height);
  var b = new PVector(width / 2, height - 100);
  var root = new Branch(a, b);
  
  tree.add(root);
}

void sprout() {
  for (var i = tree.size() - 1; i >= 0; i--) {
    var b = tree.get(i);
    if (!b.finished) {
      tree.add(b.branch(1));
      tree.add(b.branch(-1));
    }
    b.finished = true;
  }
  
  count++;

  if (count >= 4 && leaves.size() < 512) {
    for (var i = 0; i < tree.size(); i++) {
      var b = tree.get(i);
      if (!b.finished && random(0,1) > 0.7) {
        var leaf = b.end.copy();
        leaves.add(leaf);
      }
    }
  }
}

void mousePressed() {
  sprout();
}

void keyPressed() {
  if (keyCode == 32) {
    sprout();
  }
}

void draw() {
  background(51);
  
  for (var i = 0; i < tree.size(); i++) {
    var b = tree.get(i);
    b.show();
    //b.jitter();
  }
  
  for (var i = leaves.size() - 1; i >=0; i--) {
    var l = leaves.get(i);
    fill(10, 255, 100, 100);
    noStroke();
    ellipse(l.x, l.y, 8, 8);
    l.y += random(0,1);
    if (l.y > height) {
      leaves.remove(i);
    }
  }
}


class Branch {
  PVector begin;
  PVector end;
  boolean finished = false;
  
  Branch(PVector begin, PVector end) {
    this.begin = begin;
    this.end = end;
  }
  
  void jitter() {
    this.end.x += random(-1, 1);
    this.end.y += random(-1, 1);
  }
  
  void show() {
    stroke(255);
    line(this.begin.x, this.begin.y, this.end.x, this.end.y);
  }
  
  Branch branch(float x) {
    PVector dir = new PVector(this.end.x - this.begin.x, this.end.y - this.begin.y);
    
    dir.rotate((PI*x) / random(2, 8));

    dir.mult(random(0.4, 0.9));
    PVector newEnd = new PVector(this.end.x + dir.x, this.end.y + dir.y);
    var b = new Branch(this.end, newEnd);
    return b;
  }
}
