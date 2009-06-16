
void setup(){
  size(1024,768, P3D);
  noStroke();
  smooth();
  background(255);
  rotate(275);
}
float t = 0.02;
void draw(){
  t += 0.02;
  float angle = 0;
  float angleIncrement = TWO_PI / 15;
  translate(width/2,height/2);
  float sint = sin(t);
  float cost = cos(t);
  float tant = tan(t);
  angle += angleIncrement;
  rotateX(sint * t * PI/4 + random(20));
  rotateY(cost * t + random(20));
//  rotateZ(tant);
  for (int i = 0; i < 1000; ++i) {
          delay(1);
    float sinti = sint/i;
    float costi = cost/i;
    float tanti = tant/i;
    float sintxi = sint*i;
    float costxi = cost*i;
    translate(sint*5+sintxi*random(3),sint*5+costxi,sint*15-sintxi);
    fill(sint*150,sint*15,sint*15*random(3), tant*200);
    if(t % 6 == 0){fill(255);}
    
    curve(sint*5+sintxi*random(3),sint*5+costxi,sint*15-sintxi,
    sint*2+sintxi*random(3),sint*7+costi,sint-15-sintxi,
    sint*7+costi,sint-15-sintxi);
    
    curve(cost*5+sintxi*random(3),sint*5+costxi,sint*15-sintxi,
    sint*2+sintxi*random(3),sint*17+costi,sint-15-sintxi,
    sint*7+costi,sint-12-costi);
    
    curve(sint*5+sintxi*random(3),tant*5+costxi,sint*15-sintxi,
    sint*2+tan(t*i)*random(3),sint*9+sinti,sint-15-sintxi,
    sint*7+costi,sint-15-sintxi);

    if(t%3 == 0){

      fill(sint*90,sint*90,sint*90);
      bezier(sint*5+sintxi*random(3),sint*5+costxi,sint*15-sintxi,
        sint*7+costi,sint-15-sintxi,
        sint*3+tanti*2,sint-15-sintxi,sint*5+costxi);
    }
    point(sintxi*random(3),costxi*random(3));
  }
//  delay(int(random(500)));
}

