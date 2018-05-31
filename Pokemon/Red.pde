public class Red{
  PImage front,back,left,right;
  float x,y;
  public Red(float x,float y){
    front = loadImage("Images/Red.png");
    this.x = x;
    this.y = y;
  }
  
  public void display(){
    image(front,x,y);
  }
}