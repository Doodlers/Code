int n = 50;
float m;
ArrayList<Platforms> rects = new ArrayList<Platforms>();
void setup() {
  size(900, 600);
//  noStroke();
}

void draw() {
  background(0);
  text(m, 10, 10);
  m = random(n);
  if (m>2&&m<3) {
    rects.add(new Platforms());
  }
  for (int i = rects.size ()-1; i >= 0; i--) {
    Platforms r = rects.get(i);
    r.display();
    r.move();
    if (r.off()) {
      rects.remove(i);
    }
  }
}

class Platforms {
  PVector loc, vel, acc, sz;
  boolean off;

  Platforms() {
    loc = new PVector(width, 300);
    vel = new PVector(-5, 0);
    sz = new PVector(20, 10);
    acc = new PVector(0, 0);
  }

  void display() {
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

