class perk
{
  float cx = 0;
  float cy = 0;
  float r = 10.0;
  String label = "";
  boolean moved = false; 
  
  perk(String lab_,float cx_, float cy_, float r_)
  {
    this.label= lab_;
    this.cx=cx_;
    this.cy=cy_;
    this.r=r_;
  }
  
  void show()
  {
    noStroke();
    fill(color(255,100,100,100));
    circle(this.cx,this.cy,this.r);
    fill(0);
    text(this.label,this.cx,this.cy);
  }
  
  void clicked()
  {
    float cx = mouseX-(width/2);
    float cy = mouseY-(height/2);
    PVector mouse = new PVector(cx,cy);
    PVector pos = new PVector(this.cx,this.cy);
    PVector d = mouse.sub(pos);
    if(d.mag() < this.r) 
    {
      this.moved = true;
      this.cx=cx;
      this.cy=cy;
      println(this.moved);
    }  
  }
  
  void move()
  {
   println(this.moved); 
    if(this.moved)
    {
      float cx = mouseX-(width/2);
      float cy = mouseY-(height/2);
      PVector mouse = new PVector(cx,cy);
      PVector pos = new PVector(this.cx,this.cy);
      PVector d = mouse.sub(pos);
      this.cx=cx;
      this.cy=cy;
      
      
    }
  }
  
  
  
  
  
}
