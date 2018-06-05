PImage image;



public void setup(){
  size(800,480);
  image = loadImage("Battlefield2.png");
  background(image);
  rectMode(CENTER);
  rect(400,240,150,75);
     
  fill(0);
textSize(40);
textAlign(CENTER, CENTER); // centre le texte horizontalement et verticalement

  text("BATTLE",400,240,400,200);
  //fill(255);
  //image.resize(800,480);
  surface.setResizable(true);



}
