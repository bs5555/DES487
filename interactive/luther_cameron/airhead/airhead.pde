import processing.sound.*;

PShape svg;
PGraphics pg;

Amplitude amp;
AudioIn in;

PFont font;
SoundFile puck;

dcurve cs = new dcurve();
ArrayList<dcurve> steps = new ArrayList<dcurve>();
int step = 0;
float state = 0.0;
float textstate = 0.0;
float textangle = 0.0;
int pgx = 740;
int pgy = 1000;

void setup()
{
   fullScreen();
  //load body, font and soundfile
  svg = loadShape("body.svg");
  font=createFont("font.ttf",300);
  puck = new SoundFile(this, "pop1.wav");
  
  // Create an Input stream which is routed into the Amplitude analyzer
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  pg = createGraphics(740, 1000);
 
  
  //Create the Animation states
  cs = new dcurve();
  cs.addCurve(356.0,466.0,402.0,464.0,429.0,554.0,426.0,504.0);
  cs.addCurve(429.0,554.0,432.0,604.0,366.0,662.0,413.0,661.0);
  cs.addCurve(366.0,662.0,319.0,663.0,291.0,563.0,292.0,606.0);
  cs.addCurve(291.0,563.0,290.0,520.0,356.0,466.0,310.0,468.0);
  steps.add(cs);
  
  
  cs = new dcurve();
  cs.addCurve(200.0,202.0,247.14044,154.85956,648.0,353.0,600.85956,305.85956);
  cs.addCurve(648.0,353.0,695.14044,400.14044,453.0,657.0,513.0,599.0);
  cs.addCurve(453.0,657.0,393.0,715.0,52.0,652.0,99.14045,699.14044);
  cs.addCurve(52.0,652.0,4.8595505,604.85956,200.0,202.0,152.85956,249.14044);
  steps.add(cs);
  
  cs = new dcurve();
  cs.addCurve(49.0,52.0,96.14045,4.8595505,701.0,56.0,653.85956,8.85955);
  cs.addCurve(701.0,56.0,748.14044,103.14045,699.0,653.0,746.14044,605.85956);
  cs.addCurve(699.0,653.0,651.85956,700.14044,52.0,652.0,99.14045,699.14044);
  cs.addCurve(52.0,652.0,4.8595505,604.85956,49.0,52.0,1.8595505,99.14045);
  steps.add(cs);
  
  
}

void draw()
{
  background(255);
  pg.beginDraw();
  pg.fill(255);
  pg.rect(0,0,pgx,pgy);
  pg.shape(svg);
  int next = 0;
  if(state>1)
  {
    state=0.0;
    step++;
    if(step > steps.size()-1)
    {
      step=0;
    }    
  }  
  next=step+1;
  if(next > steps.size()-1) 
  {
    step=0;
    next=1;
    puck.play();
    state=0.0;
    textstate=0.0;
  }
  dcurve act  = interpolate(steps.get(step),steps.get(next),state);
  //act.test();
  act.show();
  
  showText(act);
  
 if(amp.analyze() > 0.01) 
  {
    state=state+0.001;
    textstate=textstate+0.001;
    textangle = random(5)-random(5);
  }
  else  
  {
    //state=state-0.000001;
    //if(state < 0) state=0.0;
    //textstate=textstate-0.000001;
    //if(textstate < 0) textstate=0.0;
  }
  pg.endDraw();
  image(pg,(width/2)-(pg.width/2),height-pg.height);  
  //println(textangle);
}

void showText(dcurve dc)
{
  float mx = 0.0;
  float my = 0.0;
  for(int i = 0; i<dc.c; i++)
  {
    mx=mx+dc.curves[i].get(1);
    my=my+dc.curves[i].get(7);
  }
  mx=mx/dc.c;
  my=my/dc.c;
  pg.fill(255);
  pg.textAlign(CENTER);
  pg.textFont(font);
  pg.pushMatrix();
    pg.translate((pg.width/2)-10,my);
    pg.scale((textstate/4)+0.1);
    pg.rotate(radians(textangle));
    /*stroke(color(255,10,10));
    strokeWeight(1);
    circle(0,0,100);*/    
    pg.text("airhead",0,0);
  pg.popMatrix();
 
}

dcurve interpolate(dcurve prev,dcurve next, float n)
{
  dcurve cc = new dcurve();
  for(int i=0; i<4; i++)
  {
    cc.addCurve(
      lerp(prev.curves[i].get(0),next.curves[i].get(0),state),
      lerp(prev.curves[i].get(1),next.curves[i].get(1),state),
      lerp(prev.curves[i].get(2),next.curves[i].get(2),state),
      lerp(prev.curves[i].get(3),next.curves[i].get(3),state),
      lerp(prev.curves[i].get(6),next.curves[i].get(6),state),
      lerp(prev.curves[i].get(7),next.curves[i].get(7),state),
      lerp(prev.curves[i].get(4),next.curves[i].get(4),state),
      lerp(prev.curves[i].get(5),next.curves[i].get(5),state)
    );
   }
  return(cc);
}

void mouseClicked()
{
  state=state+0.01;
  textstate=textstate+0.01;
  textangle = random(5)-random(5);
}
