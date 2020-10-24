void intro() {
  clapping.pause();
  intro.play();
  background(white);
  stroke(black);
  shadowText("PONG", width/2, 200, 100);
  tactileButton(400, 340, 300, 130, "1 Player", 550, 395, 80); //start buttons
  tactileButton(100, 340, 300, 130, "2 Player", 250, 395, 80);
}
void introClicks() {
  if (mouseX > 100 && mouseX < 400 && mouseY > 340 && mouseY< 470) onePlayer = false; //if clicked on start button, start game 
  if (mouseX > 400 && mouseX < 700 && mouseY > 340 && mouseY< 470) onePlayer = true;
  intro.rewind();
  mode = GAME;
  resetGame();
}
