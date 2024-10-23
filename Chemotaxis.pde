int speed = 2; // speed variable which will be used by buttons (under border) to increase or decrease speed

class Snake{
 int myX, myY, myColor; 
 Snake(int x, int y){
 myX = x;
 myY = y;
 myColor = color((int)(Math.random()*255), 
                 (int)(Math.random()*255), 
                 (int)(Math.random()*255));
 }
 
 void slither(){
  myX = myX + (int)(Math.random()*speed);
 }
 
 void show(){
   noStroke();
  fill(myColor);
  ellipse(myX,myY,50,50);
  fill(0);
  ellipse(myX+10,myY-10,10,10);
  ellipse(myX-10,myY-10,10,10);
  fill(255,0,0);
 }
 
} //end of Snake class

Snake [] reptiles;

void setup(){
  size(700,500);
  
  
  //creation of buttons
  fill(0);
 textSize(30);
 text("Use these buttons to increase/decrease their speed!",25,400);
 fill(0,255,0);
 rect(100,425,50,50);
 fill(255,0,0);
 rect(500,425,50,50);
 
 //creation of border 
 fill(0);
  rect(0,360,700,5);
  
  
  //Creation of finishline
  for(int y = 0; y < 360; y+=40)
 {
  for(int x = 540; x < 600; x+= 60)
  {
    finishline1 bob = new finishline1(x,y);
    bob.show();
  }
 }
 for(int y = 20; y < 360; y+=40)
 {
  for(int x = 540; x < 600; x+= 60)
  {
    finishline2 sue = new finishline2(x,y);
    sue.show();
  }
 }
 
 // Creation of snakes
 
 reptiles = new Snake[5]; //first call to new
 for(int i = 0; i < reptiles.length; i++){
  reptiles[i] = new Snake(0,i*75+25);
 }
}

void draw(){
  for(int i = 0; i < reptiles.length; i++){
 reptiles[i].slither();
 reptiles[i].show();
 if (reptiles[i].myX > 600) {
      println("Snake " + (i+1) + " has won!");
      textSize(20);
      fill(0);
      text(("Snake " + (i+1) + " has won!"), 0, 700);
      noLoop();
  }
 }
}

void mousePressed(){
  //increase button
if (mouseX > 100 && mouseX < 150 && mouseY > 425 && mouseY < 475) {
    speed++;
  }
  
  //decrease button
  if (mouseX > 500 && mouseX < 550 && mouseY > 425 && mouseY < 475) {
    speed--;
    
    //make sure speed cannot be negative
    if (speed < 0) {
      speed = 0;
    }
  }
  loop();
}


class finishline1
{
  int myX, myY;
  finishline1(int x, int y){
   myX = x;
   myY = y;
  }
  void show(){
   noStroke();
   fill(0);
   rect(myX,myY,60,20);
   fill(255);
   rect(myX+20,myY,20,20);
  }
}//end of finishline1

class finishline2
{
  int myX, myY;
  finishline2(int x, int y){
   myX = x;
   myY = y;
  }
  void show(){
   noStroke();
   fill(255);
   rect(myX,myY,60,20);
   fill(0);
   rect(myX+20,myY,20,20);
  }
}//end of finishline2
