//control point object
class cpoint
{
  float x = 0.0;
  float y = 0.0;
  float d1 = 10.0;
  float d2 = 10.0;
  float a = 0.0;
  float cx1 = 0.0;
  float cy1 = 0.0;
  float cx2 = 0.0;
  float cy2 = 0.0;
  int i = 0;
  
  cpoint(float xx, float xy, float xa, float xd1, float xd2)
  {
    this.x=xx;
    this.y=xy;
    this.a=xa;
    this.d1 = xd1;
    this.d2 = xd2;
  }
}

class foundPoint
{
  int i = -1;
  int p = -1;
}

//shape object
class cshape
{
  cpoint[] p;
  foundPoint f;
  int cindex = 0;
    
  cshape(int n)
  {
    this.p = new cpoint[n];
    this.f =  new foundPoint();
  }
  
  //add a point to the shape
  void addPoint(float x, float y, float a, float d1, float d2)
  {
    this.p[this.cindex] = new cpoint(x,y,a,d1,d2);
    accountControlPoints(this.cindex);
    this.p[this.cindex].i=this.cindex;
    cindex++;
  }
  
  //account controlpoints
  void accountControlPoints(int i)
  {
    float cx1 = -p[i].d1;
    float cx2 = p[i].d2;
    float cy1 = 0;
    float cy2 = 0;
    pushMatrix();        
      translate(p[i].x,p[i].y);
      rotate(radians(p[i].a));
      this.p[i].cx1=screenX(cx1,cy1);
      this.p[i].cy1=screenY(cx1,cy1);
      this.p[i].cx2=screenX(cx2,cy2);
      this.p[i].cy2=screenY(cx2,cy2);            
    popMatrix();
  }
  
  void interaction()
  {    
    if(mousePressed == true) 
    {
      if(this.f.i==-1)
      {
        for(cpoint z : this.p)
        {
          float d=dist(mouseX,mouseY,z.x,z.y);
          if(d<40) this.f.i=z.i; //point was found
          d=dist(mouseX,mouseY,z.cx1,z.cy1);
          if(d<40) {this.f.i=z.i; this.f.p=1;} //1st control point was found
          d=dist(mouseX,mouseY,z.cx2,z.cy2);
          if(d<40) {this.f.i=z.i; this.f.p=2;} //2st control point was found
        }  
      }
    }
    else
    {
      this.f.i=-1;
      this.f.p=-1;
    }
    this.repPoint();    
  }
  
  void repPoint()
  {    
    if(this.f.i>=0)
    {
      if(this.f.p==-1)
      {
        this.p[this.f.i].x=mouseX;
        this.p[this.f.i].y=mouseY;
        accountControlPoints(this.f.i);
      }
      else
      {
        float d=dist(mouseX,mouseY,this.p[this.f.i].x,this.p[this.f.i].y);        
        float a=this.ang(mouseX,mouseY,this.p[this.f.i].x,this.p[this.f.i].y);
        this.p[this.f.i].d1=d;
        this.p[this.f.i].d2=d;        
        this.p[this.f.i].a=a;
        accountControlPoints(this.f.i);
      }
    }  
  }
  
  //get angle form two vectors
  float ang(float x1, float y1, float x2, float y2) 
  {
    float angle;
    float dx = x2 - x1;      // Run.
    float dy = y2 - y1;      // Rise.
    float slope = dy/dx;     // Slope = rise/run.
    if (dx >= 0 && dy >= 0) 
    {
      angle = degrees(atan(slope));
    }
    else if (dx < 0 && dy > 0) 
   {
      angle = degrees(atan(slope)) + 180;
    }
    else if (dx < 0 && dy <= 0) 
    {
      angle = degrees(atan(slope)) + 180;
    }
    else if (dx >=0 && dy < 0) 
    {
      angle = degrees(atan(slope)) + 360;
    }
    else angle = 1000; // This should never be true, but seems needed for println().
    return(angle);
  }
  
  void show()
  {
    for(cpoint z : this.p)
    {
      noStroke();
      fill(color(0,100,255,100));      
      ellipse(z.x,z.y,10,10);      
      fill(color(255,100,0,100));
      ellipse(z.cx1,z.cy1,10,10);
      fill(color(100,255,0,100));
      ellipse(z.cx2,z.cy2,10,10);
      strokeWeight(1);
      stroke(color(0,140,255));
      line(z.cx1,z.cy1,z.cx2,z.cy2);      
    }
    noFill();
    stroke(color(0,0,0));
    for(int i=0; i < p.length; i++)
    {
      int m=i+1;
      if(m>=p.length) m = 0;
      bezier(
      p[i].x,p[i].y,p[i].cx2,p[i].cy2,
      p[m].cx1,p[m].cy1,p[m].x,p[m].y);
    }
  }
  
  void print()
  {
    String res = "";
    for(int i=0; i < p.length; i++)
    {
      int m=i+1;
      if(m>=p.length) m = 0;
      res=res+"cs.addCurve("+p[i].x+","+p[i].y+","+p[i].cx2+","+p[i].cy2+","+p[m].x+","+p[m].y+","+p[m].cx1+","+p[m].cy1+");\n";
    }
    println(res);
  }
}
