public class Grass{
  float xCor,yCor;
  public Grass(float x,float y){
    xCor = x;
    yCor = y;
  }
  
  public boolean checkGrass(float x,float y){
    if (xCor == x && yCor == y){
      return true;
    }
    else {
      return false;
    }
  }
}
