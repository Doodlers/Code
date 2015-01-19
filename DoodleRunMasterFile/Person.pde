class Person {
  //RECTANGLE FOR PERSON
  int personX;
  int personY;
  int personW;
  int personH;

  //VALUES FOR HOW THE PERSON JUMPS/ CROUCHES
  int velY;
  float accY;
  int jumpAmount;
  int normalH;
  int crouchH;

  //HOW THE PERSON IS DELAYED WHEN HE JUMPS AND CROUCHES
  int delay;
  int originalDelay;
  int platformDelay;
  int platformOriginalDelay;

  //IMAGE LOOP FOR PERSON
  int imagesRunning;
  PImage p1, p2, p3, p4, p5;

  Person() {
    //IMAGES FOR PERSON
    p1 = loadImage("person1.png");
    p2 = loadImage("person2.png");
    p3 = loadImage("person3.png");
    p4 = loadImage("person4.png");
    p5 = loadImage("Drop.png");
    imagesRunning=1;

    //RECTANGLE FOR PERSON
    personX = 50;
    personY = 460;
    personW=40;
    personH=80;

    //VALUES FOR HOW THE PERSON JUMPS/ CROUCHES
    velY=0;
    accY=0;
    jumpAmount=40;
    normalH= 80;
    crouchH=40;

    //HOW THE PERSON IS DELAYED WHEN HE JUMPS AND CROUCHES
    delay=0;
    originalDelay=40;
    platformDelay=50;
  }

  void display() {
    //DRAWING THE IMAGE TO INTERACT WITH THE OBJECTS
    image(p1, personX, personY, personW, personH);
  }
  
  void jump() {
    if (keyPressed) {
      delay=0;
      if (key == CODED) {
        //UP ARROW MAKES HIM JUMP
        if (keyCode == UP) {
          personY= 460-jumpAmount;
          personH=normalH;
        }
      }
    }
    delay++;
    if (delay==originalDelay) {
      personY = 460;
      personH=normalH;
    }
  }

  void crouch() {
    if (keyPressed) {
      delay=0;
      if (key == CODED) {
        //DOWN ARROW MAKES HIM CROUCH
        if (keyCode == DOWN) {
          personY=540-crouchH;
          personH=crouchH;
        }
      }
    } 
    delay++;
    if (delay==originalDelay) {
      imagesRunning=1;
    }
  }

  void goToPlatform() {
    personY+=velY;
    platformDelay=0;
    if (keyPressed) {
      if (key==' ') {
        if (personY>height/2-personH) {
          velY=-6;
        } else if (personY==height/2-personH) {
          velY=0;
          platformOriginalDelay=50;
        }
        platformDelay++;
        if (platformDelay==platformOriginalDelay) {
          velY=6;
        }
      }
    }
    println(platformDelay);
  }

  void touchLop(Lop someOtherLop) {
    //CHECKING IF THE RECTANGLE TOUCHES THE LOP OBJECTS
    if (someOtherLop.loc.x<personX+personW && someOtherLop.loc.x+someOtherLop.sz>personX && someOtherLop.loc.y+someOtherLop.sz>personY && someOtherLop.loc.y<personY+personH) {
      run=0;
    }
  }

  void touchTsquare(Tsquare someOtherTsquare) {
    //CHECKING IF THE RECTANGLE TOUCHES THE TSQUARE OBJECTS
    if (someOtherTsquare.loc.x<personX+personW && someOtherTsquare.loc.x+someOtherTsquare.sz>personX && someOtherTsquare.loc.y+someOtherTsquare.sz>personY && someOtherTsquare.loc.y<personY+personH) {
      run=0;
    }
  }
}
