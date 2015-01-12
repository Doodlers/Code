ArrayList<Lop> lops=new ArrayList<Lop>();
int amount=0;

void setup() {
  frameRate(40);
  size(900, 600);
  background(0);
}

void draw() {
  background(0);
  
  println(lops.size());
  
  if (amount<5) {
    lops.add(new Lop(random(width, width*2), height/2));
  }
  amount++;
  
  for (int i=0; i<lops.size (); i++) {
    Lop l = lops.get(i);
    l.display();
    l.move();
    if (l.off()) {
      lops.remove(i);
      lops.add(new Lop(random(width, width*2), height/2));
    }
  }
}

