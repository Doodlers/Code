int sz=20;
int y=60;
int disp=75;
int disp2=175;
int vel=0;
int acc=0;
int tfc;
int delay=0;
boolean crouch=false;
boolean jump=false;
void setup() {
  size(200, 100);
  frameRate(20);
}

void draw() {
  background(135);
  text("score:" + frameCount, 10, 20);
  line(0, 80, width, 80);
  rect(30, y, 10, sz);
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==DOWN) {
        crouch=true;
      }
      if (keyCode==UP) {
        jump=true;
      }
    }
  }
  if (crouch) {
    sz=10;
    y=70;
    delay++;
    if (delay>25) {
      crouch=false;
      delay=0;
    }
  }
  if (jump) {
    vel+=acc;
    y+=vel;
    vel=-500;
    acc=1;
    if (y<60) {
      vel=0;
      acc=0;
      y=60;
      jump=false;
    }
  }
  if (crouch==false||jump==false) {
    y=60;
    sz=20;
  }
}

