//turtlerubbish

void displayTimeBar() {
  noStroke();
  fill(0, 255, 0);
  rect(10, 10, barWidth, 1);
  barWidth --;
}

void turtleRubbish() {
  if (!stage2 && stage1) { 
    stage2music(); 
    stage2 = true;
  }

  imageMode(CORNER);
  image(sea, 0, 0, width, height);
  imageMode(CENTER);
  image(img, imgX, imgY, 100, 100);
  fill(255);
  textSize(17);
  textAlign(LEFT);
  text("Click to put a plastic bag into the sea!", 10, 30);
  text("Click to control the position of plastic bag, and prevent the turtle from tangling with it!", 10, 60);

  displayBall();
  displayImage();
}

void displayImage() {
  // change position after every 200 frames
  if (frameCount % 200 == 0) {
    imgX = random(100, width - 100);
    imgY = random(100, height - 100);
  }



  image(img, imgX, imgY, 100, 100);
}



void displayBall() {
  move();
  for (int i = 0; i < num; i++) {
    image(bag1, bx[i], by[i], ballWidth[i], ballHeight[i]);
  }
}

void move() {
  bounce();
  stickImage();

  // check if hitting image block and wall
  for (int i = 0; i < num; i++) {
    bx[i] += xspeed[i];
    by[i] += yspeed[i];
  }
}

void bounce() {
  //checking whether hitting the wall
  for (int i = 0; i < num; i++) {
    if (bx[i] < ballWidth[i]/2) {
      bx[i] = ballWidth[i]/2;
      xspeed[i] *= -1;
    } else if (bx[i] > width - ballWidth[i]/2) {
      bx[i] = width - ballWidth[i]/2;
      xspeed[i] *= -1;
    }

    if (by[i] < ballHeight[i]/2) {
      by[i] = ballHeight[i]/2;
      yspeed[i] *= -1;
    } else if (by[i] > height - ballHeight[i]/2) {
      by[i] = height - ballHeight[i]/2;
      yspeed[i] *= -1;
    }
  }
}

void stickImage() {
  for (int i = 0; i < num; i++) {
    if (bx[i] + ballWidth[i]/2 >= imgX - 50 && bx[i] + ballWidth[i]/2 <= imgX + 50 && by[i] + ballHeight[i]/2 >= imgY - 50 && by[i] -ballHeight[i]/2 <= imgY + 50) {

      xspeed[i]=0;
      yspeed[i]=0;
    } else if (xspeed[i]==0 && yspeed[i]==0) {

      xspeed[i]=random(1, 5);
      yspeed[i]=random(1, 5);
    }
  }
}