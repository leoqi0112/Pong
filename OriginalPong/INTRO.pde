void intro() {
  background(black);
  
  intro.play();
  //draw paddles
  stroke(white);
  strokeWeight(5);
  fill(red);
  circle(leftx, lefty, leftd);
  fill(blue);
  circle(rightx, righty, rightd);
  
  //ball
  stroke(white);
  strokeWeight(5);
  fill(green);
  circle(ballx, bally, balld);
  
  //Intro text
  fill(Lblue);
  textFont(numbers);
  textSize(textS);
  text("PONG", width/2, 2*height/5);
  
  //Text Animation
  if (textS == 150) {
    Ttimer = 70;
  }
    if (textS > 150 && Ttimer < 0){
     textS = textS-1;
    } else {
       textS = textS+1;
    }
    Ttimer = Ttimer -1;


  //SINGLE
  if (mouseX > 150 && mouseX < 350 && mouseY > 400 && mouseY < 480) {
    fill(Dcoral);
  } else {
    fill(coral);
  }
  noStroke();
  rect(150, 400, 200, 80);
  fill(0);
  textSize(70);
  text("SINGLE", 250, 465);
  
  //DOUBLE
  if (mouseX > 450 && mouseX < 650 && mouseY > 400 && mouseY < 480) {
    fill(Dcoral);
  } else {
    fill(coral);
  }
  noStroke();
  rect(450, 400, 200, 80);
  fill(0);
  textSize(70);
  text("DOUBLE", 550, 465);
  
  //move ball
  if (timer < 0) {
  ballx = ballx + vx;
  bally = bally + vy;
  }
  
  //move paddle
  if (ballx > width/2) {
    if (bally < righty && righty >= 100 && righty <= height-100) {
      righty = righty - 5;
    } else if (bally > righty && righty >= 100 && righty <= height-100) {
      righty = righty + 5;
    }
  } else if (ballx < width/2 && lefty >= 100 && lefty <= height-100){
    if (bally < lefty) {
      lefty = lefty - 5;
    } else if (bally > lefty && lefty >= 100 && lefty <= height-100) {
      lefty = lefty + 5;
    }
  }
  
  //paddle top and bottom
  //Ptimer = Ptimer - 1;
  if (lefty >= height-100) {
    lefty = height-100;
  } else if (righty >= height-100) {
    righty = height-100;
  }
  
  if (lefty <= 100) {
    lefty = 100;
  } else if (righty <= 100) {
    righty = 100;
  } 
  
  //collision
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
  
  if (vy >= -2 && vy <= 2) {
    vy = vy + random(-2,2);
  }
  
  if (vx == 0) {
    vx = vx +1;
  }
  
  //up and down collision
  if (bally < balld/2 || bally > height-balld/2){
  vy = vy*-1;
  wall.rewind();
  wall.play();
  }
  
 
  if (bally > height-50) {
    bally = height-50;
  }
  
  if (bally < 50) {
    bally = 50;
  }
  
   //score
  if (ballx < 0) {
    ballx = width/2;
    bally = height/2;
    timer = 100;
    //score.rewind();
    //score.play();
  }
  
  if (ballx > width) {
    ballx = width/2;
    bally = height/2;
    timer = 100;
    //score.rewind();
    //score.play();
  }
  timer = timer - 1;
  //if (ballx < balld/2 || ballx > width-balld/2) vx = vx*-1;
}

void introClicks() {
  if (mouseX > 150 && mouseX < 350 && mouseY > 400 && mouseY < 480) {
    mode = GAME;
    
    ballx = width/2;
    bally = height/2;
    timer = 100;
    
    AI = true;
    
    rightscore = leftscore = 0;
    
    vx = 5;
    vy = 5;
    
  } else if (mouseX > 450 && mouseX < 650 && mouseY > 400 && mouseY < 480) {
    mode = GAME;
    
    ballx = width/2;
    bally = height/2;
    timer = 100;
    
    AI = false;
    
    rightscore = leftscore = 0;
    
    vx = 5;
    vy = 5;
  }
}
