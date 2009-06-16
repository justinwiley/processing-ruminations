
class Voxel {
  int density;
  Voxel (int d) {
    density = d;
  }
}
Voxel voxels[][][] = new Voxel[32][32][32];

void setup(){
  size(400,400, P3D);
  lights();
  background(255);
  for(int x = 0; x < 32; x++){
    for(int y = 0; y < 32; y++){
      for(int z = 0; z < 32; z++){
        voxels[x][y][z] = new Voxel(int(random(2)));
      }
    }  
  }
}

void draw(){
    doRotation();
  fill(230,0,50);
  for(int x = 0; x < 32; x++){
    for(int y = 0; y < 32; y++){
      for(int z = 0; z < 32; z++){
        Voxel v = voxels[x][y][z];
        if (v.density == 1){
          point(x,y,z);
        }
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
  background(255);
  //translate(width/2,height/2,15);
  camera(focusx, focusy, focusz, // eye
         focusx,focusy, 0,   // center
         0.0, mouseX, 0.0);    // up
  focusx = mouseX;
  focusy = mouseY;
}
