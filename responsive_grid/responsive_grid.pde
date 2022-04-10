float dx = 0;    //width of a cell
float dy = 0;    //height of a cell
float nx = 15;   //divisions in a row
float ny = 15;   //divisions in a column

void setup()
{
  surface.setSize(1000,500);
  surface.setResizable(true);
  surface.setTitle("Resizable example"); 
}

void draw()
{
  
  dx = width/nx;
  dy = height/ny;
  background(color(155,100,0));
  for(float y = 0; y < height; y = y +dy)
  {
    for(float x = 0; x < width; x = x + dx)
    {
      fill(color(random(255),random(255),random(255)));
      noStroke();
      rect(x,y,dx,dy);
    }  
  }
}
