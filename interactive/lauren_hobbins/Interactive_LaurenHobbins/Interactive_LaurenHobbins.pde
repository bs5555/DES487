import processing.sound.*;

Amplitude amp;
AudioIn in;
String txt;
//String txt2;
PImage img;
PImage txt_f;
float y = 0;
PFont f;
void setup() {
  //size(1280, 720, P3D); 
  fullScreen(P3D);
  //f = createFont("Barlow-Regular.ttf",width*0.04,true); 
  //String[] lines = loadStrings("space.txt");
  //String[] state = loadStrings("space_tag.txt");
  //txt = join(lines, "\n");
  //txt2 = join(state,"/n");
  y = height/2;
  img = loadImage("prideflag_cutout.png");
  txt_f = loadImage("text_flag.png");
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw() {
  background(0);

  imageMode(CENTER);
  image(img,800,750);
  fill(color(0,0,0,255-(amp.analyze()*300)));
  rect(0,0,width,height);

  imageMode(CORNER);
  image(txt_f,(width-txt_f.width)/2,y);
  y-=2;
  if(y<txt_f.height*-1) y= height;
  println(y);

}
