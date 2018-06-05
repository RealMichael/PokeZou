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
  
  if (mouseButton == LEFT){
    listTile[int(mouseX / tile)][int(mouseY / tile)] = 1;
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
