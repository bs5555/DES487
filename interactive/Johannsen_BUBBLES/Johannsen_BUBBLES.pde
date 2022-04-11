import processing.video.*;
Movie myMovie;

int numFrames = 12;
int currentFrame = 0;
PImage[] images = new PImage[numFrames];

void setup() 
{
  size(1280,960);
  myMovie = new Movie(this, "bubbles.mov");
  myMovie.loop();
  
  background(0);
  //fullScreen();
  // Create the font
  textFont(createFont("Effra_Std_Rg.ttf", 36));
}

void draw() 
{
textAlign(CENTER, CENTER);
line(0, 850, width, 600);
text("TODAY I AM FEELING ________________", 850, 600);
   
rect(900, 575, 250, 25);
   
tint(255, 20);
image(myMovie, 0, 0);
}

void movieEvent(Movie m) {
  m.read();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    fill(0);
  } else if (mouseButton == RIGHT) {
    fill(255);
  } else {
    fill(0);
  }

 
}
