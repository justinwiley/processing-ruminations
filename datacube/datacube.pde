
int s = 8;

void setup(){
  size(400,400, P3D);
  noStroke();
  lights();
  frameRate(30);
  PFont font;
  font = loadFont("Garamond-48.vlw"); 
  textFont(font,10);
  //translate(200,200);
}

int inverse_cube_density = 15;
void draw(){
  doRotation();
  for(int x = 0; x < s; x++){
    for(int y = 0; y < s; y++){
      for(int z = 0; z < s; z++){
        int scaledx = x * inverse_cube_density;
        int scaledy = y * inverse_cube_density;
        int scaledz = z * inverse_cube_density;
        float n = noise(x,y,z);
        int scaledn = int(n * n * inverse_cube_density);
        fill(scaledn * 40, scaledn * 30, scaledn * 20, 250 - scaledn);
        pushMatrix();
        translate(scaledx, scaledy, scaledz);
        box(scaledn * 2);
        popMatrix();
        fill(100);
      }
    }  
  }
}


int backg = 0;
int cameraz, cameray, camerax;
int camera_offset = 100;
float rotx = PI/4;
float roty = PI/4;
float rate = 0.01;

void keyPressed() {
  if(key == 'a') {
    camerax += camera_offset;
  }
  if(key == 'd') {
    camerax -= camera_offset;
  }
  if(key == 'w') {
    cameraz += camera_offset;
  }
  if(key == 's') {
    cameraz -= camera_offset;
  }
  if(key == 'r') {
    cameray += camera_offset;
  }
  if(key == 'f') {
    cameray -= camera_offset;
  }
}

void mouseDragged() {
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}

void doRotation(){
  background(backg);
  translate(camerax, cameray, cameraz);
  rotateX(rotx);
  rotateY(roty);
  scale(40);
}


