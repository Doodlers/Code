class Tsquare {
  PVector loc, vel, acc; 
  float sz;
  PImage tsquareImage;

  Tsquare(float tempX) {
    sz=30;
    loc=new PVector(tempX, 540-sz-50);
    vel=new PVector(random(-5, -10), 0);
    acc=new PVector(-.001, 0);
    tsquareImage=loadImage("T-Square.png");
  }

  void display() {
    image(tsquareImage, loc.x, loc.y, sz, sz);
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
