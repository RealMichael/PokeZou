public class Pokemons{
  PImage[] back;
  PImage[] front;
  int current,indexNum,health;
  String[] moves;
  String type;
  public Pokemons(int num){
    int widthNum = 16;
    int heightNum = 10;
    int total = widthNum * heightNum;
    indexNum = num;
    back = new PImage[total];
    front = new PImage[total];
    PImage frontSprite = loadImage("Images/front.png");
    PImage backSprite = loadImage("Images/back.png");
    int spriteWidth = frontSprite.width / widthNum; //front and back sprites have same width and height
    int spriteHeight = frontSprite.height / heightNum;
    int index = 0;
    for (int i = 0;i < heightNum;i++){
      for (int c = 0;c < widthNum;c++){
          front[index] = frontSprite.get(c * spriteWidth,i * spriteHeight,spriteWidth,spriteHeight);
          back[index] = backSprite.get(c * spriteWidth,i * spriteHeight,spriteWidth,spriteHeight);
          index++;
      }    
    }  
  }
  
  public int getIndexNum(){
    return indexNum;
  }
  
  public void displayBack(int x,int y){
    image(back[indexNum],x,y);
  }
  
  public void display(int x,int y){
    image(front[indexNum],x,y);  //only use numbers from 0-150,151-160 is just blank pic
  }
}
