class Book {
  PVector loc, vel, acc; 
  float sz;
  PImage bookImage;

  Book(float tempX) {
    sz=30;
    loc=new PVector(tempX, 269-sz);
    vel=new PVector(random(-3, -4), 0);
    acc=new PVector(-.001, 0);
    bookImage=loadImage("Books.png");
  }

  void display() {
    image(bookImage, loc.x, loc.y, sz, sz);
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

