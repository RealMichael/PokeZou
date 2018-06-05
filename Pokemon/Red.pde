public class Red{
  float x,y;
  int current;
  PImage[] Sprites;
  PImage test;
  public Red(float x,float y){
    int xNum = 4;
    int yNum = 4;
    int total = xNum * yNum;
    Sprites = new PImage[total];
    PImage spriteSheet = loadImage("Images/sprites.png");
    int spriteWidth = spriteSheet.width / xNum;
    int spriteHeight = spriteSheet.height / yNum;
    int index = 0;
    for (int i = 0;i < xNum;i++){
      for (int c = 0;c < yNum;c++){
        Sprites[index] = spriteSheet.get(c * spriteWidth,i * spriteHeight,spriteWidth,spriteHeight);
        Sprites[index].resize(16,18);
        index++;
      }
    }
    this.x = x;
    this.y = y;
  }
  
  public void setX(int x){
    this.x = x;
  }
  
  public void setY(int y){
    this.y = y;
  }
  
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  public void setCurrent(int n){
    current = n;
  }
  
  public int getCurrent(){
    return current;
  }
  
  public void move(){
  
  }
  
  public void stopMove(){
    
  }
    
  public void display(int d){
    image(Sprites[d],x,y);
    x = round(x);
    y = round(y);
  }
}
