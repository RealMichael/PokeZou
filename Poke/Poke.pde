float yCor = 150;
float xCor = 300;
float xCorWild = 400;
float yCorWild = 200;
boolean move = true;
int videoScale = 8;

// Number of columns and rows in our system
int cols, rows;

  public void setup(){
   size(600,600);
     cols = width/videoScale;
  rows = height/videoScale;
   //float grid = 50;
   //float width = 600;
   //float height = 300;
   //for (int i = 0; i < width; i+=grid) {
   //   line (i, 0, i, height);
   //   }
   //for (int i = 0; i < height; i+=grid) {
   //   line (0, i, width, i);
   // }
  }// 
    

  
  
  public void wildPokemon(){
      if(yCor == 0 && xCor == 0 || xCor == 0){
          background(200);
          rect(xCorWild,yCorWild,40,40);
          move = false;
      }
  }
  
  
    public void draw(){
          setup();
        // background(255);
         rect(xCor,yCor,40,10);
         wildPokemon();
          for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {

      // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale;
      int y = j*videoScale;
      fill(255);
      stroke(0);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      rect(x, y, videoScale, videoScale);
    }
  }
}
    

  void keyPressed(){
    if(move){
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
  }
      
  
  