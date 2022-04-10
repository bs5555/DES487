class grid
{
  float x = 100.0;
  float y = 100.0;
  grid(float xx, float xy)
  {
    this.x=xx;
    this.y = xy;
  }
  
  void show()
  {
    stroke(color(0,0,0,20));
    for(float dx =0; dx<=width; dx=dx+this.x)
    {
      line(dx,0,dx,height);  
    }
    for(float dy =0; dy<=width; dy=dy+this.y)
    {
      line(0,dy,width,dy);  
    }
  }
}
