float yCor = 320;
//float down = 150;
float xCor = 320;
//float left = 300;
Red x;
Pokemons b;
walls[] w = new walls[0];
NPC[] n = new NPC[0];
int direction;
int leftOrRight = 0;
boolean isBattle;
// Battle variables
PImage image;
int battleLen = 150;
int battleWid = 75;
int healthRand = ((int)(Math.random() * (500)) + 1000);
int healthRandP = ((int)(Math.random() * (500)) + 1000);
int battleScreenWidth = 480;
int battleScreenLength = 800;
int delayTime;
boolean battleClicked = false;
boolean battleStart = false;
boolean wildTurn = false;
Pokemons starter;
Pokemons wild;
int numb = ((int)(Math.random() * (151)));
String textBox = "Pick A Move For Pikachu To Use!";
// End of battle variables
PImage overWorld;
  public void setup(){
    size(768,640);
    frameRate(120);
    overWorld = loadImage("Images/map.png");
    fileReading();
    image = loadImage("Images/Battlefield2.png");
    starter = new Pokemons(24);
    wild = new Pokemons(numb);
    if(battleStart == false){
  starter.setHealth(healthRandP);
  wild.setHealth(healthRand);
  battleStart = true;
}
  }
  
    public void draw(){
      if (isBattle){
        if(mousePressed){
      System.out.println(starter.getTable());
      System.out.println("xCor" + mouseX + "   " + "yCor" + mouseY);
  }
 // background(image);
     mClick();
      setup2();
      fill(255);
  
  
       starter.displayBack(100,300);
       fill(0);
        textSize(20);
        // textAlign(CENTER,CENTER);
        text(starter.getName(),125,375,150,75);
       // starter.setHealth(healthRandP);
       text("Health:" + "  " + starter.getHealth(),125,395,150,75);
 
      wild.display(600,100);
      fill(0);
      textSize(20);
      text(wild.getName(),630,70,150,75);
     // wild.setHealth(healthRand);
      text("Health:" + "  " + wild.getHealth(),630,90,150,75);
      enemy();
      }
      else{
         background(0);
         x = new Red(xCor,yCor);
         pushMatrix();
         translate(width / 2,height / 2);
         scale(2.5);
         translate(x.getX()*-1-(16/2),x.getY()*-1-(16/2));
         image(overWorld,0,0);
         x.display(direction);
         npcDisplay();
         popMatrix();
      }
    }
    
    void fileReading(){
      String[] o = loadStrings("collision.txt");
      String[] temp = new String[0];
      for (int i = 0;i < o.length;i++){
         temp = split(o[i],",");
         w = (walls[]) append(w, new walls(float(temp[1]) * 16,float(temp[2]) * 16));
      }
      String[] NPC = loadStrings("npc.txt");
      String[] tempTwo = new String[0];
      for (int i = 0;i < NPC.length;i++){
        tempTwo = split(NPC[i],",");
        n = (NPC[]) append(n,new NPC(float(tempTwo[1]) * 16,float(tempTwo[2]) * 16));
      }
    }
    
    void npcDisplay(){
      PImage p = loadImage("Images/snorlax.png");
      p.resize(16,20);
      for (int i = 0;i < n.length;i++){
        n[i].display(p);
      }
    }

  boolean collisionWalls(int direction){
    for (int i = 0;i < w.length;i ++){
      if (w[i].checkWall(x.getX(),x.getY(),direction)){
        return true;
      }
    }
    return false;
  }
  
  void keyPressed(){
    if (key == 'b'){
      isBattle = true;
    }
    if (isBattle){
    }
    else {
          if(keyCode == UP && !collisionWalls(2)){
            if (leftOrRight == 0){
              direction = 13;
              leftOrRight = 1;
            }
            else {
              direction = 15;
              leftOrRight = 0;
            }
              yCor -= 16;
          }
          else if(keyCode == DOWN && !collisionWalls(0)){
            if (leftOrRight == 0){
              direction = 1;
              leftOrRight = 1;
            }
            else {
              direction = 3;
              leftOrRight = 0;
            }
              yCor += 16;
          }
          else if(keyCode == RIGHT && !collisionWalls(3)){
            if (leftOrRight == 0){
              direction = 9;
              leftOrRight = 1;
            }
            else {
              direction = 11;
              leftOrRight = 0;
            }
              xCor += 16;
          }
          else if(keyCode == LEFT && !collisionWalls(1)){
            if (leftOrRight == 0){
              direction = 5;
              leftOrRight = 1;
            }
            else {
              direction = 7;
              leftOrRight = 0;
            }
              xCor -= 16;
          }
    }
  }
  
  void keyReleased(){
    if (isBattle){
    }
    else {
          if(keyCode == UP){
              direction = 12;
          }
          if(keyCode == DOWN){
              direction = 0;
          }
          if(keyCode == RIGHT){
              direction = 8;
          }
          if(keyCode == LEFT){
              direction = 4;
          }
    }
  }
  
  public void setup2(){
//x.resize(200,200);
  //x.displayBack(200,200);
  //surface.setResizable(true);
  image = loadImage("Images/Battlefield2.png");
  image.resize(768,640);
  background(image);
 
   if(battleClicked == false){
  rectMode(CENTER);
  if(mouseX >= (battleScreenLength / 2) - (battleLen / 2) && mouseX < (battleScreenLength / 2) - (battleLen / 2) + battleLen && mouseY >= (battleScreenWidth / 2) - (battleWid / 2) && mouseY <  (battleScreenWidth / 2) - (battleWid / 2) + battleWid){
      
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
      
      fill(255);
      //rectMode(CENTER);
      rect(400,440,350,35);
      fill(0);
      textSize(15);
      text(textBox,400,440,350,35);
      delay(delayTime);
      delayTime = 0;
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
    
public void enemy(){
  int dmg2 = ((int)(Math.random() * (200)) + 300); 
  if(wildTurn){
     textBox = wild.getName() + " used " + wild.getMove() + " and did " + dmg2 + " damage!";
     if(starter.getHealth() - dmg2 <= 0){
              starter.setHealth(0);
            }
            else{
            starter.setHealth(starter.getHealth() - dmg2);
            }
            
  }
  
  wildTurn = false;
}
  

public void mClick(){
  
  //BATTLE BUTTON
  if(battleClicked == false){
  if(mouseX >= (battleScreenLength / 2) - (battleLen / 2) && mouseX < (battleScreenLength / 2) - (battleLen / 2) + battleLen && mouseY >= (battleScreenWidth / 2) - (battleWid / 2) && mouseY <  (battleScreenWidth / 2) - (battleWid / 2) + battleWid){
      fill(100);
  }
  }
  if(battleClicked == false){
  if(mousePressed){
    if(mouseX >= (battleScreenLength / 2) - (battleLen / 2) && mouseX < (battleScreenLength / 2) - (battleLen / 2) + battleLen && mouseY >= (battleScreenWidth / 2) - (battleWid / 2) && mouseY <  (battleScreenWidth / 2) - (battleWid / 2) + battleWid){
                battleClicked = true;
      }
  }
  }
  if(wildTurn == false){
  if(battleClicked == true){
      if(mousePressed){
         if(mOver(330,315,100,50)){
           int dmg = ((int)(Math.random() * (200)) + 300);
            textBox = "Pikachu used Thunder and did" + " " + dmg + " " + "damage!";
           delayTime = 1000;
            if(wild.getHealth() - dmg <= 0){
              wild.setHealth(0);
            }
            else{
            wild.setHealth(wild.getHealth() - dmg);
            }
            wildTurn = true;
         }
           if(mOver(470,315,100,50)){
           int dmg = ((int)(Math.random() * (200)) + 300);
           textBox = "Pikachu used Rage and did" + " " + dmg + " " + "damage!";
           delayTime = 1000;
           if(wild.getHealth() - dmg <= 0){
              wild.setHealth(0);
            }
            else{
            wild.setHealth(wild.getHealth() - dmg);
            }
            wildTurn = true;
         }
           
           if(mOver(330,385,100,50)){
           int dmg = ((int)(Math.random() * (200)) + 300);
           textBox = "Pikachu used Recover and gained" + " " + "400" + " " + "health!";
           delayTime = 1000;
           if(starter.getHealth() + 400 >= healthRandP){
             starter.setHealth(healthRandP);
           }
           else{
             starter.setHealth(starter.getHealth() + 400);
           }
            wildTurn = true;
           }
           
           if(mOver(470,385,100,50)){
           int dmg = ((int)(Math.random() * (200)) + 300);
           textBox = "Pikachu used Tackle and did" + " " + dmg + " " + "damage!";
           delayTime = 1000;
           if(wild.getHealth() - dmg <= 0){
              wild.setHealth(0);
            }
            else{
            wild.setHealth(wild.getHealth() - dmg);
            }
             wildTurn = true;
         }
           
         //  battleClicked = false;
         }
      }
}
}
  
  