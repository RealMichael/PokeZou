public class walls{
  float xCor,yCor;
  
  public walls(float x,float y){
    xCor = x;
    yCor = y;
  }
  
  public boolean checkWall(float x,float y,int direction){
    //0 up, 1 left, 2 down, 3 right
    if (direction == 0){
      if (y == (yCor + 16) && x == xCor){
        return true;
      }
      return false;
    }
    else if (direction == 1){
      if (y == yCor ** x 
    }
  }
}
