//hatchegg

void hatchegg() {
  if (menu && !stage1) { 
    stage1music(); 
    stage1 = true;
  }
  drawbeach();
  imageMode(CENTER);
  image(turtle, 400, 350, 100, 100);

  drawegg();
  howtohatch();
}

void howtohatch() {
  if (mouseX > 345 && mouseX < 450 && mouseY > 285 && mouseY < 420) {
    title = createFont("AppleSDGothicNeo-Heavy-48.vlw", 48);
    textFont(title);
    textAlign(CENTER, CENTER);
    colorMode(HSB, 360, 100, 100);
    fill(233, 92, 73);
    textSize(60);
    text("What's This?", width/2, height/10);
    textSize(40);
    text("Press UP to hatch the egg!", width/2, height/10 +50);
  }
}

void drawegg() {
  image(eggup, eggupX, eggupY, 110, 130);
  image(eggdown, 400, eggdownY, 110, 130);
}

void  keyPressed() {  
  if (key == CODED) {
    if (keyCode == UP) {
      eggupY = eggupY - 20;
    }
    if (eggupY < 200) { 
      hatched = true;
    }
    if (keyCode == DOWN) {
      eggupY +=20;
    }  
    if (keyCode == RIGHT) {
      x1 = x1 +10;
    }
  }
}

void drawbeach() {
  colorMode(HSB, 360, 100, 100);
  background(184, 17, 93); //sky
  fill(186, 73, 73);//ocean
  noStroke();
  rect(0, height/3, width, height/4);

  fill(47, 21, 95);//sand beach
  noStroke();
  beginShape();
  vertex(0, 253);
  vertex(160, 230);
  vertex(570, 270);
  vertex(800, 300);
  vertex(800, 500);
  vertex(0, 500);
  endShape(CLOSE);

  fill(55, 36, 92); // sand shadow
  noStroke();
  beginShape();
  vertex(0, 340);
  vertex(111, 418);
  vertex(225, 460);
  vertex(356, 500);
  vertex(0, 500);
  endShape(CLOSE);
  beginShape();
  vertex(800, 247);
  vertex(544, 269);
  vertex(800, 305);
  endShape(CLOSE);



  fill(34, 83, 79); //coconut tree

  beginShape();
  vertex(800, 383);
  vertex(794, 380);
  vertex(790, 383);
  vertex(780, 377);
  vertex(720, 380);
  curveVertex(720, 380);
  curveVertex(770, 260);
  curveVertex(770, 140);
  curveVertex(800, 140);
  vertex(800, 144);
  endShape(CLOSE);


  fill(63, 72, 95); 
  ellipse(780, 140, 60, 60);

  fill(105, 75, 80);
  // fill(84,69,83); //leaves
  beginShape();
  vertex(800, 40); 
  curveVertex(800, 40);
  curveVertex(778, 30);
  curveVertex(756, 20);
  curveVertex(735, 10);
  vertex(735, 12);
  curveVertex(735, 12); 
  curveVertex(692, 36);
  curveVertex(641, 82);
  curveVertex(600, 157);
  vertex(600, 157);
  vertex(636, 123);
  vertex(688, 100); 
  vertex(714, 86);
  vertex(715, 64);
  vertex(730, 80);
  vertex(737, 66);
  vertex(742, 62);
  vertex(750, 75);
  vertex(776, 70); 
  vertex(755, 80); 
  vertex(735, 95); 
  vertex(713, 142); 
  vertex(705, 170);
  vertex(740, 144); 
  vertex(775, 130); 
  vertex(800, 115);

  endShape(CLOSE);


  fill(105, 80, 75);
  //fill(84,68,76); //leaves shadow
  beginShape(); 
  vertex(800, 115);  
  vertex(762, 132); 
  vertex(734, 145); 
  vertex(705, 170);
  vertex(715, 145); 
  vertex(725, 130); 
  vertex(750, 120); 
  vertex(765, 105); 
  vertex(780, 80);
  vertex(780, 72); 
  vertex(778, 66); 
  vertex(750, 73); 
  vertex(740, 60); 
  vertex(736, 66);
  vertex(734, 77); 
  vertex(732, 85); 
  vertex(725, 77); 
  vertex(713, 64); 
  vertex(711, 87); 
  vertex(687, 100);
  vertex(657, 112);  
  vertex(630, 128); 
  vertex(611, 142); 
  vertex(601, 160); 
  vertex(613, 127);
  vertex(634, 107); 
  vertex(660, 88); 
  vertex(685, 70); 
  vertex(712, 60); 
  vertex(730, 50);
  vertex(760, 45); 
  vertex(787, 55); 
  vertex(800, 65);
  endShape(CLOSE);

  // image(tree, 690, 130, 200,200); //for tracing
}

//cut01
void cut1() {
  sky();
  sand();
  wave();
  shadow();
  bubble();
  speech();
  stop01();
}
void sky() {
  colorMode(HSB, 360, 100, 100);
  background(186, 73, 73); 
  fill(184, 17, 93);
  noStroke();
  beginShape();
  curveVertex(0, 0);
  curveVertex(0, 0);
  curveVertex(0, 172);
  curveVertex(0, 172);
  curveVertex(105, 135);
  curveVertex(228, 108);
  curveVertex(370, 94);
  curveVertex(528, 100);
  curveVertex(666, 121);
  curveVertex(800, 147);
  curveVertex(800, 147);
  curveVertex(800, 0);
  curveVertex(0, 0);
  endShape();
}

void sand() {
  //sand
  fill(47, 21, 95);//sand beach
  noStroke();
  beginShape();
  curveVertex(0, 333);
  curveVertex(0, 333);
  curveVertex(28, 321);
  curveVertex(48, 289);
  curveVertex(78, 271);
  curveVertex(120, 254);
  curveVertex(161, 257);
  curveVertex(214, 229);
  curveVertex(277, 198);
  curveVertex(326, 193);
  curveVertex(379, 204);
  curveVertex(389, 215);
  curveVertex(428, 219);
  curveVertex(438, 224);
  curveVertex(493, 218);
  curveVertex(540, 209);
  curveVertex(597, 213);
  curveVertex(644, 237);
  curveVertex(680, 262);
  curveVertex(705, 273);
  curveVertex(720, 287);
  curveVertex(762, 318);
  curveVertex(777, 338);
  curveVertex(800, 345);
  curveVertex(800, 500);
  curveVertex(0, 500);
  curveVertex(0, 333);
  endShape();
}

void wave() {
  //wave
  fill(190, 18, 100, 100);//sand beach
  noStroke();
  beginShape();
  curveVertex(0, 333);
  curveVertex(0, 333);
  curveVertex(28, 321);
  curveVertex(48, 289);
  curveVertex(78, 271);
  curveVertex(120, 254);
  curveVertex(161, 257);
  curveVertex(214, 229);
  curveVertex(277, 198);
  curveVertex(326, 193);
  curveVertex(379, 204);
  curveVertex(389, 215);
  curveVertex(428, 219);
  curveVertex(438, 224);
  curveVertex(493, 218);
  curveVertex(540, 209);
  curveVertex(597, 213);
  curveVertex(644, 237);
  curveVertex(680, 262);
  curveVertex(705, 273);
  curveVertex(720, 287);
  curveVertex(762, 318);
  curveVertex(777, 338);
  curveVertex(800, 345);
  curveVertex(800, 409);
  curveVertex(759, 384);
  curveVertex(740, 330);
  curveVertex(713, 332);
  curveVertex(642, 332);
  curveVertex(595, 299);
  curveVertex(520, 258);
  curveVertex(443, 259);
  curveVertex(345, 285);
  curveVertex(287, 311);
  curveVertex(188, 291);
  curveVertex(122, 311);
  curveVertex(58, 365);
  curveVertex(0, 389);
  curveVertex(0, 333);
  endShape();
}


void shadow() {
  fill(55, 36, 92); // sand shadow
  noStroke();
  beginShape();
  curveVertex(154, 500);
  curveVertex(154, 500);
  curveVertex(218, 439);
  curveVertex(318, 399);
  curveVertex(440, 388);
  curveVertex(543, 404);
  curveVertex(626, 448);
  curveVertex(693, 500);
  curveVertex(693, 500);
  curveVertex(154, 500);
  endShape();
  image(cutTurtle, width/2, 400, 250, 250 );
}