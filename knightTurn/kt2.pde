// притягивание коня к центру
// объявляем bool_mouseReleased; storX; storY;

boolean bool_mouseReleased;
float storX;
float storY;

float bx;
float by;
// size of canvas 600*600
int edgeOfCanvas=600;
int boxSize = 100;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
int unit = 100; // -> width / unit;
int unitSize=100; 
int count;
         
Module[] mods;

void setup() {
size(600, 600);
 bx = 0;
  by = 0;
  rectMode(CORNER);
//       //       //       //
 stroke(100);
 
 int wideCount = edgeOfCanvas / unit;
  int highCount = edgeOfCanvas / unit;
  count = wideCount * highCount;
  mods = new Module[count];
  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit);
    }
  }
}
void draw() {
  background(0);
  //     //       //       //
  for (Module mod : mods) {
    mod.mouseClick();
     mod.update();
  }
 //      //       //       //
 // Test if the cursor is over the box 
 fill(200);
  if (mouseX > bx && mouseX < bx+boxSize && 
      mouseY > by && mouseY < by+boxSize) {
    overBox = true;  
  } else {
     overBox = false;  
        }
 fill(255);
  rect(0,0,100,100);
 
  rect(bx, by, boxSize, boxSize);
  fill(50);
  ellipse(bx+50,by+50,20,20);
 }
//       //       //       //
//           Class         //              
//       //       //       //
class Module {
  int xO;
  int yO;
 int modColor=0;
  // Contructor
  Module(int xOT, int yOT){
    xO = xOT;
    yO = yOT;
  }
  // Custom method for drawing the object
  void mouseClick() {
   if (mouseX >= xO && mouseX <= xO+100 && 
      mouseY >= yO && mouseY <= yO+100) {
   if (overBox && mousePressed && (mouseButton == LEFT)) {
    storX=xO;
    storY=yO; 
    if(bool_mouseReleased ) {modColor=255;} 
            } 
       }
  }
 void update() {
  fill(modColor);
  rect(xO, yO, unitSize, unitSize); 
   }
}
//       //       //       //
//       //       //       //
void mousePressed() {
  if(overBox) { 
    locked = true; 
   
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}
void mouseDragged() {
  if(locked) {
    bool_mouseReleased=false;
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
  }
}
void mouseReleased() {
  bool_mouseReleased=true;
  locked = false;
  bx=storX;
  by=storY;
}
