int rows = 16;
int cols = 16;
int depth = 16;
float offset = 25.0;
PImage t;
PVector[][][] vs = new PVector[rows][cols][depth];

void setup(){
  //smooth();
  size(500,500, P3D);
  lights();
  
  for (int i = 0; i < rows; i += 1) {
    for (int j = 0; j < cols; j += 1) {
      for (int k = 0; k < cols; k += 1) {
        vs[i][j][k] = new PVector(i * offset,j * offset, k * offset);
      }
    }
  }
}

void draw(){
  doRotation();
  for (int i = 0; i < rows; i += 1) {
    for (int j = 0; j < cols; j += 1) {
      for (int k = 0; k < cols; k += 1) {
        PVector p = vs[i][j][k];
        fill(10 * i,10 * j,10 * k);
        pushMatrix();
        translate(p.x, p.y, p.z);
        box(offset);
        popMatrix();
//        fill(0,200,200);
//        beginShape(); // back
//        vertex(p.x, p.y, p.z + offset);
//        vertex(p.x + offset, p.y, p.z + offset);
//        vertex(p.x, p.y + offset, p.z + offset);
//        vertex(p.x + offset, p.y + offset, p.z + offset);
//        endShape(CLOSE);
      }
    }
  }  
}

int focusx = width/2;
int focusy = height/2;
int focusz = 500;
void keyPressed() {
  if(keyCode == UP) {
    focusz += 10;
  }
  if(keyCode == DOWN) {
    focusz -= 10;
  } 
  if(keyCode == LEFT) {
    focusx += 10;
  }
  if(keyCode == RIGHT) {
    focusx -= 10;
  } 
}


void doRotation(){
  background(0);
  //translate(width/2,height/2,15);
  camera(focusx, focusy, focusz, // eye
         focusx,focusy, 0,   // center
         0.0, mouseX, 0.0);    // up
  focusx = mouseX;
  focusy = mouseY;
}
