class Person {
  //LOCATION FOR PERSON
  int personX;
  float personY;
  int personW;
  float personH;

  //VALUES FOR HOW THE PERSON JUMPS/ CROUCHES
  int velY;
  float accY;
  int jumpAmount;
  int normalH;
  int crouchH;

  //THE GROUND
  int groundH;

  //HOW THE PERSON IS DELAYED WHEN HE JUMPS AND CROUCHES
  int delay;
  int originalDelay;
  boolean delayShouldHappen;

  //TELLING IF HE IS ON THE PLATFORM
  boolean onPlatform;

  //IMAGE LOOP FOR PERSON
  int imagesRunning;
  PImage p1, p2, p3, p4, p5;

  Person() {
    //LOCATION FOR PERSON
    personX = 50;
    personY = 470;
    personW=40;
    personH=80;

    //VALUES FOR HOW THE PERSON JUMPS/ CROUCHES
    velY=0;
    accY=0;
    jumpAmount=40;
    normalH= 80;
    crouchH=40;

    //THE GROUND
    groundH=540;

    //HOW THE PERSON IS DELAYED WHEN HE JUMPS AND CROUCHES
    delay=0;
    originalDelay=20;
    delayShouldHappen=true;

    //TELLING IF HE IS ON THE PLATFORM
    onPlatform=false;

    //IMAGE LOOP FOR PERSON
    p1 = loadImage("person1.png");
    p2 = loadImage("person2.png");
    p3 = loadImage("person3.png");
    p4 = loadImage("person4.png");
    p5 = loadImage("newCrouch.png");
    imagesRunning=1;
  }

  void display() {


    println(onPlatform);


    //DRAWING THE IMAGE TO INTERACT WITH THE OBJECTS
    if (imagesRunning == 1) {
      image(p1, personX, personY, personW, personH);
    }
    if (imagesRunning == 2) {
      image(p2, personX, personY, personW, personH);
    }
    if (imagesRunning == 3) {
      image(p3, personX, personY, personW, personH);
    }
    if (imagesRunning == 4) {
      image(p4, personX, personY, personW, personH);
    }
    if (imagesRunning>=1 && imagesRunning<=4) {
      imagesRunning++;
    } else if (imagesRunning==0) {
      personH=crouchH;
      personY=groundH-personH;
      image(p5, personX, personY, personW, personH);
    }
    if (imagesRunning > 4) {
      imagesRunning = 1;
    }
  }

  void jumpAndCrouch() {
    if (delayShouldHappen) {
      if (keyPressed) {
        delay=0;
        if (key == CODED) {
          //UP ARROW MAKES HIM JUMP
          if (keyCode == UP) {
            personY= groundH-personH-jumpAmount;
            personH=normalH;
          }
          //DOWN ARROW MAKES HIM CROUCH
          if (keyCode == DOWN) {
            imagesRunning=0;
          }
        }
      }
      delay++;
      //IF THE DELAY REACHES A CERTAIN NUMBER, RESET THE PERSON
      if (delay==originalDelay) {
        personH=normalH;
        personY = groundH-personH;
        imagesRunning=1;
      }
    }
  }


  //SEND THE CHARACTER TO PLATFORM IF USER PRESSES SPACE
  void goToPlatform(Platform someOtherPlatform) {
    if (key==' ') {
      if (someOtherPlatform.loc.x<personX+personW && someOtherPlatform.loc.x+someOtherPlatform.sz.x>personX) {
        personY=someOtherPlatform.loc.y-personH;
        delayShouldHappen=false;
        onPlatform=true;
      } 
//      else if (someOtherPlatform.loc.x>personX+personW || someOtherPlatform.loc.x+someOtherPlatform.sz.x<personX) {
//        personY=groundH-personH;
//        delayShouldHappen=true;
//        onPlatform=false;
//      }
    }
  }

  //TAKING CHARACTER OFF PLATFORM ONCE THE PLATFORM ENDS
  void goOffPlatform(Platform someOtherPlatform) {
    if (someOtherPlatform.loc.x>personX+personW || someOtherPlatform.loc.x+someOtherPlatform.sz.x<personX) {
      personY=groundH-personH;
      delayShouldHappen=true;
      onPlatform=false;
    }
  }


  void touchLop(Lop someOtherLop) {
    //CHECKING IF THE CHARACTER TOUCHES THE LOP OBJECTS
    if (someOtherLop.loc.x<personX+personW && someOtherLop.loc.x+someOtherLop.sz>personX && someOtherLop.loc.y+someOtherLop.sz>personY && someOtherLop.loc.y<personY+personH) {
      run=0;
    }
  }

  void touchTsquare(Tsquare someOtherTsquare) {
    //CHECKING IF THE CHARACTER TOUCHES THE TSQUARE OBJECTS
    if (someOtherTsquare.loc.x<personX+personW && someOtherTsquare.loc.x+someOtherTsquare.sz>personX && someOtherTsquare.loc.y+someOtherTsquare.sz>personY && someOtherTsquare.loc.y<personY+personH) {
      run=0;
    }
  }
}

