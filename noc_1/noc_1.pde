// Declare Mover object.
ArrayList<Mover> movers = new ArrayList<Mover>();

void setup() {
  size(800,600);
  // Create Mover object.

  var count = 200;
  
  for (var i = 0; i < count; i++)
  {
    movers.add(new Mover());
  }
}

void draw() {
  background(255);

  //[full] Call functions on Mover object.
  for (Mover mover : movers) 
  {
    mover.update();
    mover.checkEdges();
    mover.display();
  }

  //[end]
}

class Mover {

  //[full] Our object has two PVectors: location and velocity.
  PVector location;
  PVector velocity;
  float r;
  float g;
  float b;
  
  float s;
  //[end]

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-8,8), random(-8,8));
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    s = random(1, 75);
  }

  void update() {
    // Motion 101: Location changes by velocity.
    location.add(velocity);
  }

  void display() {
    stroke(r, g, b);
    fill(r, g, b);
    ellipse(location.x,location.y,s,s);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
