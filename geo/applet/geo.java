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

public class geo extends PApplet {


int cenx = 0;
int ceny = 0;

public void setup(){
  size(500,500);
  cenx = width / 2;
  ceny = height / 2;
  
  // straight horizontal
  background(255);
  strokeWeight(1);
  stroke(0xffAEAEAE);
  line(0,cenx,width,ceny);

  // center dot
  stroke(000000);
  strokeWeight(3);
  ellipse(cenx, ceny, 3, 3);
  
  // angle line

  
//  newLine(cenx,ceny,0,radius);
//  newLine(cenx,ceny,45,radius);
//  newLine(cenx,ceny,90,radius);
//  newLine(cenx,ceny,135,radius);
//  newLine(cenx,ceny,180,radius);
//  newLine(cenx,ceny,180,radius);
//  newLine(cenx,ceny,225,radius);
//  newLine(cenx,ceny,270,radius);
//  newLine(cenx,ceny,315,radius);

}

public void draw() {

  
  int angle = 0;
  int radius = 200;

  for(int i = 0; i < 10000; i++){
    newLine(cenx,ceny, (i * 5),radius);
  }
  
}

public void newLine(float x, float y, float angle, float radius){
  strokeCap(ROUND);
  strokeWeight(30);
  
  // stroke color
  int from = color(204, 102, 0);
  int to = color(0, 102, 153);
  stroke(lerpColor(from, to, cos(radians(angle))));
  
  // calculate new x, y from given angle (clockwise)
  float newx = x - (cos(radians(angle)) * radius);
  float newy = y - (sin(radians(angle)) * radius);  
  
  line(x, y, newx, newy);
}


  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "geo" });
  }
}
