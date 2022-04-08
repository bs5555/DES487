class sq
{
  float px = 0;
  float py = 0;
  float w = d;
  float h = d;
  color c = color(0,0,0,255);
  
  sq(float xpos, float ypos)
  {
    this.px = xpos;
    this.py = ypos;
  }
  
  void show()
  {
    noStroke();
    fill(this.c);
    rect(this.px,this.py,this.w,this.h);
  }
  
  void change()
  {
    float op =  alpha(this.c);
    op = op+random(2);
    if(op>255) op=255;
    
    this.c = color(0,0,0,op);
  }
  
  void clicked(int mx, int my)
  {
    if(mx > this.px && mx < this.px+this.w && my > this.py && my < this.py+this.h)
    {
      println("clicked");
      this.c = color(0,0,0,1);
    }
  }
}
