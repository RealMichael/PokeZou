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
  
  void display(){
    image(sprites[37],xCor,yCor);
  }
}
