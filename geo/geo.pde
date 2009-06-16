
int cenx = 0;
int ceny = 0;

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
  int radius = 200;

  for(int i = 0; i < 10000; i++){
    newLine(cenx,ceny, (i * 5),radius);
  }
  
}

void newLine(float x, float y, float angle, float radius){
  strokeCap(ROUND);
  strokeWeight(30);
  
  // stroke color
  color from = color(204, 102, 0);
  color to = color(0, 102, 153);
  stroke(lerpColor(from, to, cos(radians(angle))));
  
  // calculate new x, y from given angle (clockwise)
  float newx = x - (cos(radians(angle)) * radius);
  float newy = y - (sin(radians(angle)) * radius);  
  
  line(x, y, newx, newy);
}

