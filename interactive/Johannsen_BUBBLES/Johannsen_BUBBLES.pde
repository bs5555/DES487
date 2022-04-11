import processing.video.*;
Movie[] myMovie = new Movie[50];
int nMovies=6;
int played = 1;
int state = 0;

void setup() 
{
  size(1280,960);
  for(int i = 0; i < nMovies; i++)
  {
    myMovie[i] = new Movie(this, "b"+i+".mp4");
  }  
  background(0);
  //fullScreen();
  // Create the font
  textFont(createFont("Effra_Std_Rg.ttf", 36));
}

void draw() 
{
  if(state==0)
  {
    textAlign(CENTER, CENTER);
    line(0, 850, width, 600);
    text("TODAY I AM FEELING ________________", 850, 600);
    rect(900, 575, 250, 25);
  }  
  if(state==1)
  {
    image(myMovie[played], 0, 0);
    if(!myMovie[played].isPlaying()) 
    {
      myMovie[played].stop();
      state = 0;
    }  
  } 
//tint(255, 20);
}

void movieEvent(Movie m) {
  m.read();
}

void mousePressed() 
{
  if(state==0) 
  {
    state = 1;
    played = floor(random(nMovies));
    myMovie[played].play();
  }  
}
