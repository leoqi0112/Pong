import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Pong!
//Leo Qi
//1-2 A
//Oct 15, 2020

//sound variables
Minim minim;
AudioPlayer leftP, rightP, wall, score, win, intro;
//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball
float vx, vy; // ball velocity

int leftscore, rightscore, timer;

int Ptimer;

int Ttimer;

//keyboard variables
boolean wkey, skey, upkey, downkey;

color red = #FA023C;
color blue = #69D2E7;
color purple = #BE80FF;
color white = #f5f5f5;
color grey = #B4BAB9;
color Lblue = #A7DBD8;
color black = #413D3D;
color coral = #FF847C;
color Dcoral = #E84A5F;
color green = #99B898;
color orange = #FECEA8;

PFont numbers;

boolean AI;

float textS;

void setup() { 
  size(800, 600);
  textAlign(CENTER);
  mode = INTRO;
  
  numbers = createFont("font.ttf", 100);
  //initialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  
  rightx = width;
  righty = height/2;
  rightd = 200;
  
  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 100;
  
  //initialize score
  rightscore = leftscore = 0;
  timer = 100;
  
  //initialize keyboard vars
  wkey = skey = upkey = downkey = false;
  
  //initialize ball speed
  vx = 5;
  vy = 5;
  
  //minim
  minim = new Minim(this);
  leftP = minim.loadFile("leftpaddle.wav");
  rightP = minim.loadFile("rightpaddle.wav");
  wall = minim.loadFile("wall.wav");
  score = minim.loadFile("score.wav");
  win = minim.loadFile("clapping.wav");
  intro = minim.loadFile("intro.wav");
  
  //timer for paddle delays
  Ptimer = 50;
  
  //AI
  AI = false;
  
  //INTRO TEXT
  textS = 200;
  
  //timer for text Animation
  Ttimer = 70;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
