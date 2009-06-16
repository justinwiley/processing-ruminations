
int rows = 16;
int cols = 16;
int elev_multiplier = 2;
PImage t;
PVector[][] vs = new PVector[rows][cols];

void setup(){
  smooth();
  size(500,500, P3D);
  
  for (int i = 0; i < rows; i += 1) {
    for (int j = 0; j < cols; j += 1) {
      vs[i][j] = new PVector(i * 25,j * 25, (elev() * elev()) * 2);
    }
  }
}

void draw(){
  doRotation();
  rotateX(1);
  rotateY(1);
  for (int i = 0; i < rows - 1; i += 1) {
    for (int j = 0; j < cols - 1; j += 1) {
      PVector p1, p2, p3, p4;
      p1 = vs[i][j];
      p2 = vs[i + 1][j];
      p3 = vs[i + 1][j + 1];
      p4 = vs[i][j + 1];
      float fillcolor = ((p1.z + p2.z + p3.z + p4.z)/4);
      fill(100, 200, fillcolor  * 300);
      beginShape();
      vertex(p1.x, p1.y, p1.z * elev_multiplier);
      vertex(p2.x, p2.y, p2.z * elev_multiplier);
      vertex(p3.x, p3.y, p3.z * elev_multiplier);
      vertex(p4.x, p4.y, p4.z * elev_multiplier);  
      endShape(CLOSE);
    }
  }
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

int focusx = width/2;
int focusy = height/2;
int focusz = 500;
void keyPressed() {
  if (key == 'u'){
    elev_multiplier++;
  }
  if (key == 'd'){
    elev_multiplier--;
  }
  if(keyCode == UP) {
    focusz += 10;
  } else if(keyCode == DOWN) {
    focusz -= 10;
  } 
}


void doRotation(){
  background(0);
  translate(width/2,height/2,15);
  camera(width/2,height/2, focusz, // eye
         focusx,focusy, 0,   // center
         0.0, 1.0, 0.0);    // up
  focusx = mouseX;
  focusy = mouseY;

}

//void doRotation(){
//  background(0.5); // comment out to get neat overwriting effect
//
//  translate(0 - posx, 0, posy); 
//  
//  newXmag = mouseX/float(width) * TWO_PI;
//  newYmag = mouseY/float(height) * TWO_PI;
//  
//  float diff = xmag-newXmag;
//  if (abs(diff) >  0.09) { xmag -= diff/4.0; }
//  
//  diff = ymag-newYmag;
//  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
//  
//  rotateX(-ymag); 
//  rotateY(-xmag); 
//}

