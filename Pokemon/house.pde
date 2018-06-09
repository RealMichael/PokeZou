public class house{
  float xCor,yCor;
  int houseNum;
  public house(float x,float y,int number){
    xCor = x;
    yCor = y;
    houseNum = number;
  }
  
  public int getHouseNum(){
    return houseNum;
  }
  
  public boolean isHouse(float x,float y,int direction){
    //2 up, 1 left, 0 down, 3 right
    if (direction == 2){
      if (y == (yCor + 16) && xCor == x){
        return true;
      }
      return false;
    }
    return false;
  }
  
  public boolean isExit(float x,float y,int direction){
    if (direction == 0){
      if (yCor == (y + 32) && xCor == x){
        return true;
      }
      return false;
    }
    return false;
  }
}
