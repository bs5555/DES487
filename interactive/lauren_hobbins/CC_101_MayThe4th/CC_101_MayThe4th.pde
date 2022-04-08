import processing.sound.*;

Amplitude amp;
AudioIn in;
String txt;
//String txt2;
PImage img;
PImage textimg;
float y = 0;
PFont f;
void setup() {
  // size(1280, 720, P3D); 
  fullScreen(P3D);
  f = createFont("Barlow-Regular.ttf",width*0.04,true); 
  String[] lines = loadStrings("space.txt");
  //String[] state = loadStrings("space_tag.txt");
  txt = join(lines, "\n");
  //txt2 = join(state,"/n");
  y = height/2;
  img = loadImage("prideflag_cutout.png");
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  textimg = loadImage("text.png");
}

void draw() {
  background(0);
  imageMode(CENTER);
  image(img,800,750);
  tint(amp.analyze()*7000.0);
  
  image(textimg,0,y);
  y-=2;

 /*translate(width/2, height/-2);
 textFont(f);
  fill(255);
  //textSize(width*0.04);

  textAlign(CENTER);
  //rotateX(PI/4);
  float w = -width*0.6;
  text(txt, -w/2, y, w, height*10);
  image(textimg,0,y);
  ///text(txt2, -w/2, y, w, height*10);
  y-=2;
 push();
    textFont(f);
    fill(255);
    text("Say no to the Don't Say Gay Bill",800,500);
    textAlign(BOTTOM, LEFT);
    
pop();*/
 
}
