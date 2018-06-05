PImage image;
int battleLen = 150;
int battleWid = 75;
int width = 480;
int length = 800;

public void setup(){
  size(800,480);
  image = loadImage("Battlefield2.png");
  background(image);
  rectMode(CENTER);
  rect(400,240,150,75);
  //rect(400,203.5,200,200);     
  fill(0);
textSize(40);
textAlign(CENTER, CENTER); // centre le texte horizontalement et verticalement

  text("BATTLE",400,240,battleLen,battleWid);
  //fill(255);
  //image.resize(800,480);
  surface.setResizable(true);
  //mClick();
}

public void mClick(){
  if(mouseX >= (length / 2) - (battleLen / 2) && mouseX < (length / 2) - (battleLen / 2) + battleLen && mouseY >= (width / 2) - (battleWid / 2) && mouseY <  (width / 2) - (battleWid / 2) + battleWid){
      fill(200);
  }
  if(mousePressed){
    if(mouseX >= (length / 2) - (battleLen / 2) && mouseX < (length / 2) - (battleLen / 2) + battleLen && mouseY >= (width / 2) - (battleWid / 2) && mouseY <  (width / 2) - (battleWid / 2) + battleWid){
        rect(20,20,20,20);
      }
  }
}

public void draw(){
 // background(image);
    setup();
    fill(255);
  mClick();
}
  
  
  
  
  
  
  
  
