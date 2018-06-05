float yCor = 320;
//float down = 150;
float xCor = 320;
//float left = 300;
Red x;
Pokemons b;
walls[] w = new walls[0];
int direction;
int leftOrRight = 0;
PImage overWorld;
  public void setup(){
    size(768,640);
    overWorld = loadImage("Images/map.png");
  }
  
    public void draw(){
         background(0);
         x = new Red(xCor,yCor);
         pushMatrix();
         translate(width / 2,height / 2);
         scale(2.5);
         translate(x.getX()*-1-(16/2),x.getY()*-1-(16/2));
         image(overWorld,0,0);
         x.display(direction);
         popMatrix();
         fileReading();
    }
    
    void fileReading(){
      String[] o = loadStrings("collision.txt");
      String[] temp = new String[0];
      for (int i = 0;i < o.length;i++){
         temp = split(o[i],",");
         w = (walls[]) append(w, new walls(float(temp[1]) * 16,float(temp[2]) * 16));
      }
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
              yCor -= 16;
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
              yCor += 16;
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
              xCor += 16;
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
              xCor -= 16;
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
  
