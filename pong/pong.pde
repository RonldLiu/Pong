//Ronald Liu
//1-2
//pong
import ddf.minim.*;
final int INTRO = 0, GAME = 1, PAUSE = 2, GAMEOVER = 3; //mode's number
int mode = INTRO, leftscore, rightscore, timer; //mode and score;
Minim minim;//sound variables
AudioPlayer intro, leftpaddle, rightpaddle, wall, score, clapping;
float leftx, lefty, leftd = 200, rightx, righty, rightd = 200, ballx, bally, balld = 100, vx, vy; //paddles variables and ll's x postition, y position diameter and the velocities.
boolean wkey = false, skey = false, upkey = false, downkey = false, onePlayer; //keyboard variables, one player mode
color black = color(0), white = color(255), red = color(255, 0, 0), green = color(0, 255, 0), blue = color(0, 255, 255), lightgrey = color(100), darkgrey = color(200);
void setup() {
  size(800, 600, FX2D);
  textAlign(CENTER, CENTER);
  //intitallize left paddles
  leftx = 0;
  //intitallize left paddles
  rightx = width;
  //intitallize ball
  //intiallze keyboard var
  //minim
  minim = new Minim(this);
  intro = minim.loadFile("intro.wav");
  leftpaddle = minim.loadFile("leftpaddle.wav");
  rightpaddle = minim.loadFile("rightpaddle.wav");
  wall = minim.loadFile("wall.wav");
  score = minim.loadFile("score.wav");
  clapping = minim.loadFile("clapping.wav");
}
void draw() { //different modes depending on the mode    
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER)  gameover();
}
