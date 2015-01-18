//DECLARING/ INITIALIZING VARIABLES AND ARRAY LISTS
//ARRAY LIST OF OBJECTS
ArrayList<Lop> lops=new ArrayList<Lop>();
ArrayList<Tsquare> tsquares=new ArrayList<Tsquare>();


//AMOUNT TO ADD TO ARRAY LIST
int amount=0;
//RANDOM NUMBER GENERATOR FOR ADDING NEW THINGS TO ARRAY LIST 
int addObject=0;
float num;
//float rand;
//int countSinceLastLop=0;
//int countSinceLastTsquare=0;

//RECTANGLE FOR PERSON
int personX = 50;
int personY = 460;
int personW=40;
int personH=80;

//VALUES FOR HOW THE PERSON JUMPS/ CROUCHES
int velY;
float accY;
int jumpAmount=40;
int normalH= 80;
int crouchH=40;

//HOW THE PERSON IS DELAYED WHEN HE JUMPS AND CROUCHES
int delay=20;
int timeLeftUntilFall;
int originalDelay=20;
int platformDelay;

//MAKING THE GAME START AND END
int run=1;

void setup() {
  frameRate(40);
  size(900, 600);
  //  lops.add(new Lop(random(width, width*2)));
}

void draw() {
  if (run==1) {
    background(255);

    //MAKING THE GROUND
    line(0, 540, width, 540);

    //STAND IN FOR THE PLATFORMS
    line(0, height/2, width, height/2);

    //DRAWING THE RECTANGLE TO INTERACT WITH THE OBJECTS
    rectMode(CORNER);
    rect(personX, personY, personW, personH);

    //MAKING THE PERSON'S LOCATION CHANGE BY THE VELOCITY


    //MAKING THE RECTANGLE JUMP OR CROUCH FOR A CERTAIN AMOUNT OF TIME
    if (keyPressed) {
      delay=0;
      if (key == CODED) {
        //UP ARROW MAKES HIM JUMP
        if (keyCode == UP) {
          personY= 460-jumpAmount;
          personH=normalH;
          //DOWN ARROW MAKES HIM CROUCH
        } else if (keyCode == DOWN) {
          personY=540-crouchH;
          personH=crouchH;
        }
        if (delay==originalDelay) {
          personY = 460;
          personH=normalH;
        }
        //SPACE SENDS HIM TO A PLATFORM
      } else if (key==' ') {
        if (personY>height/2-personH) {
          velY=-6;
          personY+=velY;
        } else if (personY==height/2-personH) {
          velY=0;
          accY=0;
          platformDelay=50;
          //          if (delay==platformDelay) {
          //            if (personY<540-personH) {
          //              velY=1;
          //              accY=.1;
          //            } else {
          //            }
          //          }
        }
      }
    }

    println(delay);
    delay++;
    timeLeftUntilFall= originalDelay-delay;

    //ADDING NEW OBJECTS TO THE ARRAY LIST FIX THIS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    num=random(1);
    if (addObject==50) {
      if (num<.5) {
        lops.add(new Lop(random(width, width*2)));
        addObject=0;
      } else if (num>.5) {
        tsquares.add(new Tsquare(random(width, width*2)));
        addObject=0;
      }
    }
    addObject++;

    //USING METHODS FOR THE LOP CLASS
    for (int i=lops.size ()-1; i>=0; i--) {
      Lop l = lops.get(i);
      l.move();
      l.display();

      if (l.off()) {
        lops.remove(i);
      }

      //CHECKING IF THE RECTANGLE TOUCHES THE LOP OBJECTS
      if (l.loc.x<personX+personW && l.loc.x+l.sz>personX && l.loc.y+l.sz>personY && l.loc.y<personY+personH) {
        run=0;
      }
    }


    //USING METHODS FOR THE TSQUARE CLASS
    for (int i=tsquares.size ()-1; i>=0; i--) {
      Tsquare t = tsquares.get(i);
      t.move();
      t.display();

      if (t.off()) {
        tsquares.remove(i);
      }

      //CHECKING IF THE RECTANGLE TOUCHES THE TSQUARE OBJECTS
      if (t.loc.x<personX+personW && t.loc.x+t.sz>personX && t.loc.y+t.sz>personY && t.loc.y<personY+personH) {
        run=0;
      }
    }
  }

  //RESTARTING THE GAME fix this!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  if (run==0) {
    background(0); 
    textAlign(CENTER);
    textSize(50);
    text("New game? Press g", width/2, height/2);
    if (keyPressed) {
      if (key=='g') {
        run=1;
      }
    }
  }
}



//void keyPressed() {
//  if (delay==originalDelay) {
//    personY = 460;
//    personH=normalH;
//  }
//  //MAKING THE PERSON JUMP OR CROUCH OR GO TO A PLATFORM FOR A CERTAIN AMOUNT OF TIME
//  if (key == CODED) {
//    //UP ARROW MAKES HIM JUMP
//    if (keyCode == UP) {
//      personY= 460-jumpAmount;
//      personH=normalH;
//      //DOWN ARROW MAKES HIM CROUCH
//    } else if (keyCode == DOWN) {
//      personY=540-crouchH;
//      personH=crouchH;
//    }
//    //SPACE SENDS HIM TO A PLATFORM
//  } else if (key==' ') {
//    originalDelay=50;
//    if (personY>height/2-personH) {
//      velY=-6;
//      personY+=velY;
//    } else if (personY==height/2-personH) {
//      velY=0;
//      if (delay<=originalDelay-10) {
//        velY=6;
//      }
//    }
//  }
//}

