void setup() {
}

void draw() {
  println("...");
  //we want to have a chance of adding a LOP or a TSquare each frame
  float rand = random(1);      //generate a random number
  //each frame, we want the probability of generating a LOP to be .5%
  if (rand < .05) {
    addALop();
  }
  //each frame, we also want the probability of a tsquare to be .1%
  else if (rand > .99) {
    addATSquare();
  }
}

void addALop() {
  println("LOP");
}

void addATSquare() {
  println("TSquare");
}

