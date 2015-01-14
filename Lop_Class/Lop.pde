class Lop{
 PVector loc, vel, acc; 
 float sz;
 
 Lop(float tempX){
   loc=new PVector(tempX, 525);
   vel=new PVector(random(-5, -10), 0);
   acc=new PVector(0,0);
   sz=30;
 }
 
 void display(){
  rectMode(CENTER);
  rect(loc.x, loc.y, sz, sz); 
  //needs to become an image later!!!!!!!!!!!!!
 }
 
 void move(){
   vel.add(acc);
   loc.add(vel);
 }
 
 boolean off(){
  if(loc.x<-sz){
   return true;
  } else {
   return false; 
  }
 }
}
