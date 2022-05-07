// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/JUDYkxU6J0o

PImage img;
PImage sortedBrightness;
PImage sortedHue;
PImage sortedSaturation;
int index = 0;

void setup() {
  size(800, 800);
  background(0);

  //img = loadImage("https://github.com/CodingTrain/website/blob/main/CodingChallenges/CC_047_PixelSorting/Processing/CC_047_PixelSortingAnimation/data/sunflower.jpg?raw=true");
  img = loadImage("/Users/daryl/Downloads/me_square_2020.jpg");
  //img = loadImage("https://www.howitworksdaily.com/wp-content/uploads/2010/10/sunset-288531_1280-200x200.jpg");

  sortedBrightness = createImage(img.width, img.height, RGB);
  sortedBrightness = img.get();

  sortedHue = createImage(img.width, img.height, RGB);
  sortedHue = img.get();
  
  sortedSaturation = createImage(img.width, img.height, RGB);
  sortedSaturation = img.get();
}

void draw() {

  if (index > img.pixels.length) noLoop();
  // println(frameRate);
  //println(index + " / " + img.pixels.length);
  sortedBrightness.loadPixels();
  sortedHue.loadPixels();
  sortedSaturation.loadPixels();

  // Selection sort!
  for (int n = 0; n < 20; n++) {
    float brightnessRecord = -1;
    int brightnessSelectedPixel = index;

    float hueRecord = -1;
    int hueSelectedPixel = index;
    
    float saturationRecord = -1;
    int saturationSelectedPixel = index;

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
      
      color saturationPix = sortedSaturation.pixels[j];
      float s = saturation(saturationPix);
      if (s > saturationRecord) {
        saturationSelectedPixel = j;
        saturationRecord = s;
      }
    }

    color tempBrightness = sortedBrightness.pixels[index];
    sortedBrightness.pixels[index] = sortedBrightness.pixels[brightnessSelectedPixel];
    sortedBrightness.pixels[brightnessSelectedPixel] = tempBrightness;

    color tempHue = sortedHue.pixels[index];
    sortedHue.pixels[index] = sortedHue.pixels[hueSelectedPixel];
    sortedHue.pixels[hueSelectedPixel] = tempHue;

    color tempSaturation = sortedSaturation.pixels[index];
    sortedSaturation.pixels[index] = sortedSaturation.pixels[saturationSelectedPixel];
    sortedSaturation.pixels[saturationSelectedPixel] = tempSaturation;

    if (index < img.pixels.length -1) index++;
  }

  sortedBrightness.updatePixels();
  sortedHue.updatePixels();
  sortedSaturation.updatePixels();

  image(img, 0, 0);
  image(sortedHue, 400, 0);
  image(sortedBrightness, 0, 400);
  image(sortedSaturation, 400, 400);
}
