PImage map;
int rows = 40;
int cols = 48;
int tile = 16;
int listTile[][] = new int [cols][rows];
//1 is walls

void setup(){
  size(768,640);
  map = loadImage("Images/map.png");
}

void draw(){
  background(255);
  image(map,0,0);
  fill(0);
  for (int i = 0;i < cols;i++){
    for (int c = 0;c < rows;c++){
        noFill();
        rect(i * tile,c * tile,tile,tile);
    }
  }
  paint();
  stroke(0);
  fill(200);
  if (mouseButton == LEFT && checkBoard(mouseX,mouseY)){
    listTile[int(mouseX / tile)][int(mouseY / tile)] = 1;
  }
}

boolean checkBoard(float xCor,float yCor){
  int tx = int(xCor / tile);
  int ty = int(yCor / tile);
  if (tx >= 0 && tx < cols && ty >= 0 && ty < rows){
    return true;
  }
  else {
    return false;
  }
}

void paint(){
   for (int i = 0;i < cols;i++){
     for (int c = 0;c < rows;c++){
       noStroke();
       if (listTile[i][c] == 1){
         fill(0,0,0,100);
         rect(i * tile,c * tile,tile,tile);
       }
     }
   }
}
