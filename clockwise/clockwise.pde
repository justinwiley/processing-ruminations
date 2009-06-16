int pts = 8; 
float angle = 0;
float radius = 99;
float cylinderLength = 95;

//vertices
PVector vertices[][];
boolean isPyramid = false;

float angleInc;

void setup(){
  size(640, 360, P3D);
  noStroke();
  angleInc = PI/300.0;

}

void draw(){
  background(170, 95, 95);
  lights();
  fill(255, 200, 200);
  translate(width/2, height/2);
  rotateX(frameCount * angleInc);
  rotateY(frameCount * angleInc);
  rotateZ(frameCount * angleInc);

  // initialize vertex arrays
  vertices = new PVector[2][pts+1];

  // fill arrays
  for (int i = 0; i < 2; i++){
    angle = 0;
    for(int j = 0; j <= pts; j++){
      vertices[i][j] = new PVector();
      vertices[i][j].x = sin(radians(angle)) * radius;
      vertices[i][j].y = cos(radians(angle)) * radius;
      vertices[i][j].z = cylinderLength; 
      // the .0 after the 360 is critical
      angle += 360.0/pts;
    }
    cylinderLength *= -1;
  }

  // draw cylinder tube
  beginShape(QUAD_STRIP);
  for(int j = 0; j <= pts; j++){
    vertex(vertices[0][j].x, vertices[0][j].y, vertices[0][j].z);
    vertex(vertices[1][j].x, vertices[1][j].y, vertices[1][j].z);
  }
  endShape();

  //draw cylinder ends
  for (int i = 0; i < 2; i++){
    beginShape();
    for(int j = 0; j < pts; j++){
      vertex(vertices[i][j].x, vertices[i][j].y, vertices[i][j].z);
    }
    endShape(CLOSE);
  }
}

