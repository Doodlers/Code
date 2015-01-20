//BOOK CLASS

class Book {

  //DECLARING LOCATION, VELOCITY, ACCELERATION, SIZE, AND IMAGE
  PVector loc, vel, acc; 
  float sz;
  PImage bookImage;

  //INITIALIZING SIZE, LOCATION, VELOCITY, ACCELERATION, AND IMAGE
  Book(float tempX) {
    sz = 30;
    loc = new PVector(tempX, 269-sz);
    vel = new PVector(random(-3, -4), 0);
    acc = new PVector(-.01, 0);
    bookImage = loadImage("Books.png");
  }

  //DISPLAY BOOK
  void display() {
    image(bookImage, loc.x, loc.y, sz, sz);
  }
  
  //MOVE BOOK
  void move() {
    vel.add(acc);
    loc.add(vel);
  }

  //IF BOOK GOES OFF THE SCREEN, REMOVE FROM ARRAY LIST
  boolean off() {
    if (loc.x < -sz) {
      return true;
    } else {
      return false;
    }
  }
}

