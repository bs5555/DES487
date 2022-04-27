//"Interactive Poster "OPEN YOUR EYES" Project Alexa Langelier"
/* Poster representing the naivety of the world in terms of global warming 
and other disastrous events caused by humans*/ 

PImage [] png; 
int numberofFrames;
int f;
PFont font1; 





void setup () {
   
  textSize(60);
   
  numberofFrames = 8;
   png= new PImage [numberofFrames]; 
   
   int i = 0;
   while (i < numberofFrames) {
     png [i] = loadImage("plant illustration-" + i + ".png");
     i=i+1;
     
    font1 = loadFont("AvenirNextCondensed-Regular-48.vlw"); 
     
     
   }
   
   size(900,900);
 
  
 
  
}

void draw() {
   
  image(png[f], 0, 0, width, height);
f = f + 1; 
if (f == numberofFrames) f = 0;

  textFont(font1, 60);
fill(0);
text("OPEN YOUR EYES", 100, 450);

}
