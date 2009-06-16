
size(400, 400, P3D);

//fill(0);
//int x1 = 100;
//int y1 = 100;
//ellipse(x1, y1, 3, 3);
//
//fill(100);
//int x2 = 150;
//int y2 = 100;
//ellipse(x2, y2, 3, 3);

class Triangle {
  int x1, y1, z1, x2, y2, z2, x3, y3, z3;
  Triangle(int x1, int y1, int z1, int x2, int y2, int z2){
    this.x1 = x1;
    this.y1 = y1;
    this.z1 = z1;
    this.x2 = x2;
    this.y2 = y2;
    this.z2 = z2;
    this.x3 = (x2 + x1)/2;
    this.y3 = ((y2 + y1)/2) + x2 - x1;
    this.z3 = 0;
  }
  
  void render(){
    fill(x3 + y3 + z3);
    beginShape();
    vertex(x1, y1, z1);
    vertex(x2, y2, z2);
    vertex(x3, y3, z3);
    endShape(CLOSE);
  }
}

Triangle first = new Triangle(100,100,0,150,100,0);
first.render();

Triangle two = new Triangle(100,150,0,100,100,0);
two.render();
