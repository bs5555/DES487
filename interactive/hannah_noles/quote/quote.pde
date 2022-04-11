sq[] square = new sq[10000];
int counter = 0;
int d = 100;
PImage img;
int savedTime;
int totalTime = 1000;
int passedTime = 0;

void setup()
{
  //surface.setSize(1000,500);
  //surface.setResizable(true);
  //surface.setTitle("Resizable example");
  fullScreen();
  img = loadImage("mouse.png");
  d = round(width/12);
  for(int y = 0; y < height; y = y + d)
  {
   for(int x = 0; x < width; x = x + d)
   {
     square[counter] = new sq(x,y);
     counter = counter + 1;
   }
  }
  
  
  //size(1000,1000);
  noStroke();
  fill(255);
  
  PFont mono;
  mono = createFont("LEMONMILK-Medium.otf", width/15);
  background(0);
  textFont(mono);
  textAlign(CENTER,CENTER);
}

void draw()
{
 image(img,0,0);
 background(0);
 fill(255);
 text("BE SLOW IN CHOOSING, BUT SLOWER IN CHANGING",100,0,width-200,height);
 
 for(int i=0; i<counter; i=i+1)
  {
   square[i].change();
   square[i].show();
  }
  passedTime = millis() - savedTime;
  if(passedTime > totalTime) 
  {
    savedTime = millis();
    clickSimulation();    
  }
}

void mousePressed()
{
  for(int i=0; i<counter; i=i+1)
  {
   square[i].clicked(mouseX,mouseY);
  }
  savedTime = millis();
}

void clickSimulation()
{
  for(int i=0; i<counter; i=i+1)
  {
   square[i].clicked(round(random(width)),round(random(height)));
  }
}
