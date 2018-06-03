float yCor = 150;
//float down = 150;
float xCor = 300;
//float left = 300;
final int spritesX = 4;
final int spritesY = 4;
final int totalSprite = spritesX * spritesY;
int currentSprite = 0;
PImage[] Sprites;
Red x;
  public void setup(){
    size(600,300);
    Sprites = new PImage[totalSprite];
    PImage spriteSheet = loadImage("Images/sprites.png");
    int spriteWidth = spriteSheet.width / spritesX;
    int spriteHeight = spriteSheet.height / spritesY;
    int index = 0;
    for (int i = 0;i < spritesX;i++){
      for (int c = 0;c < spritesY;c++){
        Sprites[index] = spriteSheet.get(c * spriteWidth,i * spriteHeight,spriteWidth,spriteHeight);
      }
    }
  }
  
    public void draw(){
         background(255);
         image(Sprites[currentSprite],0,0);
    }

  void keyPressed(){
      if(key == CODED){
          if(keyCode == UP){
              yCor -= 10;
          }
          if(keyCode == DOWN){
              yCor += 10;
          }
          if(keyCode == RIGHT){
              xCor += 10;
          }
          if(keyCode == LEFT){
              xCor -= 10;
          }
      }
  }
  
