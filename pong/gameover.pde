void gameover() {
  clapping.play();
  if (leftscore==3) { //left won
    textSize(100);
    fill(red);
    text("LEFT WIN", width/2, height/2);
  } else { //right won
    textSize(100);
    fill(green);
    text("RIGHT WIN", width/2, height/2);
  }
}
