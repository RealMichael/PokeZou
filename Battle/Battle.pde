PImage image;
int battleLen = 150;
int battleWid = 75;
int width = 480;
int length = 800;
boolean battleClicked = false;

public void setup(){
  surface.setResizable(true);
  size(800,480);
  image = loadImage("Battlefield2.png");
  background(image);
   if(battleClicked == false){
  rectMode(CENTER);
  rect(400,240,150,75);
  //rect(400,203.5,200,200);     
  fill(0);
 
textSize(40);
textAlign(CENTER, CENTER); // centre le texte horizontalement et verticalement

  text("BATTLE",400,240,battleLen,battleWid);
  }
  else if(battleClicked == true){
      rect(330,315,100,50);
      textSize(20);
      text("Thunder",330,315,100,50);
      rect(470,315,100,50);
      rect(330,385,100,50);
      rect(470,385,100,50);
      fill(255);
  }
}
  
  
  

public void mClick(){
  
  //BATTLE BUTTON
  if(battleClicked == false){
  if(mouseX >= (length / 2) - (battleLen / 2) && mouseX < (length / 2) - (battleLen / 2) + battleLen && mouseY >= (width / 2) - (battleWid / 2) && mouseY <  (width / 2) - (battleWid / 2) + battleWid){
      fill(200);
  }
  }
  if(battleClicked == false){
  if(mousePressed){
    if(mouseX >= (length / 2) - (battleLen / 2) && mouseX < (length / 2) - (battleLen / 2) + battleLen && mouseY >= (width / 2) - (battleWid / 2) && mouseY <  (width / 2) - (battleWid / 2) + battleWid){
                battleClicked = true;
      }
  }
  }
}

public void draw(){
 // background(image);
    setup();
    fill(255);
  mClick();
}
  
  
  
  
  
  
  
  
