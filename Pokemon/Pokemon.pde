float yCor = 150;
//float down = 150;
float xCor = 300;
//float left = 300;
Red x;
Pokemons b;
int direction;
int leftOrRight = 0;
  public void setup(){
    size(600,300);
  }
  
    public void draw(){
         background(255);
         x = new Red(xCor,yCor);
         b = new Pokemons(10);
         b.display();
         x.display(direction);
    }

  void keyPressed(){
          if(keyCode == UP){
            if (leftOrRight == 0){
              direction = 13;
              leftOrRight = 1;
            }
            else {
              direction = 15;
              leftOrRight = 0;
            }
              yCor -= 10;
          }
          if(keyCode == DOWN){
            if (leftOrRight == 0){
              direction = 1;
              leftOrRight = 1;
            }
            else {
              direction = 3;
              leftOrRight = 0;
            }
              yCor += 10;
          }
          if(keyCode == RIGHT){
            if (leftOrRight == 0){
              direction = 9;
              leftOrRight = 1;
            }
            else {
              direction = 11;
              leftOrRight = 0;
            }
              xCor += 10;
          }
          if(keyCode == LEFT){
            if (leftOrRight == 0){
              direction = 5;
              leftOrRight = 1;
            }
            else {
              direction = 7;
              leftOrRight = 0;
            }
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
  
