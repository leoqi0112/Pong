void game() {
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

  //move paddles
  if (AI == false) {
  stroke(white);
  if (wkey == true && lefty > 100) {
  lefty = lefty - 5;
  }
  if (skey == true && lefty < height-100) {
  lefty = lefty + 5;
  }
  if (upkey == true && righty > 100){
  righty = righty - 5;
  }
  if (downkey == true && righty < height-100) {
  righty = righty + 5;
  }
  } else if (AI == true) {
    
    strokeWeight(5);
    
    //manual
    stroke(red);
    if (wkey == true && lefty > 100) {
    lefty = lefty - 5;
    }
    if (skey == true && lefty < height-100) {
    lefty = lefty + 5;
    }
  
    //AI
    if (ballx > width/2) {
    if (bally < righty && righty >= 100 && righty <= height-100) {
      righty = righty - 4;
    } else if (bally > righty && righty >= 100 && righty <= height-100) {
      righty = righty + 4;
    }
    if (righty > height-100) {
      righty = height-100;
    }
    if (righty < 100) {
      righty = 100;
    }
    }
  }
  
  //draw paddles
  strokeWeight(5);
  fill(blue);
  circle(rightx, righty, rightd);
  stroke(white);
  fill(red);
  circle(leftx, lefty, leftd);
  
  
  //ball
  stroke(white);
  fill(green);
  circle(ballx, bally, balld);

  //move ball
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }
  timer = timer - 1;

  //score
  if (ballx < 0) {
    rightscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    vx = 4;
    vy = 0;
    score.rewind();
    score.play();
  }
  if (ballx > width) {
    leftscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
    vx = 4;
    vy = 0;
    score.rewind();
    score.play();
  }

  //if (ballx < balld/2 || ballx > width-balld/2) vx = vx*-1;
  //bounce up and down
  if (bally < balld/2 || bally > height-balld/2){
  vy = vy*-1;
  wall.rewind();
  wall.play();
  }
  
  //reset ball position
  if (bally > height-50) {
    bally = height-50;
  }
  
  if (bally < 50) {
    bally = 50;
  }

  
  //collision ball vs paddle
  if (dist(leftx, lefty, ballx, bally) <= leftd/2 + balld/2) { 
    vx = (ballx - leftx)/15;
    vy = (bally - lefty)/15;
    leftP.rewind();
    leftP.play();
  }
  if (dist(rightx, righty, ballx, bally) <= rightd/2 + balld/2) {
    vx = (ballx-rightx)/15;
    vy = (bally-righty)/15;
    rightP.rewind();
    rightP.play();
  }
  
  //Gameover
  if (rightscore == 3 || leftscore == 3) {
    mode = GAMEOVER;
    win.rewind();
    
  }
}

void gameClicks() {
  if (dist(mouseX, mouseY, width/2, 80) < 40) {
    mode = PAUSE;
    
  }
}
