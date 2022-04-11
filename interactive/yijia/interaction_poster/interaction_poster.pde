
PImage monalisa;
spot[] spots = new spot[9];
PShape locket; 
PShape unlocket;
PImage yellow1;
PImage yellow2;
PImage yellow3;
PImage yellow4;
PImage yellow5;
PImage unlockimage;
int status = 0;
int astatus = 0;

String win = "247";
String tip = "";


 
void setup()
{
  size(450,800);
  //frameRate(24);
  monalisa = loadImage("mona.png");
  locket = loadShape("lock1.svg");
  unlocket=loadShape("unlocket.svg");
  yellow1=loadImage("element1.png");
  yellow2=loadImage("element2.png");
  yellow3=loadImage("element3.png");
  yellow4=loadImage("element4.png");
  yellow5=loadImage("element5.png");
  unlockimage=loadImage("monalisa2.PNG");
  
  int i = 0;
  for(int y = -1; y<2; y++)
  {
    for(int x = -1; x<2; x++)
    {
      spots[i] = new spot((x*150)+(width/2),(y*150)+(height/2),i);
      i++;
    }  
  }
}

void draw()
{
  
  background(0);
  image(monalisa,0,0);
  //println(status);
  if(status==0)
  {
    lock();
  }
  if(status == 1)
  {
    animation();
  }
  if(status==2 || status==3 || status==4)
  {
    lock();
  }
  if(status==6)
  {
    unlock();
  }
}

void animation()
{
  if(astatus > 25) image(yellow1,-80 ,80,550,500);
  if(astatus > 50) image(yellow2,-80 ,80,550,500);
  if(astatus > 75) image(yellow3,-25 ,80,550,700);
  if(astatus > 100) image(yellow4,-25 ,80,550,700);
  if(astatus > 125) image(yellow5,15 ,65,400,750);
  if(astatus > 150) status = 2;
  astatus++;
}

void lock()
{
  noStroke();
  fill(0,0,0,100);
  rect(0,0,width,height);
  for(int i = 0;  i<9; i++)
  {
    spots[i].show();
  }
  shape(locket,width/2,height-100);
}

void mouseClicked()
{
  if(status==0)
  {
    status = 1;
    astatus = 0;
  }
  if(status > 1 && status < 5)
  {
    for(int i = 0;  i<9; i++)
    {
      spots[i].clicked();
    }
  }
  if(status == 5)
  {
    if(tip==win)
    {
      println("WIN");
    }
    else
    {
      println("LOOSE");
    }
    if (tip==win)
    {
      status=6;
    }
  }
}



class spot
{
  float cx = 0;
  float cy = 0;
  float d = 50;
  int n = 0;
  
  spot(float x, float y, int num)
  {
    this.cx = x;
    this.cy = y;
    this.n = num;
  }
  
  void show()
  {
    noStroke();
    if(mouseX > cx-(d/2) && mouseX < cx+(d/2) && mouseY > cy-(d/2) && mouseY < cy+(d/2))
    {
      fill(255,100,100,255);
    }
    else
    {
      fill(255,255,255,200);
    }
    circle(cx,cy,d);
    fill(255,0,0);
    text(this.n,cx,cy);
  }
  
  void clicked()
  {
    if(mouseX > cx-(d/2) && mouseX < cx+(d/2) && mouseY > cy-(d/2) && mouseY < cy+(d/2))
    {
      status = status + 1;
      tip = tip + this.n;
      println(tip);
    }
  }
}

 void unlock()
  {
    
    shape(unlocket,width/2,height-100);
  }
