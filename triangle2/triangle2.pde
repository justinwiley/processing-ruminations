

// 1
// x1 < x2
// y1 < y2

//fill(210,230,230);
//int x1 = 100;
//int y1 = 100;
//ellipse(x1, y1, 5, 5);
//
//fill(230,45,230);
//int x2 = 150;
//int y2 = 150;
//ellipse(x2, y2, 5, 5);
//
//fill(10,10,10);
//ellipse(((x2 + x1)/2) + 50,
//    ((y2+ y1)/2) - 50,
//    3,3); 

// 1.5
// x1 < x2
// y1 > y2


//fill(210,230,230);
//x1 = 100;
//y1 = 150;
//ellipse(x1, y1, 5, 5);
//
//fill(230,45,230);
//x2 = 150;
//y2 = 100;
//ellipse(x2, y2, 5, 5);
//
//fill(10,10,10);
//ellipse(((x2 + x1)/2) + 50,
//    ((y2+ y1)/2) + 50,
//    3,3); 

// 2
// x1 > x2
// y1 < y2

//fill(210,230,230);
//x1 = 100;
//y1 = 100;
//ellipse(x1, y1, 5, 5);
//
//fill(230,45,230);
//x2 = 150;
//y2 = 50;
//ellipse(x2, y2, 5, 5);
//
//fill(10,10,10);
//ellipse(((x2 + x1)/2) - 50,
//    ((y2+ y1)/2) - 50,
//    3,3); 
// 3
// x1 == x2
// y1 < y2

//fill(210,230,230);
//x1 = 100;
//y1 = 100;
//ellipse(x1, y1, 5, 5);
//
//fill(230,45,230);
//x2 = 100;
//y2 = 100;
//ellipse(x2, y2, 5, 5);
//
//fill(10,10,10);
//ellipse(((x2 + x1)/2) - 50,
//    ((y2+ y1)/2) - 50,
//    3,3); 


// 4
// x1 == x2
// y1 > y2

//fill(210,230,230);
//x1 = 100;
//y1 = 50;
//ellipse(x1, y1, 5, 5);
//
//fill(230,45,230);
//x2 = 100;
//y2 = 100;
//ellipse(x2, y2, 5, 5);
//
//fill(10,10,10);
//ellipse(((x2 + x1)/2) + 50,
//    ((y2+ y1)/2),
//    3,3); 

// 5
// x1 > x2
// y1 < y2

//fill(210,230,230);
//x1 = 150;
//y1 = 50;
//ellipse(x1, y1, 5, 5);
//
//fill(230,45,230);
//x2 = 100;
//y2 = 100;
//ellipse(x2, y2, 5, 5);
//
//fill(10,10,10);
//ellipse(((x2 + x1)/2) - 50,
//    ((y2+ y1)/2) - 50,
//    3,3); 


// 6
// x1 > x2
// y1 > y2

//fill(210,230,230);
//x1 = 150;
//y1 = 150;
//ellipse(x1, y1, 5, 5);
//
//fill(230,45,230);
//x2 = 100;
//y2 = 100;
//ellipse(x2, y2, 5, 5);
//
//fill(10,10,10);
//ellipse(((x2 + x1)/2) + 50,
//    ((y2+ y1)/2) - 50,
//    3,3); 

// 7
// x1 > x2
// y1 == y2

//fill(210,230,230);
//x1 = 150;
//y1 = 100;
//ellipse(x1, y1, 5, 5);
//
//fill(230,45,230);
//x2 = 100;
//y2 = 100;
//ellipse(x2, y2, 5, 5);
//
//fill(10,10,10);
//ellipse(((x2 + x1)/2),
//    ((y2+ y1)/2) - 50,
//    3,3); 

// 8
// x1 < x2
// y1 == y2

//fill(210,230,230);
//x1 = 50;
//y1 = 100;
//ellipse(x1, y1, 5, 5);
//
//fill(230,45,230);
//x2 = 100;
//y2 = 100;
//ellipse(x2, y2, 5, 5);
//
//fill(10,10,10);
//ellipse(((x2 + x1)/2),
//    ((y2+ y1)/2) - 50,
//    3,3); 

// 9 ----- impossible, on the same point!
// x1 == x2
// y1 == y2



class Triangle {
  int offset = 10;
  int x1, y1, z1, x2, y2, z2, x3, y3, z3;
  Triangle(int x1, int y1, int z1, int x2, int y2, int z2){
    this.x1 = x1;
    this.y1 = y1;
    this.z1 = z1;
    this.x2 = x2;
    this.y2 = y2;
    this.z2 = z2;
    if (x2 >= x1) {
      this.x3 = (x2 + x1)/2 + this.offset;
    }
    else {
      this.x3 = (x2 + x1)/2 - this.offset;
    }
    if (y2 >= y1) {
      this.y3 = ((y2 + y1)/2) + this.offset;
    } else {
      this.y3 = ((y2 + y1)/2) - this.offset;
    }
    this.z3 = 0;
  }
  
  void render(){
    fill(200, this.x1, this.y1);
    beginShape();
    vertex(x1, y1, z1);
    vertex(x2, y2, z2);
    vertex(x3, y3, z3);
    endShape(CLOSE);
  }
}

int x1,x2,y1,y2;
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
float posx = 0.0;
float posy = 0.0;
float posz = 0.0;

void setup(){
  size(400, 400, P3D);
  lights();
  PFont myFont;
  myFont = createFont("Tahoma", 12);
  textFont(myFont);
}

void draw(){
  doRotation();
  for(int i = 0; i <= 400; i += 100){
    for(int j = 0; j <= 400; j += 100){
      for(int k = 0; k <= 400; k += 100){
        Triangle tr = new Triangle(i,j,k,j / 2,i, k);
        tr.render();
      }
    }
  }
}

void keyPressed() {
  if(keyCode == LEFT){
    posx += 15;
  } else if(keyCode == RIGHT) {
    posx -= 15;
  } else if(keyCode == UP) {
    posz += 15;
  } else if(keyCode == DOWN) {
    posz -= 15;
  }
}

void doRotation(){
  background(0.5); // comment out to get neat overwriting effect

  translate(posx, width/height, posz); 
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  
  rotateX(-ymag); 
  rotateY(-xmag); 

}

// x1 > x2
//Triangle tr = new Triangle(150,100,0,100,100,0);
//tr.render();
//
//// x1 < x2
//tr = new Triangle(100,100,0,150,100,0);
//tr.render();
//
//// y1 > y2
//tr = new Triangle(100,150,0,100,100,0);
//tr.render();
//
//// y1 < y2
//tr = new Triangle(100,100,0,100,150,0);
//tr.render();

