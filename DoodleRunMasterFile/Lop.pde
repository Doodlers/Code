class Lop {
  PVector loc, vel, acc; 
  float sz;
  PImage lopImage;

  Lop(float tempX) {
    sz=30;
    loc=new PVector(tempX, 540-sz);
    vel=new PVector(random(-5, -10), 0);
    acc=new PVector(-.001, 0);
    lopImage=loadImage("LOP.png");
  }

  void display() {
    image(lopImage, loc.x, loc.y, sz, sz);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
  }

  boolean off() {
    if (loc.x<-sz) {
      return true;
    } else {
      return false;
    }
  }
}

