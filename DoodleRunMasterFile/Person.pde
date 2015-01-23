//PERSON CLASS

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

  //THE PLATFORM
  int platformH;

  //TELLING IF THE PERSON IS ON THE PLATFORM
  boolean onPlatform;

  //HOW THE PERSON IS DELAYED WHEN HE JUMPS AND CROUCHES
  int delay;
  int originalDelay;
  boolean delayShouldHappen;

  //IMAGE LOOP FOR PERSON
  float imagesRunning;
  PImage p1, p2, p3, p4;

  Person() {

    //LOCATION FOR PERSON
    personX = 50;
    personY = 460;
    personW = 40;
    personH = 80;

    //VALUES FOR HOW THE PERSON JUMPS / CROUCHES
    velY = 0;
    accY = 0;
    jumpAmount = 40;
    normalH = 80;
    crouchH = 40;

    //THE GROUND
    groundH = 540;

    //THE PLATFORM
    platformH = 269;

    //TELLING IF HE IS ON THE PLATFORM
    onPlatform = false;

    //HOW THE PERSON IS DELAYED WHEN HE JUMPS AND CROUCHES
    delay = 0;
    originalDelay = 10;
    delayShouldHappen = true;

    //IMAGE LOOP FOR PERSON
    p1 = loadImage("person1GOOD.png");
    p2 = loadImage("person2GOOD.png");
    p3 = loadImage("person3GOOD.png");
    p4 = loadImage("person4GOOD.png");
    imagesRunning=1;
  }

  void display() {

    //DRAWING THE IMAGE TO INTERACT WITH THE OBJECTS
    if (imagesRunning == 1 || imagesRunning == 1.5 ) {
      image(p1, personX, personY, personW, personH);
    }
    if (imagesRunning == 2 || imagesRunning == 2.5 ) {
      image(p2, personX, personY, personW, personH);
    }
    if (imagesRunning == 3 || imagesRunning == 3.5 ) {
      image(p3, personX, personY, personW, personH);
    }
    if (imagesRunning == 4 || imagesRunning == 4.5 ) {
      image(p4, personX, personY, personW, personH);
    }

    imagesRunning += .5;
    if (imagesRunning > 4) {
      imagesRunning = 1;
    }
  }

  //PERSON CAN JUMP AND CROUCH
  void jumpAndCrouch() {
    if (delayShouldHappen) {
      if (keyPressed) {
        delay = 0;
        if (key == CODED) {

          //UP ARROW MAKES HIM JUMP
          if (keyCode == UP) {
            personY = groundH-personH-jumpAmount;
            personH = normalH;
          }

          //DOWN ARROW MAKES HIM CROUCH
          if (keyCode == DOWN) {
            personH = crouchH;
            personY = groundH-personH;
          }
        }
      }
    }
    delay++;

    //IF THE DELAY REACHES A CERTAIN NUMBER, RESET THE PERSON
    if (delay == originalDelay) {
      personH = normalH;
      personY = groundH-personH;
    }
  }

  //SEND THE CHARACTER TO PLATFORM IF USER PRESSES SPACE
  void goToPlatform() {
    if (key == ' ') {
      personY = platformH - personH;
      delayShouldHappen = false;
      onPlatform = true;
    }
  }

  //SEND THE CHARACTER OFF THE PLATFORM IF THE USER PRESSES C
  void goOffPlatform() {
    if (onPlatform == true) {
      if (key == 'c') {
        personY = groundH - personH;
        delayShouldHappen = true;
        onPlatform = false;
      }
    }
  }

  //CHECKING IF THE CHARACTER TOUCHES THE LOP OBJECTS
  void touchLop(Lop someOtherLop) {
    if (someOtherLop.loc.x<personX+personW && someOtherLop.loc.x+someOtherLop.sz>personX && someOtherLop.loc.y+someOtherLop.sz>personY && someOtherLop.loc.y<personY+personH) {
      run = 0;
    }
  }

  //CHECKING IF THE CHARACTER TOUCHES THE TSQUARE OBJECTS
  void touchTsquare(Tsquare someOtherTsquare) {
    if (someOtherTsquare.loc.x<personX+personW && someOtherTsquare.loc.x+someOtherTsquare.sz>personX && someOtherTsquare.loc.y+someOtherTsquare.sz>personY && someOtherTsquare.loc.y<personY+personH) {
      run = 0;
    }
  }

  //CHECKING IF THE CHARACTER TOUCHES THE BOOK OBJECTS
  void touchBook(Book someOtherBook) {
    if (someOtherBook.loc.x<personX+personW && someOtherBook.loc.x+someOtherBook.sz>personX && someOtherBook.loc.y+someOtherBook.sz>personY && someOtherBook.loc.y<personY+personH) {
      run = 0;
    }
  }
}

