float yCor = 0;
float xCor = 300;
float xCorWild = 400;
float yCorWild = 200;
boolean move = true;
int videoScale = 50;
float battleWidth = 125;
float battleHeight = 100;
float battleHighlight = 51;
boolean makeRe = false;
boolean battle = false;
boolean battleClicked = false;
  public void setup(){
   size(1500,1500);
    
  }
    

  
  
  public void wildPokemon(){
    //  boolean makeRe = true;
      if(yCor == 0 && xCor == 0){
          background(200);
          move = false;
          if(battleClicked == true){
          battle = false;
          }
          else{
            battle = true;
          }
         // rect(xCorWild,yCorWild,100,100);
         
        //  rect(250,200,battleWidth,battleHeight);
        if(battle){
          if(mouseX >= 250 && mouseX < 250 + battleWidth && mouseY >=200 && mouseY < 200 + battleHeight){
            fill(color(51));
          }
          else{
            fill(color(255));
          }
        }
          if(mousePressed){
            if(mouseX >= 250 && mouseX < 250 + battleWidth && mouseY >= 200 && mouseY < 200 + battleHeight){
           //   rect(40,40,10,10);
           makeRe = true;
           
           battleClicked = true;
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
              rect(650,650,100,100);
              rect(850,850,100,100);
              rect(850,650,100,100);
              rect(650,850,100,100);
         }
         if(battle){
           rect(250,200,battleWidth,battleHeight);
         }
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
  
  
  
  
      
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
