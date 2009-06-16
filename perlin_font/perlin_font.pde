
int s = 10;

void setup(){
  size(400,400, P3D);
  lights();
  PFont font;
  font = loadFont("Garamond-48.vlw"); 
  textFont(font,10);
  //translate(200,200);
}



void draw(){
  doRotation();
  for(int x = 0; x < s; x++){
    for(int y = 0; y < s; y++){
      for(int z = 0; z < s; z++){
        float n = noise(x,y,z);
        int intn = int(n * 15);
        int textx = intn * intn;
        fill(textx,textx * 2,textx);
        text(textx, x * 15,y * 15,z * 15);

//          point(x * 10,y * 10,z * 10);
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
}

void mouseDragged() {
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}

void doRotation(){
  background(backg);
  translate(camerax, height/2.0, cameraz);
  rotateX(rotx);
  rotateY(roty);
  scale(40);
}


