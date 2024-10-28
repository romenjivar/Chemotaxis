int pressure = 13;

class Walker{
  //two member vars
  int myX, myY, myColor;
  
  //3 member functions
  //one special one: Constructor
  //Will initialize member variables
  Walker(){
   myX = 350;
   myY = 500;
   myColor = color(255,255,255);
  }
  Walker(int x, int y){ //overloading a constructor
  myX = 350;
  myY = 500;
  myColor = color((int)(Math.random()*255), 
                  (int)(Math.random()*255), 
                  (int)(Math.random()*255));
  }
 void walk(){
 myX = myX + (int)(Math.random()*pressure)-(pressure/2);
 myY = myY + (int)(Math.random()*pressure)-(pressure/2); 
 if(pressure <= 50){
 if (myX < 100) {
        myX = 100;
    } else if (myX > 600) {
        myX = 600;
    }
    
    if (myY < 200) {
        myY = 200;
    } else if (myY > 800) {
        myY = 800;
    }
 }
}
 void show(){
   fill(myColor);
 ellipse(myX,myY,10,10);
 }
  
}// end of Walker class

Walker [] ohio;
void setup(){
 size(1000,1000); 

 ohio = new Walker[150]; //first call to new
 for(int i =0; i < ohio.length; i++){
  ohio[i] = new Walker((int)(Math.random()*width), (int)(Math.random()*height)); //second call to new
 }
 //WITH ARRAY OF OBJECTS THERE ARE 2+ CALLS TO NEW
}

/* void increaseButton(){
  int buttonColor = color(255,255,255);
  stroke(1);
  fill(buttonColor);
 rect(800,550,100,100,10); 
 fill(0);
 textSize(15);
 text("Increase",825,600);
}
void decreaseButton(){
  int buttonColor = color(255,255,255);
 stroke(1);
 fill(buttonColor);
 rect(800,675,100,100,10);
 fill(0);
 textSize(15);
 text("Decrease",825,725);
}*/

void increaseButton() {
  int buttonColor = color(255, 255, 255);
  float buttonCenterX = 850;
  float buttonCenterY = 600;
  float buttonWidth = 100;
  float buttonHeight = 100;
  
  // Calculate distance to center of the button
  float d = dist(mouseX, mouseY, buttonCenterX, buttonCenterY);
  // Check if distance is within half the width and height of the button
  if (d < buttonWidth / 2 && d < buttonHeight / 2) {
    buttonColor = color(0, 255, 0); // Green when hovered
  }
  fill(buttonColor);
  stroke(1);
  rect(buttonCenterX - buttonWidth / 2, buttonCenterY - buttonHeight / 2, buttonWidth, buttonHeight, 10);
  fill(0);
  textSize(15);
  text("Increase", 825, 600);
}

void decreaseButton() {
  int buttonColor = color(255, 255, 255);
  float buttonCenterX = 850;
  float buttonCenterY = 725;
  float buttonWidth = 100;
  float buttonHeight = 100;
  
  // Calculate distance to center of the button
  float d = dist(mouseX, mouseY, buttonCenterX, buttonCenterY);
  // Check if distance is within half the width and height of the button
  if (d < buttonWidth / 2 && d < buttonHeight / 2) {
    buttonColor = color(255, 0, 0); // Red when hovered
  }
  fill(buttonColor);
  stroke(1);
  rect(buttonCenterX - buttonWidth / 2, buttonCenterY - buttonHeight / 2, buttonWidth, buttonHeight, 10);
  fill(0);
  textSize(15);
  text("Decrease", 825, 725);
}

void mousePressed() {
  // Check if the mouse is within the increase button 
  float dIncrease = dist(mouseX, mouseY, 850, 600);
  if (dIncrease < 50) { // half of the button's width or height
    pressure += 2; 
  }
  
  // Check if the mouse is within the decrease button
  float dDecrease = dist(mouseX, mouseY, 850, 725);
  if (dDecrease < 50) { // half of the button's width or height
    pressure -= 2;
    if (pressure < 1) pressure = 1;
  }
}

void draw(){
  background(0);
  //container
  if(pressure <= 50){
  fill(#6FE8FF);
  rect(100,200,500,600,10);
  }
  //thermometer or pressure counter
  fill(255);
  rect(750,200,200,600,10);
  //buttons to regulate pressure
  increaseButton();
  decreaseButton();
  fill(255);
  textSize(30);
  text(("Pressure:" + (pressure - 1)) ,775,190);

  if(pressure == 1){
    fill(255);
    textSize(50);
   text("Absolute Zero", 200, 190); 
  }
  
  if(pressure > 50){
   fill(255);
   textSize(50);
   text("Pressure too high!", 200,190);
  }
  
  noStroke();
  for(int i = 0; i < ohio.length; i++){
   ohio[i].walk();
   ohio[i].show();   
  }
  
} 
