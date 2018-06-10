float yCor = 320;
//float down = 150;
float xCor = 320;
//float left = 300;
boolean firstEnter;
float exitXCor;
float exitYCor;
Red x;
Pokemons b;
walls[] w = new walls[0];
NPC[] n = new NPC[0];
Grass[] g = new Grass[0];
house[] h = new house[0];
walls[] middleHouseWall = new walls[0];
NPC middleHouseNpc;
house[] middleHouseExit = new house[0];
walls[] topHouseWall = new walls[0];
NPC topHouseNpc;
house[] topHouseExit = new house[0];
boolean isHouseOne = false;
boolean isHouseTwo = false;
boolean isPokeCenter = false;
boolean isConversation;
int direction;
int leftOrRight = 0;
int characterDirection;
boolean isBattle,isInGrass;
// Battle variables
PImage image;
PImage middleHouse; //house 1 txt
PImage topHouse; //house 2 txt
int battleLen = 150;
int battleWid = 75;
int healthRand = ((int)(Math.random() * (500)) + 1000);
int healthRandP = ((int)(Math.random() * (500)) + 1000);
int battleScreenWidth = 480;
int battleScreenLength = 800;
int delayTime;
int counter = 0;
int bossCounter = 0;
boolean battleClicked = false;
boolean battleStart = false;
boolean wildTurn = false;
boolean attacked = false;
boolean wildAttacked = false;
boolean wildDisplay = true;
boolean starterDisplay = true;
boolean runner = false;
boolean isBoss = false;
boolean setHealth = true;
Pokemons starter;
Pokemons wild;
int numb = ((int)(Math.random() * (151)));
String textBox = "Pick A Move For Pikachu To Use!";
String textBox2 = "Click anywhere in this textbox to continue!";
String runFail = "";
// End of battle variables
PImage overWorld;
  public void setup(){
    size(768,640);
    frameRate(120);
    overWorld = loadImage("Images/map.png");
    fileReading();
    image = loadImage("Images/Battlefield2.png");
    middleHouse = loadImage("Images/houseOne.png");
    middleHouse.resize(768,640);
    topHouse = loadImage("Images/houseTwo.png");
    topHouse.resize(768,640);
    starter = new Pokemons(24);
    wild = new Pokemons(numb);
    if(battleStart == false){
      if(isBoss){
        starter.setHealth(8000);
      }
      else{
  starter.setHealth(healthRandP);
      }
  wild.setHealth(healthRand);
  battleStart = true;
}
  }
  
  
    public void draw(){
      x = new Red(xCor,yCor,false);
      if (isHouseOne && firstEnter){
        exitXCor = xCor;
        exitYCor = yCor;
        xCor = 32 * 8;
        yCor = 32 * 16;
        firstEnter = false;
      }
      else if (isHouseTwo && firstEnter){
        exitXCor = xCor;
        exitYCor = yCor;
        xCor = 32 * 11;
        yCor = 32 * 16;
        firstEnter = false;
      }
      if (isBattle){
        if(mousePressed){
      System.out.println(starter.getTable());
      System.out.println("xCor" + mouseX + "   " + "yCor" + mouseY);
  }
 // background(image);
     mClick();
      setup2();
      fill(255);
  
    if(setHealth){
    if(isBoss){
        starter.setHealth(8000);
        setHealth = false;
      }
    }
      
    //}
    //else{
    //  starter.setHealth(8000);
    //}
    if(starterDisplay){
       starter.displayBack(50,250);
       fill(0);
        textSize(20);
        // textAlign(CENTER,CENTER);
        text(starter.getName(),125,230,150,75);
       // starter.setHealth(healthRandP);
       text("Health:" + "  " + starter.getHealth(),125,250,150,75);
    }
    if(wildDisplay){
      wild.display(600,100);
      fill(0);
      textSize(20);
      text(wild.getName(),630,70,150,75);
     // wild.setHealth(healthRand);
      text("Health:" + "  " + wild.getHealth(),630,90,150,75);
    }
      enemy();
      }
      else if (isHouseOne){
        background(0);
        x.setInHouse(true);
        pushMatrix();
        translate(width / 2,height / 2);
        translate(x.getX()*-1-(16/2),x.getY()*-1-(16/2));
        image(middleHouse,0,0);
        x.display(direction);
        middleHouseNpc.displayHouseNpc(1);
        popMatrix();
      }
      else if (isHouseTwo){
        background(0);
        x.setInHouse(true);
        pushMatrix();
        translate(width / 2,height / 2);
        translate(x.getX()*-1-(16/2),x.getY()*-1-(16/2));
        image(topHouse,0,0);
        x.display(direction);
        topHouseNpc.displayHouseNpc(2);
        popMatrix();
      }
        else{
         background(0);
         pushMatrix();
         translate(width / 2,height / 2);
         scale(2.5);
         translate(x.getX()*-1-(16/2),x.getY()*-1-(16/2));
         image(overWorld,0,0);
         x.display(direction);
         npcDisplay();
         inGrass();
         popMatrix();
         rect(0,500,768,200);
         fill(0);
         textSize(32);
         text("word woeoqweoqwoewqoqeoqwoweoqeoweo",10,550);
          fill(0, 102, 153, 204);
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
      String[] grass = loadStrings("grass.txt");
      String[] tempThree = new String[0];
      for (int i = 0;i < grass.length;i++){
        tempThree = split(grass[i],",");
        g = (Grass[]) append(g,new Grass(float(tempThree[1]) * 16,float(tempThree[2]) * 16));
      }
      String[] house = loadStrings("house.txt");
      String[] tempFour = new String[0];
      for (int i = 0;i < house.length;i++){
        tempFour = split(house[i],",");
        h = (house[]) append(h,new house(float(tempFour[1]) * 16,float(tempFour[2]) * 16,i)); 
        // first house is pokecenter,second is the middle house, third is the top most house
        //0 is pokecenter, 1 is middle house, 2 is top most house
      }
      String[] houseOne = loadStrings("houseOne.txt");
      String[] houseTwo = loadStrings("houseTwo.txt");
      String[] tempFive = new String[0];
      String[] tempSix = new String[0];
      for (int i = 0;i < houseOne.length;i++){
        tempFive = split(houseOne[i],",");
        if (tempFive[0].equals("1")){
          middleHouseWall = (walls[]) append(middleHouseWall,new walls(float(tempFive[1]) * 32,float(tempFive[2]) * 32));
        }
        else if (tempFive[0].equals("2")){
          middleHouseNpc = new NPC(float(tempFive[1]) * 32,float(tempFive[2]) * 32);
        }
        else if (tempFive[0].equals("4")){
          middleHouseExit = (house[]) append(middleHouseExit,new house(float(tempFive[1]) * 32,float(tempFive[2]) * 32,1));
        }
      }
      for (int i = 0;i < houseTwo.length;i++){
        tempSix = split(houseTwo[i],",");
        if (tempSix[0].equals("1")){
          topHouseWall = (walls[]) append(topHouseWall,new walls(float(tempSix[1]) * 32,float(tempSix[2]) * 32));
        }
        else if (tempSix[0].equals("2")){
          topHouseNpc = new NPC(float(tempSix[1]) * 32,float(tempSix[2]) * 32);
        }
        else if (tempSix[0].equals("4")){
          topHouseExit = (house[]) append(topHouseExit,new house(float(tempSix[1]) * 32,float(tempSix[2]) * 32,2));
        }
      }
    }
    
    void npcDisplay(){
      PImage p = loadImage("Images/snorlax.png");
      p.resize(32,32);
      for (int i = 0;i < n.length;i++){
        if (i == 1){
          n[i].display(p);
        }
      }
    }
  
  boolean HouseOneCollision(int direction){
    for (int i = 0;i < middleHouseWall.length;i++){
      if (middleHouseWall[i].checkWallHouse(x.getX(),x.getY(),direction)){
        return true;
      }
    }
    if (middleHouseNpc.checkHouseNpc(x.getX(),x.getY(),direction)){
      return true;
    }
    for (int c = 0;c < middleHouseExit.length;c++){
      if (middleHouseExit[c].isHouse(x.getX(),x.getY(),0)){
        return true;
      }
    }
    return false;
  }
  
  boolean HouseTwoCollision(int direction){
    for (int i = 0;i < topHouseWall.length;i++){
      if (topHouseWall[i].checkWallHouse(x.getX(),x.getY(),direction)){
        return true;
      }
    }
    if (topHouseNpc.checkHouseNpc(x.getX(),x.getY(),direction)){
      return true;
    }
    for (int c = 0;c < topHouseExit.length;c++){
      if (topHouseExit[c].isHouse(x.getX(),x.getY(),0)){
        return true;
      }
    }
    return false;
  }

  boolean collisionWalls(int direction){
    for (int i = 0;i < w.length;i ++){
      if (w[i].checkWall(x.getX(),x.getY(),direction)){
        return true;
      }
    }
    return false;
  }
  
  boolean isHouse(){
    for (int i = 0;i < h.length;i ++){
      if (h[i].isHouse(x.getX(),x.getY(),2)){
        return true;
      }
    }
    return false;
  }
  
  boolean isExit(){
    if (isHouseOne){
      for (int i = 0;i < middleHouseExit.length;i++){
        if (middleHouseExit[i].isExit(x.getX(),x.getY(),0)){
          return true;
        }
      }
    }
    else if (isHouseTwo){
      for (int i = 0;i < topHouseExit.length;i++){
        if ((topHouseExit[i].isExit(x.getX(),x.getY(),0))){
          return true;
        }
      }
    }
    return false;
  }
  
  int returnHouseNum(){
    for (int i = 0;i < h.length;i ++){
      if (h[i].isHouse(x.getX(),x.getY(),2)){
        return i;
      }
    }
    return -1;
   }
  
  boolean collisionNPC(int direction){
    for (int i = 0;i < n.length;i++){
      if (n[i].checkNpc(x.getX(),x.getY(),direction)){
        return true;
      }
    }
    return false;
  }
  
  boolean collisionBossNPC(int direction){
    if (topHouseNpc.checkHouseNpc(x.getX(),x.getY(),direction)){
     return true;
    }
    return false;
  }
  
  void inGrass(){
   for (int i = 0;i < g.length;i++){
     if(g[i].checkGrass(x.getX(),x.getY())){
       isInGrass = true;
       return;
     }
   }
   isInGrass = false;
  }
  
  void keyPressed(){
    if (key == 'b'){
      isBattle = true;
      isBoss = true;
    }
    if (isBattle){
    }
    else {
      if (key == 'x'){
        if (isHouse() && characterDirection == 2 && returnHouseNum() == 1){
          isHouseOne = true;
          firstEnter = true;
        }
        else if (isHouseOne && characterDirection == 0 && isExit()){
          isHouseOne = false;
          xCor = exitXCor;
          yCor = exitYCor;
        }
        else if(isHouse() && characterDirection == 2 && returnHouseNum() == 2){
          isHouseTwo = true;
          firstEnter = true;
        }
        else if (isHouseTwo && characterDirection == 0 && isExit()){
          isHouseTwo = false;
          xCor = exitXCor;
          yCor = exitYCor;
        }
        else if (isHouseTwo && (collisionBossNPC(0) || collisionBossNPC(1) || collisionBossNPC(2) || collisionBossNPC(3))){
          isBattle = true;
          isBoss = true;
        }
      }
          if(keyCode == UP){
            if(!isHouseOne && !isHouseTwo){
            if (!collisionWalls(2) && !collisionNPC(2)){
            int r = (int)(Math.random() * 100);
            if (isInGrass && r < 10){
              isBattle = true;
            }
            else{
              if (leftOrRight == 0){
                direction = 13;
                leftOrRight = 1;
              }
              else {
                direction = 15;
                leftOrRight = 0;
              }
              yCor -= 16;
              characterDirection = 2;
            }
            }
            characterDirection = 2;
            }
            else if (isHouseOne){
              if (!HouseOneCollision(2)){
                if (leftOrRight == 0){
                direction = 13;
                leftOrRight = 1;
              }
              else {
                direction = 15;
                leftOrRight = 0;
              }
              yCor -= 32;
              }
              characterDirection = 2;
            }
            else if (isHouseTwo){
              if (!HouseTwoCollision(2)){
                if (leftOrRight == 0){
                direction = 13;
                leftOrRight = 1;
              }
              else {
                direction = 15;
                leftOrRight = 0;
              }
              yCor -= 32;
              }
              characterDirection = 2;
            }
            else {
              characterDirection = 2;
            }
          }
          else if(keyCode == DOWN){
            if(!isHouseOne && !isHouseTwo){
            if(!collisionWalls(0) && !collisionNPC(0)){
            int r = (int)(Math.random() * 100);
            if (isInGrass && r < 10){
              isBattle = true;
            }
            else{
              if (leftOrRight == 0){
                direction = 1;
                leftOrRight = 1;
              }
              else {
                direction = 3;
                leftOrRight = 0;
               
              }
                yCor += 16;
                characterDirection = 0;
            }
            }
            characterDirection = 0;
            }
            else if (isHouseOne){
              if (!HouseOneCollision(0)){
                 if (leftOrRight == 0){
                direction = 1;
                leftOrRight = 1;
              }
              else {
                direction = 3;
                leftOrRight = 0;
              }
                yCor += 32;
              }
              characterDirection = 0;
              }
            else if (isHouseTwo){
              if (!HouseTwoCollision(0)){
                 if (leftOrRight == 0){
                direction = 1;
                leftOrRight = 1;
              }
              else {
                direction = 3;
                leftOrRight = 0;
              }
                yCor += 32;
              }
              characterDirection = 0;
              }
            else {
              characterDirection = 0;
            }
          }
          else if(keyCode == RIGHT ){
            if (!isHouseOne && !isHouseTwo){
            if (!collisionWalls(3) && !collisionNPC(3)){
            int r = (int)(Math.random() * 100);
            if (isInGrass && r < 10){
              isBattle = true;
            }
            else {
              if (leftOrRight == 0){
                direction = 9;
                leftOrRight = 1;
                
              }
              else {
                direction = 11;
                leftOrRight = 0;
               
              }
                xCor += 16;
                characterDirection = 3;
            }
            }
            characterDirection = 3;
            }
            else if (isHouseOne){
              if (!HouseOneCollision(3)){
                if (leftOrRight == 0){
                direction = 9;
                leftOrRight = 1; 
              }
              else {
                direction = 11;
                leftOrRight = 0;
              }
                xCor += 32;
                characterDirection = 3;
              }
              }
            else if (isHouseTwo){
              if (!HouseTwoCollision(3)){
                if (leftOrRight == 0){
                direction = 9;
                leftOrRight = 1; 
              }
              else {
                direction = 11;
                leftOrRight = 0;
              }
                xCor += 32;
                characterDirection = 3;
              }
            }
            else {
              characterDirection = 3;
            }
          }
          else if(keyCode == LEFT){
            if (!isHouseOne && !isHouseTwo){
            if(!collisionWalls(1) && !collisionNPC(1)){
            int r = (int)(Math.random() * 100);
            if (isInGrass && r < 10){
              isBattle = true;
            }
            else {
              if (leftOrRight == 0){
                direction = 5;
                leftOrRight = 1;
              }
              else {
                direction = 7;
                leftOrRight = 0;
              }
                xCor -= 16;
                characterDirection = 1;
            }
          }
          characterDirection = 1;
            }
          else if (isHouseOne){
            if (!HouseOneCollision(1)){
              if (leftOrRight == 0){
                direction = 5;
                leftOrRight = 1;
              }
              else {
                direction = 7;
                leftOrRight = 0;
              }
                xCor -= 32;
                characterDirection = 1;
            }
          }
          else if (isHouseTwo){
            if (!HouseTwoCollision(1)){
              if (leftOrRight == 0){
                direction = 5;
                leftOrRight = 1;
              }
              else {
                direction = 7;
                leftOrRight = 0;
              }
                xCor -= 32;
                characterDirection = 1;
            }
          }
          else {
              characterDirection = 1;
            }
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
  
  
    
  
  
  public void battleReset(){
    int numb = ((int)(Math.random() * (151)));
    starter = new Pokemons(24);
    wild = new Pokemons(numb);
    starterDisplay = true;
    wildDisplay = true;
    textBox = "Pick A Move For Pikachu To Use!";
    attacked = false;
    battleClicked = false;
    bossCounter = 0;
    setHealth = true;
    
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
  
  if(isBoss == false){
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
      rect(400,440,680,50);
      fill(0);
      textSize(20);
      text(runFail + textBox,400,430,750,50);
      //delay(delayTime);
      //delayTime = 0;
      
       fill(0);
      textSize(10);
      text(textBox2,400,450,400,50);
      winLose();
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
  //delay(1000);
  String result = "";
  int dmg2 = 0;
  runner = false;
  if(wildTurn){
    if(starter.getType().equals(wild.getEffect())){
              dmg2 = ((int)(Math.random() * (200)) + 400);
             result = "It's super effective!";
           }
           else if(wild.getType().equals(starter.getEffect())){
            dmg2 = ((int)(Math.random() * (200)) + 200);
             result = "It's not very effective!";
           }
           else{
            dmg2 = ((int)(Math.random() * (200)) + 300);
           result = "";
           }
   // int dmg2 = ((int)(Math.random() * (200)) + 300); 
    //delay(1000);
    // textBox = wild.getName() + " used " + wild.getMove() + " and did " + dmg2 + " damage!" +" " + "result";
     if(starter.getHealth() - dmg2 <= 0){
              starter.setHealth(0);
            }
            else{
            starter.setHealth(starter.getHealth() - dmg2);
            }
            wildAttacked = true;
            //wildTurn = false;
            if(wildAttacked == true){
             if(mousePressed){
              if(mOver(400,440,680,50)){
             wildTurn = false;
             attacked = false;
            textBox = wild.getName() + " used " + wild.getMove() + " and did " + dmg2 + " damage!" + " " + result;
            textBox2 = "Pick A Move For Pikachu To Use!";
         }
            }
            }
  }
  
  //wildTurn = false;
}
public boolean exitBattle(){
   // int counter = 0;
   
    return counter >= 2;
}
    
  public void winLose(){
  if(wild.getHealth() <= 0){
    if(isBoss){
    if(bossCounter < 5){
      numb = ((int)(Math.random() * (151)));
    wild = new Pokemons(numb);
    bossCounter ++;
    }
    else{
      fill(0);
    textSize(60);
    text("VICTORIOUS!",400,200,400,75);
    textSize(20);
    text("Click anywhere on the screen to continue",400,250,400,75);
    wildDisplay = false;
    wildAttacked = true;
    attacked = true;
    wildTurn = false;
    isBoss = false;
    setHealth = true;
    
    if(mousePressed){
      if(mouseX >= 0 && mouseX <= 768){
        counter ++;
      }
    }
    if(exitBattle()){
      isBattle = false;
      counter = 0;
      battleReset();
    }
      
      
      
      
    }
    }
    else{
    fill(0);
    textSize(60);
    text("VICTORIOUS!",400,200,400,75);
    textSize(20);
    text("Click anywhere on the screen to continue",400,250,400,75);
    wildDisplay = false;
    wildAttacked = true;
    attacked = true;
    wildTurn = false;
   isBoss = false;
    if(mousePressed){
      if(mouseX >= 0 && mouseX <= 768){
        counter ++;
      }
    }
    if(exitBattle()){
      isBattle = false;
      counter = 0;
      battleReset();
    }
  //    battleReset();
    //delay(1000);
    //isBattle = false;
    //if(mousePressed){
    //  if(mouseX >= 0 && mouseX <= 768){
    //    isBattle = false;
    //  }
    //}
  }
  }
  else if(starter.getHealth() <= 0){
    fill(0);
     textSize(60);
     text("DEFEAT!",400,200,400,75);
     textSize(20);
     text("Click anywhere on the screen to continue",400,250,400,75);
     starterDisplay = false;
     wildAttacked = true;
     attacked = true;
     wildTurn = false;
    isBoss = false;
    setHealth = true;
      if(mousePressed){
      if(mouseX >= 0 && mouseX <= 768){
        counter ++;
      }
    }
    if(exitBattle()){
      isBattle = false;
      counter = 0;
      battleReset();
    }
     //delay(1000);
    // isBattle = false;
    //if(mousePressed){
    //  if(mouseX >= 0 && mouseX <= 768){
    //    isBattle = false;
    //  }
    //}
   // battleReset();
  }
  //battleReset();
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
    if(mOver(400,300,100,40)){
      int rand = ((int)(Math.random() * (100)));
      //if(runner = false){
      if(rand < 50){
        isBattle = false;
        battleReset();
        
      //  runner = true;
        
      }
      else{
        battleClicked = true;
        runFail = "You could not run away! ";
      }
     // else{
      //  battleClicked = true;
     // }
      
  
  }
  }
  }
  
  if(wildTurn == false){
  if(battleClicked == true){
      if(mousePressed){
         if(attacked == false){
         if(mOver(330,315,100,50)){
           runFail = "";
           int dmg = 0;
           if(wild.getType().equals(starter.getEffect())){
             dmg = ((int)(Math.random() * (200)) + 400);
             textBox = "Pikachu used Thunder and did" + " " + dmg + " " + "damage.  It's super effective!";
             
           }
           else if(starter.getType().equals(wild.getEffect())){
              dmg = ((int)(Math.random() * (200)) + 200);
             textBox = "Pikachu used Thunder and did" + " " + dmg + " " + "damage.  It's not very effective!";
             
           }
           else{
            dmg = ((int)(Math.random() * (200)) + 300);
            textBox = "Pikachu used Thunder and did" + " " + dmg + " " + "damage!";
           }
         
          //  delay(1000);
         //  delayTime = 1000;
         // del = true;
            if(wild.getHealth() - dmg <= 0){
              wild.setHealth(0);
            }
            else{
            wild.setHealth(wild.getHealth() - dmg);
            }
         attacked = true;
        delay(300);
        textBox2 = "Click anywhere in this textbox to continue!";
        //wildTurn = true;
         }
           if(mOver(470,315,100,50)){
             runFail = "";
             int dmg = 0;
           if(wild.getType().equals(starter.getEffect())){
              dmg = ((int)(Math.random() * (200)) + 400);
             textBox = "Pikachu used Rage and did" + " " + dmg + " " + "damage.  It's super effective!";
           }
           else if(starter.getType().equals(wild.getEffect())){
            dmg = ((int)(Math.random() * (200)) + 200);
             textBox = "Pikachu used Rage and did" + " " + dmg + " " + "damage.  It's not very effective!";
           }
           else{
            dmg = ((int)(Math.random() * (200)) + 300);
            textBox = "Pikachu used Rage and did" + " " + dmg + " " + "damage!";
           }
           delayTime = 1000;
           if(wild.getHealth() - dmg <= 0){
              wild.setHealth(0);
            }
            else{
            wild.setHealth(wild.getHealth() - dmg);
            }
            attacked = true;
            delay(300);
            textBox2 = "Click anywhere in this textbox to continue!";
           // wildTurn = true;
         }
          
           if(mOver(330,385,100,50)){
             runFail = "";
           int dmg = ((int)(Math.random() * (200)) + 300);
           textBox = "Pikachu used Recover and gained" + " " + "400" + " " + "health!";
           delayTime = 1000;
           if(starter.getHealth() + 400 >= healthRandP){
             starter.setHealth(healthRandP);
           }
           else{
             starter.setHealth(starter.getHealth() + 400);
           }
           attacked = true;
           delay(300);
           textBox2 = "Click anywhere in this textbox to continue!";
           // wildTurn = true;
           }
           
           if(mOver(470,385,100,50)){
             runFail = "";
             int dmg = 0;
           if(wild.getType().equals(starter.getEffect())){
             dmg = ((int)(Math.random() * (200)) + 400);
             textBox = "Pikachu used Tackle and did" + " " + dmg + " " + "damage.  It's super effective!";
           }
           else if(starter.getType().equals(wild.getEffect())){
              dmg = ((int)(Math.random() * (200)) + 200);
             textBox = "Pikachu used Tackle and did" + " " + dmg + " " + "damage.  It's not very effective!";
           }
           else{
            dmg = ((int)(Math.random() * (200)) + 300);
            textBox = "Pikachu used Tackle and did" + " " + dmg + " " + "damage!";
           }
           delayTime = 1000;
           if(wild.getHealth() - dmg <= 0){
              wild.setHealth(0);
            }
            else{
            wild.setHealth(wild.getHealth() - dmg);
            }
            attacked = true;
            delay(300);
            textBox2 = "Click anywhere in this textbox to continue!";
           }
           
         //  battleClicked = false;
         //attacked = true;
        }
      }
      }
      if(attacked == true){
            if(mousePressed){
              if(mOver(400,440,680,50)){
             wildTurn = true;
         }
            }
            }
  }
  }

  
