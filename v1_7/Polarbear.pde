//poler bear

void polarBear() {
  if (!stage3 && stage2) { 
    stage3music(); 
    stage3 = true;
  }
  imageMode(CORNER);
  image(bg, 0, 0, 800, 500);

  drawBear(); 
  bearMove();
  iceBurgMove();
  lose();
}

void drawBear() {

  // iceberg
  image(iceburg, x2, 50, 800, 500);
  // bear
  image(polar_bear, x1, y1, 213, 120);
  //instructions
  //fill(0,0,0,wordTrans);
  //textSize(16);
  //text("The iceberg is melting! QUICK!", 20, 150);
  //text("Don't let the bear fall into the water!", 20, 200);
  //text("Press spacebar to make the bear move!", 20, 250);
}

void iceBurgMove() {
  x2 += speed2;
}

void bearMove() {
  if (keyPressed && key==' ') {
    wordTrans = 0;
    if (x1+25>x2-80) {
      x1 +=1.3;
    } else {
      x1 += 0;
    }
  }
}