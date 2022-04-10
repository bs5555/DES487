void setup()
{
  surface.setSize(1000,500);
  surface.setResizable(true);
  surface.setTitle("Resizable example"); 
}

void draw()
{
  //background(color(155,100,0));
  pushMatrix();
    translate(width/2,height/2);
    scale(min(width,height));
    noStroke();
    fill(255);
    //all values is within -1 to 1 from now 
    circle(0,0,1);
    fill(color(random(255),random(255),random(255)));
    rect(random(1)-0.5,random(1)-0.5,0.01,0.01);
  popMatrix();
}  
