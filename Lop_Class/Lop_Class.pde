//DECLARING/ INITIALIZING VARIABLES AND ARRAY LISTS
//ARRAY LIST OF OBJECTS
ArrayList<Lop> lops=new ArrayList<Lop>();
ArrayList<Tsquare> tsquares=new ArrayList<Tsquare>();


//AMOUNT TO ADD TO ARRAY LIST
int amount=0;

//RANDOM NUMBER GENERATOR FOR ADDING NEW THINGS TO ARRAY LIST 
int n=50;
float m;

//RECTANGLE FOR PERSON
int personX = 50;
int personY = 460;
int personW=40;
int personH=80;

//VALUES FOR HOW THE PERSON JUMPS/ CROUCHES
int jumpAmount=40;
int normalH= 80;
int crouchH=40;

//MAKING THE GAME START AND END
int run=1;

void setup() {
  frameRate(40);
  size(900, 600);
  lops.add(new Lop(random(width, width*2)));
}

void draw() {

  if (run==1) {
    background(255);

    m=random(n);

    //MAKING THE GROUND
    line(0, 540, width, 540);

    //ADDING OBJECTS TO THE ARRAY LIST fix this!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//    if (m>0&&m<1) {
//      if (amount<5) {
//        for (int i=tsquares.size ()-1; i>=0; i--) {
//          Tsquare t = tsquares.get(i);
//          if (t.loc.x<width-50) {
//            lops.add(new Lop(random(width, width*2)));
//          }
//        }
//      }
//    }
//    if (m>0&&m<.5) {
//      if (amount<5) {
//        for (int i=lops.size ()-1; i>=0; i--) {
//          Lop l = lops.get(i);
//          if (l.loc.x<width-50) {
//            tsquares.add(new Tsquare(random(width*2, width*3)));
//          }
//        }
//        amount++;
//      }
//    }

    //DRAWING THE RECTANGLE TO INTERACT WITH THE OBJECTS
    rectMode(CORNER);
    rect(personX, personY, personW, personH);
    personY = 460;
    personH=normalH;

    //MAKING THE RECTANGLE JUMP OR CROUCH
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {
          personY= 460-jumpAmount;
          personH=normalH;
        } else if (keyCode == DOWN) {
          personY=540-crouchH;
          personH=crouchH;
        }
      }
    }



    //USING METHODS FOR THE LOP CLASS
    for (int i=lops.size ()-1; i>=0; i--) {
      Lop l = lops.get(i);
      l.move();
      l.display();

      if (l.off()) {
        lops.remove(i);
        lops.add(new Lop(random(width, width*2)));
      }

      //CHECKING IF THE RECTANGLE TOUCHES THE LOP OBJECTS
      if (l.loc.x<personX+personW && l.loc.x+l.sz>personX && l.loc.y+l.sz>personY && l.loc.y<personY+personH) {
        print("touch  ");
        run=0;
      }
    }
  }

  //USING METHODS FOR THE TSQUARE CLASS
  for (int i=tsquares.size ()-1; i>=0; i--) {
    Tsquare t = tsquares.get(i);
    t.move();
    t.display();

    if (t.off()) {
      tsquares.remove(i);
      tsquares.add(new Tsquare(random(width*2, width*3)));
    }

    //CHECKING IF THE RECTANGLE TOUCHES THE TSQUARE OBJECTS
    if (t.loc.x<personX+personW && t.loc.x+t.sz>personX && t.loc.y+t.sz>personY && t.loc.y<personY+personH) {
      print("touch  ");
      run=0;
    }
  }



  if (run==0) {
    background(0); 
    textAlign(CENTER);
    textSize(50);
    text("New game? Press g", width/2, height/2);
  }
}

