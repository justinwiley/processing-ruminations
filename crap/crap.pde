
int s = 10;

void setup(){
  background(0);
  size(800,800, P3D);
  noStroke();
  lights();
  frameRate(30);
}

float t = 0;
float inverse_cube_density = 15;
void draw(){
  background(0);
  scale(2);
  translate(width/4,height/4);
  t += 0.02;
  float sint = sin(t);
  float cost = cos(t);
  float tant = tan(t);
  for(float x = 0; x < s; x++){
    for(float y = 0; y < s; y++){
      for(float z = 0; z < s; z++){
        float scaledx = x * inverse_cube_density * sint;
        float scaledy = y * inverse_cube_density * cost;
        float scaledz = z * inverse_cube_density * tant;
        float n = noise(x,y,z);
        int scaledn = int(n * n * inverse_cube_density);
        fill(abs(scaledn * 20) + 50, abs(sint) + 15, abs(sint) + 10, 250 - scaledn);
        pushMatrix();
        rotateX(frameCount / 100.0);
        rotateY(frameCount / 100.0);
        translate(scaledx, scaledy, scaledz); 
        box(scaledn * sint + 5);
        popMatrix();
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

float r = 0;

void doRotation(){
  r += 0.02;
  background(backg);
  translate(200,200);
  rotateX(r);
  rotateY(r);
  scale(10);
}


