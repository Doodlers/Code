//DECLARING/ INITIALIZING VARIABLES AND ARRAY LISTS
ArrayList<Lop> lops=new ArrayList<Lop>();
int amount=0;
int personX = 50;
int personY = 410;
int personW=80;
int personH=130;
int jumpAmount=40;
int normalH= 130;
int crouchH=75;

void setup() {
  frameRate(40);
  size(900, 600);
  background(0);
}

void draw() {
  background(255);
  line(0, 540, width, 540);
  println(lops.size());

  if (amount<5) {
    lops.add(new Lop(random(width, width*2)));
  }
  amount++;

  for (int i=lops.size ()-1; i>=0; i--) {
    Lop l = lops.get(i);
    l.display();
    l.move();
    if (l.off()) {
      lops.remove(i);
      lops.add(new Lop(random(width, width*2)));
    }
  }

  rectMode(CORNER);
  rect(personX, personY, personW, personH);

personY = 410;
personH=normalH;
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        personY= 410-jumpAmount;
        personH=normalH;
      }

      else if (keyCode == DOWN) {
        personY=540-crouchH;
        personH=crouchH;
      }
    }
  }
}

