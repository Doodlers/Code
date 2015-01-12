int imagesRunning;
int imagesShift;
PImage p1, p2, p3, p4, p5;
int px, py;
int shiftx, shifty;

void setup() {
  p1 = loadImage("person1.png");
  p2 = loadImage("person2.png");
  p3 = loadImage("person3.png");
  p4 = loadImage("person4.png");
  p5 = loadImage("Drop.png");
  imagesRunning = 1;
  px = 100;
  py = 380;
  shiftx = 100;
  shifty = 200;
  size(900, 600);
  frameRate (40);
}

void draw() {
  background(220);
  if (imagesRunning == 1) {
    image(p1, px, py);
  }
  if (imagesRunning == 2) {
    image(p2, px, py);
  }
  if (imagesRunning == 3) {
    image(p3, px, py);
  }
  if (imagesRunning == 4) {
    image(p4, px, py);
  }
  imagesRunning++;
  if (imagesRunning > 4) {
    imagesRunning = 1;
  }
  { 
    if (keyPressed) {
      if (key== CODED) {
        if (keyCode == DOWN) {
          image(p5, px, py);
          imagesRunning = 0;
        }
      }
    }
  }
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        if (imagesShift == 1) {
          image(p1, shiftx, shifty);
          imagesRunning = 0;
        }
        if (imagesShift == 2) {
          image(p2, shiftx, shifty);
          imagesRunning = 0;
        }
        if (imagesShift == 3) {
          image(p3, shiftx, shifty);
          imagesRunning = 0;
        }
        if (imagesShift == 4) {
          image(p4, shiftx, shifty);
          imagesRunning = 0;
        }
        imagesShift++;
        if (imagesShift > 4) {
          imagesShift = 1; 
          imagesRunning = 0;
        }
      }
    }
  }
}

