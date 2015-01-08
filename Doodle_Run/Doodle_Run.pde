int crouchdist=10;
int jumpdist=10;
int sz=20;
int start=60;
int disp=75;
int disp2=175;
int vely=0;
int accy=0;
int tfc;
void setup(){
  size(200,100);
}

void draw(){
  background(135);
  text("score:" + frameCount,10,20);
  line(0,80,width,80);
  ellipse(disp,65,10,10);
  ellipse(disp2,75,10,10);
  rect(30,start,10,sz);
  if(keyPressed){
    if(key==CODED){
      if(keyCode==SHIFT){
        start=70;
        sz=10;
//        tfc=frameCount;
//        tfc-=20;
//        if(frameCount-tfc>20){
//          start=60;
//          sz=20;
        }
        else{start=60;
          sz=20;}
      }
    }
//    if(key==' '){
//      vel=
//    }
  }

