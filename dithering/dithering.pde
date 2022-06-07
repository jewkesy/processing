PImage me;
int factor = 1;
boolean showingGrey = false;

void setup() {
  size(800, 400);
  me = loadImage("/Users/daryl/Downloads/me_square_2020.jpg");
  //me.filter(GRAY);
  image(me, 0, 0);
}

int index(int x, int y) {
   return x + y * me.width; 
}

void draw() {
  me.loadPixels();
  //println(factor);
  for (int y = 0; y < me.height-1; y++) {
    for (int x = 1; x < me.width-1; x++) {
      color pix = me.pixels[index(x, y)];
      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);
      
      int newR = round(factor * oldR/255) * (255/factor);
      int newG = round(factor * oldG/255) * (255/factor);
      int newB = round(factor * oldB/255) * (255/factor);
      me.pixels[index(x,y)] = color(newR, newG, newB);
      
      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;
      
      int index = index(x+1, y);
      color c = me.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = r + errR * 7/16.0;
      g = g + errG * 7/16.0;
      b = b + errB * 7/16.0;
      
      me.pixels[index] = color(r, g, b);
      
      index = index(x-1, y+1);
      c = me.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 3/16.0;
      g = g + errG * 3/16.0;
      b = b + errB * 3/16.0;
      
      me.pixels[index] = color(r, g, b);
      
      index = index(x, y+1);
      c = me.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 5/16.0;
      g = g + errG * 5/16.0;
      b = b + errB * 5/16.0;
      
      me.pixels[index] = color(r, g, b);
      
      index = index(x+1, y+1);
      c = me.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR * 1/16.0;
      g = g + errG * 1/16.0;
      b = b + errB * 1/16.0;
      
      me.pixels[index] = color(r, g, b);
    }
  }
  
  me.updatePixels();
  image(me, 400, 0);
  //noLoop();
}

void keyPressed() {
  //println(key, keyCode);

  int keyIndex = -1;

  if (key == 32) {
    me = loadImage("/Users/daryl/Downloads/me_square_2020.jpg");
    if (showingGrey == true) showingGrey = false;
    else {
      showingGrey = true;
      me.filter(GRAY);
    }
  } else if (key > '0' && key <= '9') {
    keyIndex = key - 48;
    factor = keyIndex;
    me = loadImage("/Users/daryl/Downloads/me_square_2020.jpg");
    if (showingGrey == true) me.filter(GRAY);
  }
}
