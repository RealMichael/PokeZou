float yCor = 150;
//float down = 150;
float xCor = 300;
//float left = 300;
Red x;
int leftOrRight;
  public void setup(){
    size(600,300);
  }
  
    public void draw(){
         background(255);
         x = new Red(xCor,yCor);
         x.display(direction);
    }

  void keyPressed(){
          if(keyCode == UP){
              direction = 13;
              yCor -= 10;
          }
          if(keyCode == DOWN){
              direction = 1;
              yCor += 10;
          }
          if(keyCode == RIGHT){
              direction = 9;
              xCor += 10;
          }
          if(keyCode == LEFT){
              direction = 5;
              xCor -= 10;
          }
  }
  
  void keyReleased(){
          if(keyCode == UP){
              direction = 12;
          }
          if(keyCode == DOWN){
              direction = 0;
          }
          if(keyCode == RIGHT){
              direction = 8;
          }
          if(keyCode == LEFT){
              direction = 4;
          }
  }
  
