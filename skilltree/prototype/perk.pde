class perk
{
  float cx = 0;
  float cy = 0;
  float r = 10.0;
  String label = "";
  boolean moved = false; 
  rule[] rules = new rule[10];
  int nRules = 0;
  color c = 0;
  
  
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
    fill(color(this.c,100));
    circle(this.cx,this.cy,this.r);
    fill(0);
    text(this.label,this.cx,this.cy);
  }
  
   boolean clicked()
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
      return(true);
    } 
    return(false);
  }
  
  void move()
  {
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
  
  perk addRule(String _name, int _value)
  {
    this.rules[this.nRules]=new rule(_name,_value);
    this.nRules++;
    return(this);
  }
  
  boolean isIn()
  {
    boolean res = polyCircle(vertices, this.cx,this.cy,this.r/2.0);
    if(res)
    {
      this.c=color(255,0,200,200);
      for(int i = 0; i<this.nRules; i++)
      {
        ruleset.modifyRule(this.rules[i].name, this.rules[i].value);
      }
    }
    else
    {
      this.c=color(100,100,255,200);
    }
    return(res);
  }
  
  
  
  
  
}
