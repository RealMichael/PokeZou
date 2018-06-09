PImage map;
int rows = 20;
int cols = 24;
int tile = 32;
int listTile[][] = new int [cols][rows];
//1 is wallsgit st
int mode;
String save[] = new String[0];
// 1 is wall,2 is npc, 3 is grass,4 is house
void setup(){
  size(768,640);
  map = loadImage("Images/pokeCenter.png");
  map.resize(768,640);
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
    listTile[int(mouseX / tile)][int(mouseY / tile)] = mode;
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
         fill(255,255,255,100);
         rect(i * tile,c * tile,tile,tile);
       }
       else if (listTile[i][c] == 2){
         fill(255,0,0,100);
         rect(i * tile,c * tile,tile,tile);
       }
       else if (listTile[i][c] == 3){
         fill(0,255,0,100);
         rect(i * tile,c * tile,tile,tile);
       }
       else if (listTile[i][c] == 4){
         fill(0,0,255,100);
         rect(i * tile,c * tile,tile,tile);
       }
     }
   }
}

void keyPressed(){
  if (key == 's'){
    for (int i = 0;i < cols;i++){
      for (int c = 0;c < rows;c++){
        if (listTile[i][c] != 0){
          save = append(save,listTile[i][c] + "," + i + "," + c); 
        }
      }
    }
  }
  if (key == 'q'){
    mode -= 1;
  }
  if (key == 'e'){
    mode += 1;
  }
  saveStrings("save.txt",save);
}
