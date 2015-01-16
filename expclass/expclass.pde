int n = 4;
float m;
ArrayList<Platforms> rects = new ArrayList<Platforms>();
void setup() {
  size(900, 600);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(150);
  fill(255);
  text(m, 10, 10);
  m = random(n);
  if (m>2&&m<3) {
    rects.add(new Platforms());
  }
  line(0, 540, width, 540);
  rect(25, 460, 40, 80);
  for (int i = rects.size ()-1; i >= 0; i--) {
    Platforms r = rects.get(i);
    r.display();
    r.move();
    if (r.off()) {
      rects.remove(i);
    }
    if (r.isThere()) {
      for (int j=0; j<rects.size ()-1; j++) {
        if (i!=j) {
          rects.remove(j);
        }
      }
    }
  }
}


class Platforms {
  PVector loc, vel, sz;
  boolean off, isThere;

  Platforms() {
    loc = new PVector(width, height/2);
    vel = new PVector(-5, 0);
    sz = new PVector(500, 25);
  }

  void display() {
    for (int i=0; i<sz.y; i++) {
      fill(230, 50, 100, 5);
      noStroke();
      rect(loc.x, loc.y, sz.x, sz.y-i);
      stroke(0);
    }
  }
  void move() {
    loc.add(vel);
  }
  boolean isThere() {
    if (loc.x > width-sz.x) {
      return true;
    } else {
      return false;
    }
  }
  boolean off() {
    if (loc.x < -sz.x) {
      return true;
    } else {
      return false;
    }
  }
}

