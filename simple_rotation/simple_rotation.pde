float xmag, ymag = 0;
float newXmag, newYmag = 0; 
int num_boxes = 10;
int num_per_row = 5;
int box_width = 15;
int cell_width = 20;

void setup(){
  size(400, 400, P3D); 
  background(0);
  lights();
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
  
  for(int i = 0; i <= num_boxes; i++){
   translate(box_width,0,0);
   int step = i / num_per_row;
   if(step % 5 == 0){
     translate(-num_per_row * cell_width, step * cell_width,0);
   }
   box(15);
  }
}

//translate(30, 20, 0); 
//box(20);

//noStroke();
////pushMatrix();
//translate(20,0);
////rotateY(1.25);
////rotateX(-0.4);
//box(20);
//translate(40);
//box(20);
//translate(60);
//box(20);
////popMatrix();
