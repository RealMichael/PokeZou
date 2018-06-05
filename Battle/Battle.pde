PImage image;
int battleLen = 150;
int battleWid = 75;
int healthRand = ((int)(Math.random() * (500)) + 1000);
int healthRandP = ((int)(Math.random() * (500)) + 1000);
int width = 480;
int length = 800;
boolean battleClicked = false;
Pokemons starter;
Pokemons wild;
int numb = ((int)(Math.random() * (151)));
//= new Pokemons(0);

public void setup(){
starter = new Pokemons(24);
wild = new Pokemons(numb);
//x.resize(200,200);
  //x.displayBack(200,200);
  //surface.setResizable(true);
  size(800,480);
  image = loadImage("Battlefield2.png");
  background(image);
 
   if(battleClicked == false){
  rectMode(CENTER);
  if(mouseX >= (length / 2) - (battleLen / 2) && mouseX < (length / 2) - (battleLen / 2) + battleLen && mouseY >= (width / 2) - (battleWid / 2) && mouseY <  (width / 2) - (battleWid / 2) + battleWid){
      
  fill(200);
  }
  else{
    fill(255);
  }
  rect(400,240,150,75);
  fill(0);
  textSize(40);
  textAlign(CENTER,CENTER);
  text("BATTLE",400,240,150,75);
  
  
  if(mOver(400,300,100,40)){
      fill(200);
  }
  else{
  fill(255);
  }
  rect(400,300,100,40);
  fill(0);
  textSize(20);
  text("RUN",400,300,100,40);
 }
 
  else if(battleClicked == true){
    if(mOver(330,315,100,50)){
      fill(200);
    }
    else{
      fill(255);
    }
      rect(330,315,100,50);
      fill(0);
      textSize(20);
      text("Thunder",330,315,100,50);
      
     
      if(mOver(470,315,100,50)){
      fill(200);
    }
    else{
      fill(255);
    }
      rect(470,315,100,50);
      fill(0);
      textSize(20);
      text("Rage",470,315,100,50);
      
      
      if(mOver(330,385,100,50)){
      fill(200);
    }
    else{
      fill(255);
    }
      rect(330,385,100,50);
      fill(0);
      textSize(20);
      text("Recover",330,385,100,50);
      
      
      if(mOver(470,385,100,50)){
      fill(200);
    }
    else{
      fill(255);
    }
      rect(470,385,100,50);
      fill(0);
      textSize(20);
      text("Tackle",470,385,100,50);
      
  }
  
}
  
public boolean mOver(int xCor,int yCor,int length,int width){
  //MOUSE OVER
  if(mouseX >= xCor - (length / 2 ) && mouseX < xCor - (length / 2) + length && mouseY >= yCor - (width / 2) && mouseY < yCor - (width / 2) + width){
    return true;
  }
  else{
    return false;
  }
}
    


public void mClick(){
  
  //BATTLE BUTTON
  if(battleClicked == false){
  if(mouseX >= (length / 2) - (battleLen / 2) && mouseX < (length / 2) - (battleLen / 2) + battleLen && mouseY >= (width / 2) - (battleWid / 2) && mouseY <  (width / 2) - (battleWid / 2) + battleWid){
      fill(100);
  }
  }
  if(battleClicked == false){
  if(mousePressed){
    if(mouseX >= (length / 2) - (battleLen / 2) && mouseX < (length / 2) - (battleLen / 2) + battleLen && mouseY >= (width / 2) - (battleWid / 2) && mouseY <  (width / 2) - (battleWid / 2) + battleWid){
                battleClicked = true;
      }
  }
  }
  
  if(battleClicked == true){
      if(mousePressed){
         if(mOver(330,315,100,50) || mOver(470,315,100,50) || mOver(330,385,100,50) || mOver(470,385,100,50)){
           battleClicked = false;
         }
      }
}
}
public void draw(){
  if(mousePressed){
    System.out.println(starter.getTable());
      System.out.println("xCor" + mouseX + "   " + "yCor" + mouseY);
  }
 // background(image);
    setup();
    fill(255);
  mClick();
 starter.displayBack(100,400);
 fill(0);
  textSize(20);
 // textAlign(CENTER,CENTER);
  text(starter.getName(),125,375,150,75);
  starter.setHealth(healthRandP);
  text("Health:" + "  " + starter.getHealth(),125,395,150,75);
 
 
  wild.display(600,100);
  fill(0);
  textSize(20);
  text(wild.getName(),630,70,150,75);
  wild.setHealth(healthRand);
  text("Health:" + "  " + wild.getHealth(),630,90,150,75);
}
  
  
  
  
  
  
  
  
