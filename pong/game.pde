void game() {
  background(black); //center line
  stroke(white);
  strokeWeight(5);
  line(width/2, 0, width/2, height);
  //scores and paddles
  textSize(50); // text size of 50
  fill(red); //red
  text(leftscore, width/4, height/8*7); //red score
  circle(leftx, lefty, leftd); //red paddle
  fill(green); //green
  circle(rightx, righty, rightd); //green score
  text(rightscore, width/4*3, height/8*7); //green paddle
  //show ball
  fill(blue); //blue
  circle(ballx, bally, balld); //blue circle
  //gameover
  if (leftscore==3||rightscore==3) {
    mode = GAMEOVER;
    clapping.rewind();
  }
  //move paddles
  //left side 
  if (wkey) lefty -= 5;
  if (skey) lefty += 5;
  //right side
  if (onePlayer && ballx>400) {
    if (bally>righty) righty+=5;
    if (bally<righty) righty-=5;
  } else {
    if (upkey) righty -= 5;
    if (downkey) righty += 5;
  }
  //paddle restrictions
  if (lefty>height-leftd/2) lefty = height-leftd/2;
  if (lefty<leftd/2) lefty = leftd/2;
  if (righty>height-rightd/2) righty = height-rightd/2;
  if (righty<rightd/2) righty = rightd/2;
  //move ball/timer
  timer--;
  if (timer<0) {
    ballx += vx;
    bally += vy;
  }
  //ball restriction
  if (bally>height-balld/2) bally = height-balld/2;
  if (bally<balld/2) bally = balld/2;
  //scoring
  if (ballx<0-balld/2) {
    rightscore++;
    resetRound();
    score.rewind();
    score.play();
  }
  if (ballx>width+balld/2) {
    leftscore++;
    resetRound();
    score.rewind();
    score.play();
  }
  //bouncing ball
  //bounce off walls
  if (bally <= balld/2 || bally>=height-balld/2) {
    vy = vy*-1;
    wall.rewind();
    wall.play();
  }
  //bounce off paddles
  if (dist(ballx, bally, leftx, lefty)<=balld/2+leftd/2) {
    vx=(ballx-leftx)/10;
    vy=(bally-lefty)/10;
    leftpaddle.rewind();
    leftpaddle.play();
  }
  if (dist(ballx, bally, rightx, righty)<=balld/2+rightd/2) {
    vx=(ballx-rightx)/10;
    vy=(bally-righty)/10;
    rightpaddle.rewind();
    rightpaddle.play();
  }
}
void resetRound() {
  timer = 100;
  ballx = width/2;
  bally = height/2;
  if (round(random(1))==1)vx = random(-5, -3); 
  else vx = random(3, 5);
  if (round(random(1))==1) vy = random(-5, -3);
  else vy = random(3, 5);
}
