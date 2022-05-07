// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/JUDYkxU6J0o

PImage img;
PImage sortedBrightness;
PImage sortedHue;
int index = 0;

void setup() {
  size(1200, 400);
  background(0);
    
  //img = loadImage("https://github.com/CodingTrain/website/blob/main/CodingChallenges/CC_047_PixelSorting/Processing/CC_047_PixelSortingAnimation/data/sunflower400.jpg?raw=true");
  img = loadImage("/Users/daryl/Downloads/me_square_2020.jpg");
  
  sortedBrightness = createImage(img.width, img.height, RGB);
  sortedBrightness = img.get();
  
  sortedHue = createImage(img.width, img.height, RGB);
  sortedHue = img.get();
}

void draw() {
 // println(frameRate);
  //println(index + " / " + img.pixels.length);
  sortedBrightness.loadPixels();
  sortedHue.loadPixels();

  // Selection sort!
  for (int n = 0; n < 20; n++) {
    float brightnessRecord = -1;
    int brightnessSelectedPixel = index;
    
    float hueRecord = -1;
    int hueSelectedPixel = index;
    
    for (int j = index; j < img.pixels.length; j++) {
      color brightnessPix = sortedBrightness.pixels[j];
      float b = brightness(brightnessPix);
      if (b > brightnessRecord) {
        brightnessSelectedPixel = j;
        brightnessRecord = b;
      }
      
      color huePix = sortedHue.pixels[j];
      float h = hue(huePix);
      if (h > hueRecord) {
        hueSelectedPixel = j;
        hueRecord = h;
      }
    }

    color tempBrightness = sortedBrightness.pixels[index];
    sortedBrightness.pixels[index] = sortedBrightness.pixels[brightnessSelectedPixel];
    sortedBrightness.pixels[brightnessSelectedPixel] = tempBrightness;
    
    color tempHue = sortedHue.pixels[index];
    sortedHue.pixels[index] = sortedHue.pixels[hueSelectedPixel];
    sortedHue.pixels[hueSelectedPixel] = tempHue;

    if (index < img.pixels.length -1) index++;
  }

  sortedBrightness.updatePixels();
  sortedHue.updatePixels();

  image(sortedHue, 0, 0);
  image(img, 400, 0);
  image(sortedBrightness, 800, 0);
 
   
}
