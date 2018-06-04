PImage map;
int rows = 40;
int cols = 48;
int tile = 16;

void setup(){
  size(768,640);
  map = loadImage("Images/map.png");
}

void draw(){
  background(255);
  image(map,0,0);
  fill(0);
  for (int i = 0;i < rows;i++){
    for (int c = 0;c < cols;c++){
        noFill();
        rect(c * tile,i * tile,tile,tile);
    }
  }
}
