grid g;
cshape sh;


void setup()
{
  size(1000,1000);
  rectMode(CENTER);
  smooth();
  strokeWeight(1);
  g =  new grid(100,100);
  sh = new cshape(4);
  createCircle();  
}

void draw()
{
  background(color(255,255,255));
  g.show();   
  sh.interaction();  
  sh.show();
}

void createCircle()
{
  float size = 12.0;
  float d = width/size;
  float l = 800.0/size;
  float cx = width/2.0-(d*2);
  float cy = height/2.0-(d*2);
  
  sh.addPoint(d+cx,d+cy,-45.0,l,l);
  sh.addPoint((3*d)+cx,d+cy,45.0,l,l);
  sh.addPoint((3*d)+cx,(3*d)+cy,135.0,l,l);
  sh.addPoint(d+cx,(3*d)+cy,-135.0,l,l);
}

void keyReleased() 
{
  sh.print();
}
