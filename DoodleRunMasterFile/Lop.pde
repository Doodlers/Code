//LOP CLASS

class Lop {
  
  //DECLARING LOCATION, VELOCITY, ACCELERATION, SIZE, AND IMAGE
  PVector loc, vel, acc; 
  float sz;
  PImage lopImage;

  //INITIALIZING SIZE, LOCATION, VELOCITY, ACCELERATION, AND IMAGE
  Lop(float tempX) {
    sz = 30;
    loc = new PVector(tempX, 540-sz);
    vel = new PVector(random(-4, -5), 0);
    acc = new PVector(-.01, 0);
    lopImage = loadImage("LOP.png");
  }

  //DISPLAY LOP
  void display() {
    image(lopImage, loc.x, loc.y, sz, sz);
  }

  //MOVE LOP
  void move() {
    vel.add(acc);
    loc.add(vel);
  }

  //IF LOP GOES OFF THE SCREEN, REMOVE FROM ARRAY LIST
  boolean off() {
    if (loc.x<-sz) {
      return true;
    } else {
      return false;
    }
  }
}

