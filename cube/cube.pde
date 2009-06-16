  
PVector[] vs = new PVector[1000];
void setup(){
  size(200,200, P3D);
  smooth();
//  smooth();
  lights();
  int cnt = 0;
  for (int i = 0; i < 50; i += 5) {
    for (int j = 0; j < 50; j += 5) {
      for (int k = 0; k < 50; k += 5) {
        vs[cnt] = new PVector(i+40,j+40,k+40);
        cnt++;
      }
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
    posz += 10;
  } else if(keyCode == DOWN) {
    posz -= 10;
  }
}

void doRotation(){
  background(0.5); // comment out to get neat overwriting effect

  translate(0 - posx, 0, posz); 
  
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
  //rotateX(0.75);
  //doRotation();
  for (int i = 0; i < 1000; i++) {
    PVector p = vs[i];
    pushMatrix();
    fill(p.x + 10, p.y + 10, 0);
    translate(p.x, p.y, p.z);
    box(2);
    popMatrix();
  }
}
