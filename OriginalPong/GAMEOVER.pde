void gameover() {
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
  
  //draw paddles
  if (AI == true) {
  stroke(white);
  fill(red);
  circle(leftx, lefty, leftd);
  stroke(red);
  fill(blue);
  circle(rightx, righty, rightd);
  
  //ball
  stroke(white);
  fill(green);
  circle(ballx, bally, balld);
  } else {
  stroke(white);
  fill(red);
  circle(leftx, lefty, leftd);
  fill(blue);
  circle(rightx, righty, rightd);
  
  //ball
  fill(green);
  circle(ballx, bally, balld);
  }
  
  
  textSize(180);
  
  if (leftscore > rightscore) {
    fill(red);
    text("LEFT", width/2, height/2);
    text("WINS", width/2, height/2+150);
    
    win.play();
  } else {
    fill(blue);
    text("RIGHT", width/2, height/2);
    text("WINS", width/2, height/2+150);
    
    win.play();
  }
  
} 

void gameoverClicks() {
  mode = INTRO;
  intro.rewind();
}
