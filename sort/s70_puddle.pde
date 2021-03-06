int moduleSize = 6;
// paddle
int paddleX= 30;
int incPaddle=1;

 int vTemp;

//button
int buttonX=25, buttonY=325; 
int buttonSize = 50;     
boolean boolButton = false;

//int unit = 40;
int count;
Module[] mods;

void setup() {
  size(400, 400);
  mods = new Module[moduleSize];
   mods[0] = new Module(1*30,  100);
   mods[1] = new Module(2*30,  50);
   mods[2] = new Module(3*30,  30);
   mods[3] = new Module(4*30,  60);
   mods[4] = new Module(5*30,  20);
   mods[5] = new Module(6*30,  40);
  }

void draw() { 
  background(10);
     buttonUpdate();  
  for (Module mod : mods) {  mod.display();  }
  
   // paddle
  rect (paddleX, 85, 20, 5);
  paddleX = incPaddle*30;
  // draw button
  fill(50);
  rect(buttonX,buttonY,buttonSize,buttonSize);
   if(boolButton && mousePressed)  
  { 
    fill(200);
    rect(buttonX,buttonY,buttonSize,buttonSize);
   } 
//println(boolButton); 
//println(inc);
}


class Module {
 int xOffset; 
  int rectHight;
  
// Contructor
   Module(int xOffsetTemp, int rectHightTemp) {
    xOffset = xOffsetTemp;  
    rectHight=rectHightTemp;
  }  
  
  //void update() {  }  
 
  // Custom method for drawing the object
  void display() {
    fill(255);
     rect(xOffset , 100, 20, rectHight);
   }
}

// button
void mouseReleased() {
//void mousePressed() { 
 if(boolButton)
  {
   incPaddle++;
  }   
 }
 
 void mousePressed() {
 //void mouseReleased() {
 if(boolButton)
 {
 if(incPaddle>5) incPaddle=1;  
  if(mods[incPaddle].rectHight < mods[incPaddle-1].rectHight)  
    {     
     vTemp= mods[incPaddle-1].rectHight;
     mods[incPaddle-1].rectHight=mods[incPaddle].rectHight;
     mods[incPaddle].rectHight=vTemp;
    }
  }
  print(incPaddle-1);
   print(" ");
   print(incPaddle);
   println();
}

 void buttonUpdate() {
  if ( overButton(buttonX, buttonY, buttonSize, buttonSize)  ) {
    boolButton = true;
  } else {
   boolButton = false;
  }
}
boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
} 
