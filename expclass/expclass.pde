int n=30;
float m=random(n);
ArrayList<Platforms> rects = new ArrayList<Platforms>();
void setup() {
  size(900, 600);
}

void draw() {
//  background(0);
//  if(n==m){
    rects.add(new Platforms());
//  }
  for (int i=rects.size ()-1; i>=0; i--) {
    Platforms r=rects.get(i);
    r.display();
    r.move();
    if(r.off()){
      rects.remove(i);
    }
  }
}

class Platforms {
  float loc, vel, sz;
  boolean off;
  
  Platforms() {
    loc=300;
    vel=5;
    sz=10;
  }
  
  void display() {
    rect(loc, 520, sz, sz);
  }
  void move() {
    loc+=vel;
  }
  boolean off() {
    if (loc>0) {
      return true;
    } else {
      return false;
    }
  }
}

