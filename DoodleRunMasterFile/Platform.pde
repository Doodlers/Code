class Platform {
  PVector loc, vel, acc, sz;
  boolean off;

  Platform() {
    loc = new PVector(width*2, (height/2)-34);
    vel = new PVector(-5, 0);
    sz = new PVector(width, 10);
    acc = new PVector(0, 0);
  }

  void display() {
    noStroke();
    colorMode(HSB, 360, 100, 100, 100);
    fill(176, 85, 99);
    rect(loc.x, loc.y, sz.x, sz.y);
  }
  
  void move() {
    vel.add(acc);
    loc.add(vel);
  }
  
  boolean off() {
    if (loc.x < -sz.x) {
      return true;
    } else {
      return false;
    }
  }
}
