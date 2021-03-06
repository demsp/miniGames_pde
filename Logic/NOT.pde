Spot sp1,sp2;
int Grey = 155;
int White = 255;
boolean locked = false;

void setup() {
size(640, 360);
  background(204);
 // noLoop();
  sp1 = new Spot();
  sp2 = new Spot(width*0.7, height*0.5, 80);
  rectMode(RADIUS);  
}

void draw() { 
  sp1.display1();
  sp2.display2();
}

 void mousePressed() {
if (mouseX > sp1.dx-sp1.boxSize && mouseX < sp1.dx+sp1.boxSize && 
mouseY > sp1.dy-sp1.boxSize && mouseY < sp1.dy+sp1.boxSize) {

if(!locked){    locked = true;}
else {    locked = false;}
    }
  }

class Spot {
  float dx, dy, boxSize;
    // First version of the Spot constructor;
   Spot() {
   boxSize = 80;
   dx = width*0.25;
   dy = height*0.5;
   }
   // Second version of the Spot constructor;
     Spot(float xpos, float ypos, float r ) {
    dx = xpos;
    dy = ypos;
    boxSize = r;
  }
 
 void display1() {
  fill(Grey);
  if(locked){
  fill(White);
   }
     rect(dx, dy, boxSize, boxSize);
     }
 void display2() {
  fill(White);
  if(locked){
  fill(Grey);
   }
     rect(dx, dy, boxSize, boxSize);
     }    
}
