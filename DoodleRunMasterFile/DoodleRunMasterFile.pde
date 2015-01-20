//DECLARING / INITIALIZING VARIABLES AND ARRAY LISTS
//ARRAY LIST OF OBJECTS
ArrayList<Lop> lops=new ArrayList<Lop>();
ArrayList<Tsquare> tsquares=new ArrayList<Tsquare>(); 
ArrayList<Book> books=new ArrayList<Book>(); 
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

  //INITIALIZING THE PERSON
  doodle=new Person();

  //INITIALIZING THE BACKGROUND
  bg = loadImage("Lockers Background.JPG");
}

void draw() {
  background(bg);
  println(num);

  //IF THE RUN=1 (WHICH MEANS THE GAME IS STARTED/ CAN CONTINUE)
  if (run==1) {

    //DISPLAYING AND MOVING THE TEXT INSTRUCTIONS
    text.display();
    text.move();

    //DISPLAYING, JUMPING, CROUCHING CHARACTER IMAGE
    doodle.display();
    doodle.jumpAndCrouch();

    //ADDING NEW OBJECTS TO THE ARRAY LIST AFTER A SET NUMBER OF FRAMES
    num=random(1);
    if (addObject==50) {
      if (num < .33333) {
        //LOPS WILL THEORETICALLY ADD ONE THIRD THE TIME
        lops.add(new Lop(random(width, width*2)));
        addObject=0;
      } else if (num > .33333 && num < .666666) {
        //TSQUARES WILL THEORETICALLY ADD ONE THIRD OF THE TIME
        tsquares.add(new Tsquare(random(width, width*2)));
        addObject=0;
      } else if (num > .666666 && num < 1) {
        //BOOKS WILL THEORETICALLY ADD ONE THIRD OF THE TIME
        books.add(new Book(random(width, width*2)));
        addObject=0;
      }
    }
    addObject++;

    //USING METHODS FOR THE LOP CLASS
    for (int i=lops.size ()-1; i>=0; i--) {
      Lop l = lops.get(i);
      l.move();
      l.display();

      //REMOVING THE LOP IF IT IS OFF THE SCREEN
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

      //REMOVING THE TSQUARE IF IT IS OFF THE SCREEN
      if (t.off()) {
        tsquares.remove(i);
      }

      //CHECKING IF THE RECTANGLE TOUCHES THE TSQUARE OBJECTS
      doodle.touchTsquare(t);
    }


    //USING METHODS FOR THE BOOK CLASS
    for (int i=books.size ()-1; i>=0; i--) {
      Book b = books.get(i);
      b.move();
      b.display();

      //REMOVING THE BOOK IF IT IS OFF THE SCREEN
      if (b.off()) {
        books.remove(i);
      }

      //CHECKING IF THE RECTANGLE TOUCHES THE BOOK OBJECTS
      doodle.touchBook(b);
    }
  }


  //MAKING THE PLATFORM
  strokeWeight(9);
  stroke(181, 41, 86);
  line(0, height/2-30, width, height/2-30);


  //RESTARTING THE GAME
  if (run==0) {
    //CHANGING TO THE END/ RESTART SCREEN
    background(0); 
    textAlign(CENTER);
    textSize(50);
    text("New game? Press g", width/2, height/2);
    if (keyPressed) {
      if (key=='g') {
        //IF G IS PRESSED, RESET THE LOCATIONS OF THE LOPS, TSQUARES, BOOKS, AND TEXT AND GO BACK TO THE GAME SCREEN
        for (int i=tsquares.size ()-1; i>=0; i--) {
          Tsquare t = tsquares.get(i);
          t.loc.x=random(width, width*2);
        }
        for (int i=lops.size ()-1; i>=0; i--) {
          Lop l = lops.get(i);
          l.loc.x=random(width, width*2);
        }
        for (int i=books.size ()-1; i>=0; i--) {
          Book b = books.get(i);
          b.loc.x=random(width, width*2);
        }
        text.txtlocx=width;
        run=1;
      }
    }
  }
}

void keyPressed() {
  doodle.goToPlatform();
  doodle.goOffPlatform();
}

