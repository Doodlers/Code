//TSQUARE CLASS

class Tsquare {

  //DECLARING LOCATION, VELOCITY, ACCELERATION, SIZE, AND IMAGE
  PVector loc, vel, acc; 
  float sz;
  PImage tsquareImage;

  //INITIALIZING SIZE, LOCATION, VELOCITY, ACCELERATION, AND IMAGE
  Tsquare(float tempX) {
    sz = 30;
    loc = new PVector(tempX, 540-sz-50);
    vel = new PVector(random(-4, -5), 0);
    acc = new PVector(-.01, 0);
    tsquareImage = loadImage("T-Square.png");
  }

  //DISPLAY TSQUARE
  void display() {
    image(tsquareImage, loc.x, loc.y, sz, sz);
  }

  //MOVE TSQUARE
  void move() {
    vel.add(acc);
    loc.add(vel);
  }

  //IF TSQUARE GOES OFF THE SCREEN, REMOVE FROM ARRAY LIST
  boolean off() {
    if (loc.x<-sz) {
      return true;
    } else {
      return false;
    }
  }
}

