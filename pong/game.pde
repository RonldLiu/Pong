void game() {
  background(black); //center line
  stroke(white);
  strokeWeight(5);
  line(width/2, 0, width/2, height);
  textSize(50); //scores and paddles
  fill(red); //red
  text(leftscore, width/4, height/8*7); //red score
  circle(leftx, lefty, leftd); //red paddle
  fill(green); //green
  circle(rightx, righty, rightd); //green score
  text(rightscore, width/4*3, height/8*7); //green paddle
  fill(blue); //show ball
  circle(ballx, bally, balld); //blue circle
  if (leftscore==3||rightscore==3) { //when game is over
    mode = GAMEOVER;
    clapping.rewind();
  }
  if (wkey) lefty -= 5; //move paddles //left side 
  if (skey) lefty += 5; 
  if (onePlayer && ballx>400) { //if right side is computer control,
    if (bally>righty) righty+=5; //move towards the ball when the ball is on the right side
    if (bally<righty) righty-=5;
  } else {
    if (upkey) righty -= 5; //if it is not computer controled, it is normal
    if (downkey) righty += 5;
  }
  if (lefty>height-leftd/2) lefty = height-leftd/2;  //paddle restrictions
  if (lefty<leftd/2) lefty = leftd/2;
  if (righty>height-rightd/2) righty = height-rightd/2;
  if (righty<rightd/2) righty = rightd/2;
  timer--; //move ball/timer
  if (timer<0) {
    ballx += vx;
    bally += vy;
  }
  if (bally>height-balld/2) bally = height-balld/2; //ball restriction
  if (bally<balld/2) bally = balld/2;
  if (ballx<0-balld/2) { //scoring, when ball is past the left screen
    rightscore++; //rightside gets a point
    resetRound();
    score.rewind();
    score.play();
  }
  if (ballx>width+balld/2) {  //scoring, when ball is past the right screen
    leftscore++; //leftside gets a point
    resetRound();
    score.rewind();
    score.play();
  }
  if (bally <= balld/2 || bally>=height-balld/2) { //bounce off walls
    vy = vy*-1;
    wall.rewind();
    wall.play();
  }
  if (dist(ballx, bally, leftx, lefty)<=balld/2+leftd/2) { //bounce off left paddle
    vx=(ballx-leftx)/10;
    vy=(bally-lefty)/10;
    leftpaddle.rewind();
    leftpaddle.play();
  }
  if (dist(ballx, bally, rightx, righty)<=balld/2+rightd/2) { //bounce off right paddle
    vx=(ballx-rightx)/10;
    vy=(bally-righty)/10;
    rightpaddle.rewind();
    rightpaddle.play();
  }
}
void resetRound() { //resets the round
  timer = 100;
  ballx = width/2;
  bally = height/2;
  if (round(random(1))==1)vx = random(-5, -3); //really slow balls won't appear
  else vx = random(3, 5);
  if (round(random(1))==1) vy = random(-5, -3);
  else vy = random(3, 5);
}
