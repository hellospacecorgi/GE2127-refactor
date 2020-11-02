/* GE2127 Computer-Aided Visual Design & Electronic Arts 
 * - Programming with Image, Audio, Animation & Interaction
 * 2016-2017 Semester A
 * Group 6
 * Stop Polluting and Save lives
 */

//bgm using minim library
import ddf.minim.*;
Minim minim;
AudioSample calm;
AudioSample beachwaves;
AudioSample underwater;
AudioSample danger;
boolean menu = false;
boolean stage1 = false;
boolean stage2 = false;
boolean stage3 = false;

//menu
PImage poster;
boolean circleOver = false;
boolean start = false;
int CircleX = 75;
int  CircleY = 210;

//hatchegg
PImage turtle;
PFont title;
PImage eggup;
PImage eggdown;
float eggupY = 335;
float eggupX = 400;
float eggdownY = 350;
boolean hatched = false;

// sticky image
PImage img;
PImage img2;
PImage sea;
PImage bag1;

//polar bear
PImage iceburg;
PImage polar_bear;
PImage bg;
float x1, y1; // bear
float x2, speed2; // iceberg
PFont fontChalk;
int wordTrans = 255;

//time bar
float barWidth; // time bar count
PImage[] bag =new PImage[1];
float imgX; // x-center of block
float imgY; // y-center of block
int num=100;

// ball
float[] bx = new float[num]; // x position
float[] by = new float[num]; // y position
float[] xspeed =new float[num]; // speed in x direction
float[] yspeed =new float[num]; // speed in y direction
float[] radius =new float[num];
float[] ballWidth =new float[num];
float[] ballHeight =new float[num];

//cuts
int a = 0;
int b = 0;
int c = 0;
PImage cutTurtle;
PImage cut2bg;
PImage cut3bg;
boolean cut01End = false;
boolean cut02End = false;
boolean cut03End = false;

void setup() {
  smooth(4);
  strokeJoin(ROUND);
  strokeWeight(10);
  barWidth = 800;
  mousePressed();

  //bgm
  minim = new Minim(this);
  calm = minim.loadSample("calm.mp3", 512);
  beachwaves = minim.loadSample("beachwaves.mp3", 512);
  underwater = minim.loadSample("underwater.mp3", 512);
  danger = minim.loadSample("danger.mp3", 512);

  //menu
  poster = loadImage("GEPosterclear.png");

  //hatchegg 
  turtle = loadImage("turtle.png");
  eggdown = loadImage("eggdown.png");
  eggup = loadImage("eggup.png");

  //turtlerubbish
  img = loadImage("turtlehappy.png");
  img2 = loadImage("turtle_unhappy.png");
  sea = loadImage("sea.png");
  bag1 = loadImage("plasticbagno.png");

  //polar bear
  x1 = 100;  
  y1 = 400;  //polar bear
  x2 = 50;  
  speed2 = 2.6;  // iceberg
  iceburg = loadImage("iceburg.png");
  polar_bear = loadImage("polar_bear.png");
  bg = loadImage("blue.png");
  fontChalk = loadFont("Chalkduster-50.vlw");

  //cuts
  cutTurtle = loadImage("cutturtle.png");
  cut2bg = loadImage("sea2.png");
  cut3bg = loadImage("ice3.png");

  // size of image block
  size(800, 500);

  //position of bird
  imgX = width / 2;
  imgY = height / 2;

  for (int i=0; i<num; i++) {
    // position of first ball
    bx[i] = random(width);
    by[i] = random(height);
    xspeed[i] = random(0, 10);
    yspeed[i] = random(0, 10);
    radius[i] = random(10, 20);
    ballWidth[0] = 50;
    ballHeight[0] = 50;
  }
}


void draw() {
  background(200);
  if (!menu) { 
    menumusic(); 
    menu = true;
  }
  if (!start) {  
    menu();
  } else {
    hatchegg();
    timeLine();
  }
}

//menu
void menu() {
  image(poster, 0, 0, 800, 500);
  if (CircleX -70 < mouseX && mouseX < CircleX+50 && CircleY-55< mouseY  && mouseY < CircleY+65) { 
    circleOver = true;
  } else {
    circleOver = false;
  }
  if (circleOver) {
    noStroke();
    fill(200, 40, 40);
    ellipse(CircleX, CircleY, 145, 120);
    fill(250, 50, 99);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Start?", width/2, height/2);
    textSize(30);
    text ("(Click!)", width/2, height/2 + 40);
    image(turtle, width/2 - 200, 400, 300, 300 );
  } else { 
    textSize(50);
    noStroke();
    textAlign(CENTER, CENTER);
    text("<- ?", width/2 - 200, height/2 -80);
  } 
  if (mousePressed == true && circleOver == true) { 
    start = true;
  } else {
    start =false ;
  }
}


void timeLine() {

  if (hatched == true) {
    cut1();
    if (cut01End == true) {
      displayTimeBar();
      if (barWidth <= 400) {
        fill(0, 30);
        rect(0, 0, 800, 500);
        image(img2, imgX, imgY, 100, 100);
      }
      if (barWidth <= 200) {
        cut2();
        cut02End = true;
        //polarBear();
      }
    }
  }
}

//bgm
void menumusic() {
  calm.trigger();
}

void stage1music() {
  calm.stop();
  beachwaves.trigger();
}

void stage2music() {
  beachwaves.stop();
  underwater.trigger();
}

void stage3music() {
  underwater.stop();
  danger.trigger();
}

// hatchegg

//cutscene1
void bubble() {
  fill(0, 0, 40); //speech
  noStroke();
  //top
  rect(180, 40, 440, 130);
}
void speech() {
  fill(184, 17, 93);
  textSize(18);
  switch(a) {
  case 0 : 
    text("Turtle :\n Wow, what a beautiful sea!", 320, 70);  
    break;
  case 1 : 
    text("Turtle :\n I can't wait to grow up there!", 330, 70);  
    break;
  case 2 : 
    text("Turtle :\n And enjoy a beautiful life.", 320, 70);  
    break;
  }
}

void stop01() {
  if (a>=3) {
    turtleRubbish();
    cut01End = true;
  }
}

//turtle rubbish


void mousePressed() {
  bx[bx.length-1] = mouseX;
  by[by.length-1] = mouseY;
  //radius[radius.length-1] = 1;
  xspeed[xspeed.length-1] = 1;
  yspeed[yspeed.length-1] = 1;
  ballHeight[ballHeight.length-1] = 50;
  ballWidth[ballWidth.length-1] = 50;
  if (hatched == true) {
    a++;
  }
  if (cut02End == true) {
    b++;
  }
  if (cut03End == true) {
    c++;
  }
}

//cut02
void cut2() {
  //background(250);
  imageMode(CORNER);
  image(cut2bg, 0, 0, 800, 500);
  speech02();
  stop02();
}
void speech02() {
  fill(184, 17, 93);
  textSize(18);
  switch(b) {
  case 0 : 
    text("Turtle :\n I can't imagine the sea that I dreamt of is so dirty!", 100, 70);  
    break;
  case 1 : 
    text("Turtle :\n I think I am dying...", 100, 70);  
    break;
  case 2 : 
    text("Turtle :\n Ar...", 100, 70);  
    break;
  case 3 : 
    text("Turtle :\n The polar bear is coming to eat me...", 100, 70);  
    break;
  case 4 : 
    fill(0);
    imageMode(CORNER);
    image(cut3bg, 0, 0, 800, 500);
    text("Polar Bear :\n Oh no! After I ate the turtle, I feel sick...", 100, 70);
    break;
  case 5 : 
    fill(0);
    imageMode(CORNER);
    image(cut3bg, 0, 0, 800, 500);
    text("Polar Bear :\n And the iceberg is moving!?", 100, 70);
    break;
  case 6 : 
    fill(0);
    imageMode(CORNER);
    image(cut3bg, 0, 0, 800, 500);
    text("The iceberg is melting! QUICK!", 100, 70);
    break;
  case 7 : 
    fill(0);
    imageMode(CORNER);
    image(cut3bg, 0, 0, 800, 500);
    text("Don't let the bear fall into the water!", 100, 70);
    break;
  case 8 : 
    fill(0);
    imageMode(CORNER);
    image(cut3bg, 0, 0, 800, 500);
    text("Press spacebar to make the bear move!", 100, 70);
    break;
  }
}

void stop02() {
  if (b>=8) {
    polarBear();
    cut03End = true;
  }
}

void lose() {
  if (x1+25 < x2-70) {
    fill(0, 0, 0, 150);
    rect(0, 0, 800, 500);
    fill(0);
    textSize(50);
    text("YOU LOSE!! :(", 230, 250);
    //sink
    y1 += 1.3;
    if (y1>=600)
      cut3();
    danger.stop();
    calm.trigger();
  }
}

//cut02
void cut3() {
  //background (150);
  imageMode(CORNER);
  image(cut3bg, 0, 0, 800, 500);
  speech03();
  stop03();
}
void speech03() {
  fill(0);
  textSize(20);
  switch(c) {
  case 0 : 
    text("Click to retry.", 50, height/2);  
    break;
  case 1 : 
    text("Sorry, you can't.", 50, height/2);  
    break;
  case 2 : 
    text("Every year, many animals die beacuse of the pollution.", 50, height/2);  
    break;
  case 3 : 
    text("You cannot save their lives, but you can make a difference.", 50, height/2);  
    break;
  case 4 : 
    text("Stop Polluting and Save lives?", 50, height/2);  
    break;
  }
}
void stop03() {
  if (c>=5) {
    menu = false;
    stage1 = false;
    stage2 = false;
    barWidth = 800;
    stage3 = false;
    circleOver = false;
    start = false;
    eggupY = 335;
    hatched = false;
    a = 0;
    b = 0;
    c = 0;
    cut01End = false;
    cut02End = false;
    cut03End = false;

    draw();
    //menu();
    //fill(255);
  }
}