void shadowText(String text, float x, float y, int size) { //fancy text
  textSize(size);
  fill(black);
  text(text, x-5, y+5);
  fill(darkgrey);
  text(text, x, y);
}
void tactileButton(int x, int y, int w, int h, String txt, int sx, int sy, int s) { //tactileButton function
  strokeWeight(1);
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY< y+h) fill(lightgrey); //if hoving on button change appearance
  else fill(white);
  rect(x, y, w, h);
  shadowText(txt, sx, sy, s);
}
void resetGame() { //game initialization/reset
  leftscore = 0;
  rightscore = 0;
  timer = 100;
  lefty=height/2; //resets paddle position
  righty=height/2; //resets paddle position
  resetRound(); // reset round
}
void mouseReleased() { //depending on which mode, calls the click functions
  if (mode == INTRO) introClicks();
  else if (mode == GAME) mode = PAUSE; //since all gameCLick does is to switch to pause mode, i didn't make a gameclick funtcion
  else if (mode == PAUSE) mode = GAME; //same with pause and gameover
  else if (mode == GAMEOVER) mode = INTRO;
}
void keyPressed() {
  if (key == 'w' || key =='W') wkey = true;
  if (key == 's' || key =='S') skey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
}
void keyReleased() {
  if (key == 'w' || key =='W') wkey = false;
  if (key == 's' || key =='S') skey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
}
