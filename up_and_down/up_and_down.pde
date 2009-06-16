void setup(){
  size(100, 100, P3D);
}

int num = 0;
int dir = 0;
void draw(){
  background(0);
  noStroke();
  background(0);
  directionalLight(204, upAndDown(), 204, .5, 0, -1);
  emissive(300, 100, 110);
  translate(70, 50, 0);
  sphere(30);
}

int upAndDown(){
  if(num < 200 && dir == 0){
    num++;
    if(num == 199){ dir = 1; }
  } else {
    num--;
    if(num == 0){ dir = 0; }
  }
  return num;
}
