public class NPC{
  PImage npc;
  PImage[] sprites;
  PImage specialSprite;
  String dialogue;
  float xCor,yCor;
  PImage[] giovani;
  PImage[] doctor;
  public NPC(float x,float y){
    int widthNum = 7;
    int heightNum = 6;
    int total = widthNum * heightNum;
    sprites = new PImage[total];
    PImage npcs = loadImage("Images/npc.png");
    int spriteWidth = npcs.width / widthNum; 
    int spriteHeight = npcs.height / heightNum;
    int index = 0;
    for (int i = 0;i < heightNum;i++){
      for (int c = 0;c < widthNum;c++){
          sprites[index] = npcs.get(c * spriteWidth,i * spriteHeight,spriteWidth,spriteHeight);
          sprites[index].resize(16,16);
          index++;
      }    
    }
    giovani = new PImage[16];
    doctor = new PImage[12];
    PImage gBoi = loadImage("Images/giovani.png");
    int gWidth = gBoi.width / 4;
    int gHeight = gBoi.height / 4;
    int b = 0;
    for (int i = 0; i < 4;i++){
      for (int c = 0; c < 4;c++){
        giovani[b] = gBoi.get(c * gWidth,i * gHeight,gWidth,gHeight);
        giovani[b].resize(80,64);
        b++;
      }
    }
    PImage dBoi = loadImage("Images/doctor.png");
    int dWidth = dBoi.width / 12;
    int dHeight = dBoi.height / 1;
    int d = 0;
    for (int i = 0;i < 1;i++){
      for (int c = 0;c < 12;c++){
        doctor[d] = dBoi.get(c * dWidth,i * dHeight,dWidth,dHeight);
        doctor[d].resize(50,50);
        d++;
      }
    }
     xCor = x;
     yCor = y;
  }
  
  PImage getSprite(int b){
    return sprites[b];
  }
  
  public boolean checkHouseNpc(float x,float y,int direction){
    //2 up, 1 left, 0 down, 3 right
    if (direction == 0){
      if (yCor == (y + 32) && x == xCor){
        return true;
      }
      return false;
    }
    else if (direction == 1){
      if (y == yCor && x == (xCor + 32)){
        return true;
      }
      return false;
    }
    else if (direction == 2){
      if (y == (yCor + 32) && xCor == x){
        return true;
      }
      return false;
    }
    else if (direction == 3){
      if (xCor == (x + 32) && yCor == y){
        return true;
      }
      return false;
    }
    return false;
  }
  
  public boolean checkNpc(float x,float y,int direction){
    //2 up, 1 left, 0 down, 3 right
    if (direction == 0){
      if (yCor == (y + 16) && x == xCor){
        return true;
      }
      return false;
    }
    else if (direction == 1){
      if (y == yCor && x == (xCor + 16)){
        return true;
      }
      return false;
    }
    else if (direction == 2){
      if (y == (yCor + 16) && xCor == x){
        return true;
      }
      return false;
    }
    else if (direction == 3){
      if (xCor == (x + 16) && yCor == y){
        return true;
      }
      return false;
    }
    return false;
  }
  
  void displayHouseNpc(int b){
    if (b == 2){
      image(giovani[0],xCor,yCor);
    }
    else if (b == 1){
      image(doctor[0],xCor,yCor);
    }
  }
  
  void display(PImage s){
    image(s,xCor,yCor);
  }
}
