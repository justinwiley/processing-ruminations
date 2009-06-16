import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.*; 
import java.awt.image.*; 
import java.awt.event.*; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class perlin_cubism extends PApplet {


int s = 10;
float t = 0;
int inverse_cube_density = 15;
Cube[][][] cubes = new Cube[s][s][s];

class Cube {
  int scaledn;
  int xd, yd, zd, fill_x;
  Cube (int x, int y, int z){
    float n = noise(x,y,z);
    scaledn = PApplet.parseInt(n * n * inverse_cube_density);
    xd = inverse_cube_density * x;
    yd = inverse_cube_density * y;
    zd = inverse_cube_density * z;
    fill_x = abs(scaledn * 20) + 50;
  }
}

public void setup(){
  size(300,300, P3D);
  noStroke();
  lights();
  frameRate(30);
  int as = s-1;

  for(int x = 0; x < s; x++){
    for(int y = 0; y < s; y++){
      for(int z = 0; z < s; z++){
        cubes[x][y][z] = new Cube(x, y, z);
      }
    }  
  }
}

public void draw(){
  background(0);
  translate(width/2,height/2);
  t += 0.02f;
  float sint = sin(t);
  float cost = cos(t);
  float tant = tan(t);
  for(int x = 0; x < s; x++){
    for(int y = 0; y < s; y++){
      for(int z = 0; z < s; z++){
        Cube c = cubes[x][y][z];
        
        float scaledx = c.xd * sint;
        float scaledy = c.yd * cost;
        float scaledz = c.zd * tant;

        fill(c.fill_x, abs(sint) + 15, abs(sint) + 10, 250 - c.scaledn);
        pushMatrix();
        rotateX(frameCount / 100.0f);
        rotateY(frameCount / 100.0f);
        translate(scaledx, scaledy, scaledz); 
        box(c.scaledn * sint + 5);
        popMatrix();
      }
    }  
  }
  if (t > 50.0f){ t = 0.0f; }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "perlin_cubism" });
  }
}
