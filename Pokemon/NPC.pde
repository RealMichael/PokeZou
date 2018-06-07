public class NPC{
  PImage npc;
  PImage[] sprites;
  PImage specialSprite;
  String dialogue;
  float xCor,yCor;
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
     xCor = x;
     yCor = y;
  }
  
  PImage getSprite(int b){
    return sprites[b];
  }
  
  public boolean checkNpc(float x,float y,int direction){
    //0 up, 1 left, 2 down, 3 right
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
  
  void display(PImage s){
    image(s,xCor,yCor);
  }
}
