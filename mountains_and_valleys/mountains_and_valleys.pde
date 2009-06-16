
PImage t;
PVector[] vs = new PVector[100];

void setup(){
  noLoop();
  size(200,200, P3D);
  
//  noStroke();
  stroke(30, 60);
  
  t = loadImage("cover.jpg");  
  smooth();
  lights();
  int cnt = 0;
  for (int i = 0; i < 50; i += 5) {
    for (int j = 0; j < 50; j += 5) {
      vs[cnt] = new PVector(i+10,j+10);
      cnt++;
    }
  }
}

float xmag, ymag = 0;
float newXmag, newYmag = 0; 
float posx = 0.0;
float posy = 0.0;
float posz = 0.0;

void keyPressed() {
  if(keyCode == LEFT){
    posx += 10;
  } else if(keyCode == RIGHT) {
    posx -= 10;
  } else if(keyCode == UP) {
    posy += 10;
  } else if(keyCode == DOWN) {
    posy -= 10;
  } 
}

void doRotation(){
  background(0.5); // comment out to get neat overwriting effect

  translate(0 - posx, 0, posy); 
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.09) { xmag -= diff/4.0; }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  
  rotateX(-ymag); 
  rotateY(-xmag); 
}


void draw(){
//  doRotation();
  background(0);
  translate(74,80,105);
  rotateX(.95);
  
  for (int i = 0; i < 100; i++) {
    PVector p = vs[i];
    pushMatrix();
    translate(p.x, p.y,0);
    fill(p.x + 80, p.y + 80, p.z + 80);
    box(5,5,elev());
    popMatrix();
  }
//  rotateX(0.75);
}

int elevcnt, dir;
float[] hmap = {0.0,0.0,0.1,5,0.0,0.3,0.1,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.3,0.1,
           -0.3,-3.0,-.9,-1,0.1,0.2,0.1,0.1,1,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.1,0.0};

float elev(){
  if(elevcnt < hmap.length && dir == 0){
    elevcnt++;
    if(elevcnt == hmap.length - 1){ dir = 1; }
  } else {
    elevcnt--;
    if(elevcnt == 0){ dir = 0; }
  }
  return(hmap[elevcnt] * 1.);
}

