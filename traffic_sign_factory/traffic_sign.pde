class traffic_sign
{
  String[] bg = {"rectangle.svg","warning.svg","stop.svg"}; //background svgs
  String prohibited = "prohibited.svg";                     //prohibited sign svg
  sentence txt;                                             //random sentence
  String background = "";
  int foreground = 0;
  String[] rect;
  String[] warn;
  String[] stop;
  
  
  traffic_sign()
  {
    this.background=bg[round(random(bg.length-1))];   //select a random bg
    if(this.background=="rectangle.svg")              // if background is a rectangle
    {
      float r = random(1);
      if(r<0.5)  //in the 50% of cases it will be prohibited
      {
        this.foreground=1;
      } 
    }
    txt = new sentence("BEWARE_OF_HEDGEHOGS");
    txt.add("BEWARE","HIT ALL_LOOK OUT_SENSUALIZE_EDUCATE ALL_MAKE HAPPY NONE");
    txt.add("HEDGEHOGS","GIRAFFES_LINES_KIDS_MARRIAGES_WOLFS_WORDS");
    
  }
  
  void make()
  {
    PShape b = loadShape(this.background);
    b.enableStyle();
    shape(b,0,0);
    
    if(this.background.equals("stop.svg"))      this.drawMotiv(this.stop);
    if(this.background.equals("warning.svg"))   
    {
       String res = txt.make();
       fill(0);
       textSize(64);
       textAlign(CENTER);
       text(res,(width/2)-100, (height/2)-100, (width/2)-100, (height/2)-100 );
    }
    if(this.background.equals("rectangle.svg")) 
    
    
    if(this.foreground >= 1) 
    {
      PShape p = loadShape(this.prohibited);
      p.enableStyle();
      shape(p,0,0);
    }  
  }
  
  void fillWarn(String value)
  {
    this.warn = value.split(",");
  }
  
  void fillStop(String value)
  {
    this.stop = value.split(",");
  }
  
  void fillRect(String value)
  {
    this.rect = value.split(",");
  }
  
  void drawMotiv(String[] motives)
  {
      String motiv = motives[round(random(this.stop.length-1))];
      PShape p = loadShape(motiv);
      p.enableStyle();
      shape(p,0,0);
  }
  
}
