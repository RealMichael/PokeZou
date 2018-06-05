
public class Pokemons{
  PImage[] back;
  PImage[] front;
  int current,indexNum,health,damage;
  String[] moves;
  String type;
  String name;
  Table table = loadTable("pokedex.csv");
  
  //ArrayList<String[]> data = new ArrayList<String[]>();
  //String splitter = ",";
  //Scanner sc = new Scanner("pokedex.csv");
  
  public Pokemons(int num){
    health = 1000;
    int widthNum = 16;
    int heightNum = 10;
    int total = widthNum * heightNum;
    indexNum = num;
    back = new PImage[total];
    front = new PImage[total];
    type = table.getString(num,1);
    name = table.getString(num,0);
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
  
  public String getTable(){
     return table.getString(150,0);
     
  }
  public int getHealth(){
      return health;
  }
  public void setHealth(int he){
    health = he;
  }
  public String getType(){
    return type;
  }
   
  public String getName(){
    return name;
  }
   
 /* public void resize(int x, int y){
    image.resize(x,y);
  }
  */
  public void displayBack(int x,int y){
   // image.resize(700,400);
    image(back[indexNum],x,y);
   // image.resize(400,400);
  }
  
  public void display(int x,int y){
    image(front[indexNum],x,y);  //only use numbers from 0-150,151-160 is just blank pic
  }
}
