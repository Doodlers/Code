int crouchdist=10;
int jumpdist=10;
int sz=20;
int start=60;
int disp=75;
int disp2=175;
int vely=0;
int accy=0;
int tfc;
int i=0;
boolean crouch=false;
void setup() {
  size(200, 100);
  frameRate(25);
}

void draw() {
  background(135);
  text("score:" + frameCount, 10, 20);
  line(0, 80, width, 80);
  ellipse(disp, 65, 10, 10);
  ellipse(disp2, 75, 10, 10);
  rect(30, start, 10, sz);
  if(crouch){
    i++;
    if(i==30){
      sz=20;
      start=60;
      crouch=true;
    }
  }
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==SHIFT||keyCode==DOWN) {
        start=70;
        sz=10;
        crouch=true;
      }
      if (keyCode==UP) {
        vely+=accy;
        start+=vely;
        vely=-1;
        accy=1;
        if (start==61) {
          vely=0;
          accy=0;
          start=60;
        }
      }
    }
  }
}

