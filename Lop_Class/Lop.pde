class Lop{
 PVector loc, vel, acc; 
 float sz;
 
 Lop(float tempX, float tempY){
   loc=new PVector(tempX, tempY);
   vel=new PVector(random(-5, -10), 0);
   acc=new PVector(0,0);
   sz=30;
 }
 
 void display(){
  ellipse(loc.x, loc.y, sz, sz); 
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
