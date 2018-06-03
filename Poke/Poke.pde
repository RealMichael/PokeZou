float yCor = 0;
float xCor = 300;
float xCorWild = 400;
float yCorWild = 200;
boolean move = true;
int videoScale = 50;
float battleWidth = 50;
float battleHeight = 40;
// Number of columns and rows in our system
int cols, rows;
boolean makeRe = false;

  public void setup(){
   size(1500,1500);
     //cols = width/videoScale;
  //rows = height/videoScale;
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
    //  boolean makeRe = true;
      if(yCor == 0 && xCor == 0){
          background(200);
          move = false;
          rect(xCorWild,yCorWild,40,40);
          rect(250,200,battleWidth,battleHeight);
          if(mousePressed){
            if(mouseX >= 250 && mouseX < 250 + battleWidth && mouseY >= 200 && mouseY < 200 + battleHeight){
           //   rect(40,40,10,10);
           makeRe = true;
         //  background(100);
            }
          }
        
          
      }
  }
  
  
    public void draw(){
          setup();
         background(100,255,255);
        rect(xCor,yCor,200,200);
         wildPokemon();
         if(makeRe == true){
              rect(40,40,10,10);
         }
         /*
          for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {

      // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale;
      int y = j*videoScale;
      fill(255);
      stroke(0);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      if(x == xCor && y == yCor){
           rect(xCor,yCor,40,10);
      }
      else{
      rect(x, y, videoScale, videoScale);
      }
    }
    }
  }
*/
}
    

  void keyPressed(){
    if(move){
      if(key == CODED){
          if(keyCode == UP){
            if(yCor - 125 >= 0){
              yCor -= 125;
          }
          else{
            yCor = 0;
          }
          }
          if(keyCode == DOWN){
            if(yCor + 125 < 1300){
              yCor += 125;
              System.out.println(yCor);
          }
          else{
            yCor = 1300;
          }
          }
          if(keyCode == RIGHT){
            if(xCor + 125 <= 1300){
              xCor += 125;
          }
          else{
              xCor = 1300;
          }
          }
          if(keyCode == LEFT){
            if(xCor - 125 >= 0){
              xCor -= 125;
          }
          else{
            xCor = 0;
          }
          }
          }
    }
  }
  
  
  
      
  
  
