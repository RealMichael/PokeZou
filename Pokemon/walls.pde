public class walls{
  float xCor,yCor;
  
  public walls(float x,float y){
    xCor = x;
    yCor = y;
  }
  
  public boolean checkWall(float x,float y,int direction){
    //2 up, 1 left, 0 down, 3 right
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
}
