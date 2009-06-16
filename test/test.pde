
class Turtle {
  PVector pos = new PVector();
  float xdir = 1;
  float ydir = 1;
  float zdir = 0.1;
  float tsize = random(20) + 5;
  float velocity = 5;
  color fillcolor = color(random(255) + 50, random(255) + 50, random(255)+50);
  
  Turtle(float x, float y, float z){
    pos = new PVector(x, y, z);
  }
  float x(){ return pos.x; }
  float y(){ return pos.y; }
  float z(){ return pos.z; }
  void setX(float x){ pos.x = x; }
  void setY(float y){ pos.y = y; }
  void setZ(float z){ pos.z = z; }
  
  void randomizeDir(){
      xdir += random(10)/20;
      ydir += random(10)/20;
      zdir += random(10)/20;
  }
  
  void turn(){
    if(pos.x >= (width - tsize) || pos.x <= (0 - tsize)){ xdir *= -1; }
    if(pos.y >= (height - tsize) || pos.y <= (0 - tsize)){ ydir *= -1; }
    if(pos.z >= (200 - tsize) || pos.x <= (0 + tsize)){ zdir *= -1; }
    if((pos.dist(new PVector(mouseX + tsize, mouseY + tsize)) < 20) 
      || (pos.dist(new PVector(mouseX - tsize, mouseY - tsize)) < 20)){
      xdir *= -1;
      ydir *= -1;
      randomizeDir();
    }
  }
  
  void steer(){
    if(xdir == 1){
      xdir = 0;
      ydir = 1;
    }
    else if(ydir == 1){
      xdir = -1;
      ydir = 0;
    }
    else if(xdir == -1){
      xdir = 0;
      ydir = -1;
    }   
    else {
      xdir = 1;
      ydir = 0;
    }
  }
  void render(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateX(noise(2)*4);
    rotateY(-noise(2)*4);
    rotateZ(noise(2));
//    println(pos.x + " " + pos.y + " " + pos.z);
    fill(fillcolor);
    box(tsize + sin(xdir - ydir));
    popMatrix();
  }
  
  void update_pos(){
    pos.x += xdir * velocity;
    pos.y += ydir * velocity;
    pos.z += zdir * velocity;
//    steer();
    turn();
  }
}

Turtle[] turtles = new Turtle[16];

void setup(){
  size(640,480,P3D);
  smooth();
//  noStroke();
  frameRate(30);
  for(int i = 0; i < 15; i++){
    turtles[i] = new Turtle(width/2 + random(i)*30, height/2 + random(i)*30, random(i));
  }
}



void draw(){
    doRotation();
  for(int i = 0; i < 15; i++){
    turtles[i].render();
    turtles[i].update_pos();
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
//  scale(40);
}
