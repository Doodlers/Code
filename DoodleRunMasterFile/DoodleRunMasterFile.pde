//DECLARING/ INITIALIZING VARIABLES AND ARRAY LISTS
//ARRAY LIST OF OBJECTS
ArrayList<Lop> lops=new ArrayList<Lop>();
ArrayList<Tsquare> tsquares=new ArrayList<Tsquare>(); 
Instructions text=new Instructions(); 
Person doodle;

//DECLARING BACKGROUND
PImage bg;

//AMOUNT TO ADD TO ARRAY LIST
int amount=0;

//RANDOM NUMBER GENERATOR FOR ADDING NEW THINGS TO ARRAY LIST 
int addObject=0;
float num;

//MAKING THE GAME START AND END
int run=1;

void setup() {
  frameRate(40);
  size(900, 600);
  colorMode(HSB, 360, 100, 100, 100);
  
  doodle=new Person();

  bg = loadImage("Lockers Background.JPG");
}

void draw() {
  background(bg);

  if (run==1) {
    //MAKING THE GROUND
    line(0, 540, width, 540);

    //STAND IN FOR THE PLATFORMS
    line(0, height/2, width, height/2);

    //DISPLAYING AND MOVING THE TEXT INSTRUCTIONS
    text.display();
    text.move();
    
    //DISPLAYING AND MOVING CHARACTER IMAGE
    doodle.display();
    doodle.jump();
    doodle.crouch();

    //ADDING NEW OBJECTS TO THE ARRAY LIST
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
      doodle.touchLop(l);
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
      doodle.touchTsquare(t);
    }
  }

  //RESTARTING THE GAME G IS NOT WORKING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  if (run==0) {
    background(0); 
    textAlign(CENTER);
    textSize(50);
    text("New game? Press g", width/2, height/2);
    if (keyPressed) {
      if (key=='g') {
        for (int i=tsquares.size ()-1; i>=0; i--) {
          Tsquare t = tsquares.get(i);
          t.loc.x=random(width, width*2);
        }
        for (int i=lops.size ()-1; i>=0; i--) {
          Lop l = lops.get(i);
          l.loc.x=random(width, width*2);
        }
        run=1;
      }
    }
  }
}

