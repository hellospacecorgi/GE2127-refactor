  // sticky image
        PImage img;
        PImage sea;
        PImage bag1;

        PImage[] bag =new PImage[1];
        

        float imgX; // x-center of block
        float imgY; // y-center of block

        int num=100;


        // ball
        float[] bx = new float[num]; // x position
        float[] by = new float[num]; // y position

        float[] xspeed =new float[num]; // speed in x direction
        float[] yspeed =new float[num]; // speed in y direction
        float[] radius =new float[num];
        float[] ballWidth =new float[num];
        float[] ballHeight =new float[num];

        void setup() {
            img = loadImage("turtlehappy.png");

            sea = loadImage("sea.png");
            bag1 = loadImage("plasticbagno.png");

         
           frameRate(100);
           
            // size of image block
            size(800, 500);

             //position of bird
            imgX = width / 2;
            imgY = height / 2;
          for (int i=0; i<num; i++){
            //// position of first ball
            //bx[i] = random(width);
            //by[i] = random(height);
            
 
            //xspeed[i] = random(0,10);
            //yspeed[i] = random(0,10);
            //radius[i] = random(10,20);
            //ballWidth[0] = 50;
            //ballHeight[0] = 50;
}
        }

        void draw() {
            imageMode(CORNER);
            image(sea,0,0,width,height);
            imageMode(CENTER);
            image(img,imgX,imgY, 100, 100);
            textSize(17);
            text("Click to put a plastic bag into the sea!", 10,30);
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
                image(bag1,bx[i],by[i],ballWidth[i], ballHeight[i]);
           
                
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
                } else if(xspeed[i]==0 && yspeed[i]==0){
                  xspeed[i]=random(1,5);
                  yspeed[i]=random(1,5);
                }
            }
}

          void mousePressed() {
    
             
            bx[bx.length-1] = mouseX;
            by[by.length-1] = mouseY;
            //radius[radius.length-1] = 1;
            xspeed[xspeed.length-1] = 1;
            yspeed[yspeed.length-1] = 1;
            ballHeight[ballHeight.length-1] = 50;
            ballWidth[ballWidth.length-1] = 50;
            
      }