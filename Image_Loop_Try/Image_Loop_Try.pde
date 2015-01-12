int imagesRunning;

void setup() {
  imagesRunning=1;
  background(0);
  frameRate(1);
}


void draw() {
  println(frameCount);
  background(0);
  if (imagesRunning==4) {
    ellipse(40, 20, 20, 20);
    imagesRunning=1;
  }
  if (imagesRunning==3) {
    ellipse(30, 30, 20, 20);
    imagesRunning=4;
  }
  if (imagesRunning==2) {
    ellipse(20, 20, 20, 20);
    imagesRunning=3;
  }

  if (imagesRunning==1) {
    ellipse(10, 10, 10, 10);
    imagesRunning=2;
  }
}

