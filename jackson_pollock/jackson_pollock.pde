
int cenx = 0;
int ceny = 0;

color from = color(204, 102, 0);
color to = color(0, 102, 153);

void setup(){
  size(500,500);
  cenx = width / 2;
  ceny = height / 2;
  
  // straight horizontal
  background(255);
  strokeWeight(1);
  stroke(#AEAEAE);
  line(0,cenx,width,ceny);

  // center dot
  stroke(000000);
  strokeWeight(3);
  ellipse(cenx, ceny, 3, 3);  

}

void draw() {
  int angle = 0;
  int distance = 15;

  float[] position = new float[2];
  position = newLine(cenx,ceny, 0,distance);
  for(int i = 0; i < 900; i++){
    position = newLine(position[0],position[1], i + int(random(100)),distance * random(5));
  }
}

float[] newLine(float x, float y, float angle, float distance){
  strokeCap(ROUND);
  strokeWeight(int(random(3)));
  
  stroke(lerpColor(from, to, cos(radians(angle))));
  
  // calculate new x, y from given angle (clockwise)
  float[] new_position = new float[2];
  new_position[0] = x - (cos(radians(angle)) * distance);
  new_position[1] = y - (sin(radians(angle)) * distance);  
  line(x, y, new_position[0], new_position[1]);
  stroke(#000000);
  float esize = random(10);
  ellipse(new_position[0],new_position[1],esize,esize);
  return new_position;
}


