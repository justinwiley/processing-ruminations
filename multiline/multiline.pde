
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

void draw(){
    int angle = 0;
  int distance = 10;
  
  float[] position1 = new float[2];
  float[] position2 = new float[2];
  float[] position3 = new float[2];
  float[] position4 = new float[2];
  float[] position5 = new float[2];
  position1 = newLine(random(100),random(100), 0,distance);
  position2 = newLine(random(100),random(100), 0,distance);
  position3 = newLine(random(100),random(100), 0,distance);
  position4 = newLine(random(100),random(100), 0,distance);
  position5 = newLine(random(100),random(100), 0,distance);
  background(0);
  for(int i = 0; i < 10000; i++){
    position1 = newLine(position1[0],position1[1], i + int(random(100)),distance * random(5));
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


