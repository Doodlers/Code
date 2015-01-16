PImage bg;
float locx, locy;
float velx = -2;
float vely = 0;

void setup() {
  frameRate(40);
  size(900, 600);
  colorMode(HSB, 360, 100, 100, 100);

  noCursor();
  bg = loadImage("Lockers Background.JPG");

  locx = width;
  locy = 100;
}

void draw() {
  background(bg);

  line(0, 540, width, 540);

  locx += velx;
  locy += vely;

  textAlign(CENTER);
  textSize(20);
  fill(0);
  text("Press the UP arrow to jump", locx, locy);
  text("Press the DOWN arrow to crouch", locx, locy+20);
  text("Press SPACE to jump onto a platform", locx, locy+40);
  text("Press P to pause game", locx, locy+60);
  text("Press R to resume game", locx, locy+80);
}

