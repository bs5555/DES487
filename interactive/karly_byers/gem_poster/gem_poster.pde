
PImage bg;
PImage mask;
float x;
float y;
float easing = 0.05;


void setup() {
  size(500, 773);
  bg = loadImage("gems3-01 copy.jpg");
  mask = loadImage("dark copy.png");
}

void draw() {
  background(25,25,25);
  
  image(bg,0,0);
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  //ellipse(x, y, 110, 110);
  image(mask,x-(mask.width/2),y-(mask.height/2));

}
