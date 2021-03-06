circ[] c =new circ[1000];
int ncirc = 1;
PFont font;


void setup() 
{
   //size(1000,600);
   fullScreen();
   font = createFont("Lato-Black.ttf",width/12);
   for(int i = 0; i < ncirc; i = i + 1)
   {
     c[i]=new circ();
   }
   background(12);
}

void draw()
{
  fill(color(0,0,0,10));
  noStroke();
  rect(0,0,width,height);
  for(int i = 0; i < ncirc; i = i + 1)
  {
    c[i].show();
  }
  showText();
}

void burst()
{
  float cx = mouseX;
  float cy = mouseY;
  fill(255);
  noStroke();
  circle(cx,cy,random(width/10,width/5));
  
}

void showText()
{
  textFont(font);
  textAlign(CENTER, CENTER);
  fill(color(12,12,12));
  text("IT IS BETTER TO LIGHT A CANDLE THAN TO CURSE THE DARKNESS",0,0,width,height);
}

void mousePressed()
{
  burst();
  showText();
}
