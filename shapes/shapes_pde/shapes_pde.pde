// make a triangle
// take the left most edge of old triangle as basis of new triangle
// calculate a new point some distance


int offset = 50;
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
  Triangle[] triangles = new Triangle[10];

void setup(){
  background(100);
  size(640, 360, P3D);
  int center_x = int(width / 2);
  int center_y = int(height / 2);
  
  triangles[0] = new Triangle();
  triangles[0].setRightVertex(center_x, center_y, 100);
  triangles[0].setLeftVertex(center_x + offset, center_y + offset, 100);  
}

void draw(){
  background(0.5); // comment out to get neat overwriting effect
    
  translate(width/2, height/2, -30); 
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  
  rotateX(-ymag); 
  rotateY(-xmag);
  
  for(int i = 1; i <= 9; i++){
    Triangle previous = triangles[i-1];
    triangles[i] = new Triangle();
    triangles[i].setRightVertex(previous.getLeftEdge());
    triangles[i].setLeftVertex(previous.getRightEdge());
    triangles[i].setNewBottomVertex();
    triangles[i].render();
  }
}

class Triangle{
  int[][] verticies = new int[3][3];
  
  int[] getLeftEdge(){
    return this.verticies[0];
  }

  int[] getRightEdge(){
    return this.verticies[1];
  }
  
  void setLeftVertex(int x, int y, int z){
    this.verticies[0][0] = x;
    this.verticies[0][1] = y;
    this.verticies[0][2] = z;
  }
  
  void setLeftVertex(int[] v){
    this.verticies[0] = v;
  }
  
  void setRightVertex(int x, int y, int z){
    this.verticies[1][0] = x;
    this.verticies[1][1] = y;
    this.verticies[1][2] = z;
  }

  void setRightVertex(int[] v){
    this.verticies[1] = v;
  }
  
  void setNewBottomVertex(){
    int x1 = this.verticies[0][0];
    int y1 = this.verticies[0][1];
    int z1 = this.verticies[0][2];
    int x2 = this.verticies[1][0];
    int y2 = this.verticies[1][1];
    int z2 = this.verticies[1][2];
    this.verticies[2][0] = int((x1 + x2) / 2);
    this.verticies[2][1] = int((y1 + y2) / 2);
    this.verticies[2][2] = 100;
  }
  
  void render(){
    int[] v = new int[3];
    beginShape();
    for(int i = 0; i < 3; i++){
      fill(150,40,i *10);
      for(int j = 0; j < 3; j++){
        v[j] = verticies[i][j];
      }
      vertex(v[0],v[1],v[2]);
      println(v[0] + " " + v[1] + " " + v[2]);
    }
   endShape(CLOSE);
  }
  
}
