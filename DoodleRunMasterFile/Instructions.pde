//INSTRUCTIONS CLASS

class Instructions {

  //DECLARING LOCATION AND VELOCITY
  float txtlocx, txtlocy;
  float txtvelx, txtvely;

  Instructions() {

    //INITIALIZING VELOCITIES AND LOCATIONS
    txtvelx = -1;
    txtvely = 0;
    txtlocx = 800;
    txtlocy = 100;
  }

  //DISPLAYING INSTRUCTIONS
  void display() {
    textAlign(CENTER);
    textSize(20);
    fill(0, 0, 360);
    text("Press the UP arrow to jump", txtlocx, txtlocy);
    text("Press the DOWN arrow to crouch", txtlocx, txtlocy+20);
    text("Press SPACE to reach a platform", txtlocx, txtlocy+40);
    text("Press C to jump off platform back to ground", txtlocx, txtlocy+60);
    text("*You cannot jump or crouch while on a platform*", txtlocx, txtlocy+80);
  }

  //MOVING INSTRUCTIONS
  void move() {
    txtlocx += txtvelx;
    txtlocy += txtvely;
  }
}

