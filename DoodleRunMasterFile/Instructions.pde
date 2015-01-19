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
    text("Hold down SPACE to reach a platform", txtlocx, txtlocy+40);
    text("Press P to pause game", txtlocx, txtlocy+60);
    text("Press R to resume game", txtlocx, txtlocy+80);
  }

  void move() {
    txtlocx += txtvelx;
    txtlocy += txtvely;
  }
}

