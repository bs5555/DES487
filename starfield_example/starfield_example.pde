import processing.video.*;
float w = 25;
int videox = 640;
int videoy = 480;


Capture cam;

void setup() 
{
  fullScreen();  
  cam = new Capture(this, videox, videoy);
  cam.start();
}

void draw() 
{  
  if(cam.available()) 
  {
    background(0);
    cam.read(); 
    cam.loadPixels();
    starfield();
  }
 
}


void starfield()
{
  float xrat = width/videox;
  float yrat = height/videoy;
  println(xrat);
  println(yrat);
  println("-----------");
  noStroke();  
  for(int i = 0; i< 10000; i++)
  {
    int x = floor(random(videox-1));
    int y = floor(random(videoy-1));
    int n = (y*videox)+x;    
    fill(255);    
    circle(x*xrat,y*yrat,brightness(cam.pixels[n])/50);
  }
}
