float yCor = 150;
//float down = 150;
float xCor = 300;
//float left = 300;
  public void setup(){
    size(600,300);

  }
  
    public void draw(){
         background(255);
           rect(xCor,yCor,40,10);
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
  
      
  
  