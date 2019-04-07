class Module {
  constructor( x, y, modColor){
    this.x = x;
    this.y = y;
    this.modColor=modColor;
  }
  // Custom method for drawing the object
   mouseClick() {    
   if (mouseX >= this.x && mouseX <= this.x+100 && 
      mouseY >= this.y && mouseY <= this.y+100) {
   if (overKnight && mouseIsPressed && (mouseButton == LEFT)) {
     storX=this.x;
      storY=this.y; 
    if(bool_mouseReleased == true) {this.modColor=200;} 
         } 
      }
   }
  update() {
   fill(this.modColor);
    rect(this.x, this.y, unitSize, unitSize); 
  }
}
//  //  //  // 
let bool_mouseReleased=false;
let storX=0, storY=0;

let knightX=0, knightY=0;
let knightSize = 100;
let overKnight = false;
let locked = false;
let xOffset = 0.0,yOffset = 0.0; 
let unit = 100; // -> width / unit;
let unitSize=100; 
let count;
         
let mods = [];

function setup () {
   createCanvas(500, 500);
   rectMode(CORNER);
 stroke(100);
 
 let wideCount = width / unit;
  let highCount = height / unit;
  count = wideCount * highCount;
    let index = 0;
  for (let y = 0; y < highCount; y++) {
    for (let x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit,20);
    }
  }
}
function draw() {
  background(0);
 for (let i = 0; i < count; i++) {
    mods[i].mouseClick();
    mods[i].update();    
   }
 // //  //  //  //
 // Test if the cursor is over the box 
  if (mouseX > knightX && mouseX < knightX+knightSize && 
      mouseY > knightY && mouseY < knightY+knightSize) {
    overKnight = true;  
  } else {    overKnight = false;  }
  //draw mod 1x1
  fill(200);
  rect(0,0,100,100);
 //draw the Knnifht
 rect(knightX, knightY, knightSize, knightSize);
  fill(50);
   ellipse(knightX+50, knightY+50,20,20);
}
//  //  //  //  //  //  //  //
 function mousePressed() {
  if(overKnight) { 
    locked = true; 
    } else {
    locked = false;
  }
  xOffset = mouseX-knightX; 
  yOffset = mouseY-knightY; 
}
 function mouseDragged() {
  bool_mouseReleased=false;
  if(locked) {
    knightX = mouseX-xOffset; 
    knightY = mouseY-yOffset; 
  }
}
function mouseReleased() {
  bool_mouseReleased=true;
  locked = false;
  knightX = storX;
  knightY=storY;
}
