void intro() {
  clapping.pause(); //stop clapping
  intro.play(); //play sound
  background(white);
  stroke(black);
  shadowText("PONG", width/2, 200, 100); //title
  tactileButton(400, 340, 300, 130, "1 Player", 550, 395, 80); //1 player button
  tactileButton(100, 340, 300, 130, "2 Player", 250, 395, 80); //2 player button
}
void introClicks() {
  if (mouseX > 100 && mouseX < 400 && mouseY > 340 && mouseY< 470) onePlayer = false; //if clicked on 2 player button, start game without computer player
  if (mouseX > 400 && mouseX < 700 && mouseY > 340 && mouseY< 470) onePlayer = true; //if clicked on 1 player, start game with computer player
  intro.rewind();
  mode = GAME;
  resetGame(); //resets game
}
