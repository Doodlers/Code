class Instructions {
  float txtlocx, txtlocy;
  float txtvelx;
  float txtvely;

  Instructions() {
    txtvelx = -1;
    txtvely = 0;
    txtlocx = 900;
    txtlocy = 100;
  }

  void display() {
    textAlign(CENTER);
    textSize(20);
    fill(0, 0, 360);
    text("Press the UP arrow to jump", txtlocx, txtlocy);
    text("Press the DOWN arrow to crouch", txtlocx, txtlocy+20);
    text("Press SPACE to reach a platform", txtlocx, txtlocy+40);
    text("Press C to jump off platform back to ground", txtlocx, txtlocy+60);
  }

  void move() {
    txtlocx += txtvelx;
    txtlocy += txtvely;
  }
}

