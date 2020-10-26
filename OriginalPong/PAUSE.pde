void pause() {
  background(black);
  
   //center line
  strokeWeight(5);
  stroke(white);
  line(width/2, 0, width/2, height);
  
  //scoreboard
  noStroke();
  textSize(50);
  fill(red);
  textFont(numbers);
  text(leftscore, width/4, 100);

  fill(blue);
  textFont(numbers);
  text(rightscore, 3*width/4, 100);
  
  //Pause
  noStroke();
  fill(orange);
  
  if (dist(mouseX, mouseY, width/2, 80) < 40) {
  circle(width/2, 80, 80);
  stroke(black);
  strokeWeight(8);
  fill(black);
  triangle(width/2-15, 65, width/2+12, 80, width/2-13, 95);
  } else {
  circle(width/2, 80, 80);
  stroke(black);
  strokeWeight(8);
  line(width/2-13, 60, width/2-13, 100);
  line(width/2+12, 60, width/2+12, 100);
  }
  
  //draw paddles
  strokeWeight(5);
  stroke(white);
  fill(blue);
  circle(rightx, righty, rightd);
  stroke(white);
  fill(red);
  circle(leftx, lefty, leftd);
  
  
  //ball
  stroke(white);
  fill(green);
  circle(ballx, bally, balld);
  
  //Text
  textSize(180);
  fill(grey);
  text("PAUSE", width/2, height/2);

}

void pauseClicks() {
  if (dist(mouseX, mouseY, width/2, 80) < 40) {
    mode = GAME;
  }
}
