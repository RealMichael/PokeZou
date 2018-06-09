public class Red{
  //2 up, 1 left, 0 down, 3 right
  int direction;
  float x,y;
  int current;
  PImage[] Sprites;
  PImage test;
  boolean inHouse;
  public Red(float x,float y,boolean inHouse){
    int xNum = 4;
    int yNum = 4;
    int total = xNum * yNum;
    this.inHouse = inHouse;
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
  
  public void setInHouse(boolean b){
    inHouse = b;
  }
  
  public void setX(int x){
    this.x = x;
  }
  
  public void setY(int y){
    this.y = y;
  }
  
  public void setDirection(int d){
    direction = d;
  }
  
  public int getDirection(){
    return direction;
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
        if (inHouse){
      Sprites[d].resize(48,48);
      image(Sprites[d],x,y);
      x = round(x);
      y = round(y);
    }
    else {
    image(Sprites[d],x,y);
    x = round(x);
    y = round(y);
  }
  }
}
