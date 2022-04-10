dcurve cs = new dcurve();
ArrayList<dcurve> steps = new ArrayList<dcurve>();
int step = 0;
float state = 0.0;

void setup()
{
  size(1000,1000);
  cs = new dcurve();
  cs.addCurve(400.0,501.0,401.0,436.0,500.0,399.0,440.0,399.99997);
  cs.addCurve(500.0,399.0,560.0,398.00003,601.0,501.0,600.0,432.0);
  cs.addCurve(601.0,501.0,602.0,570.0,500.0,600.0,562.0,599.0);
  cs.addCurve(500.0,600.0,438.0,601.0,400.0,501.0,399.0,566.0);
  steps.add(cs);
  
  cs = new dcurve();
  cs.addCurve(6.0,498.0,6.000005,93.0,503.0,8.0,208.0,6.0);
  cs.addCurve(503.0,8.0,798.0,10.0,992.0,512.0,992.0,203.0);
  cs.addCurve(992.0,512.0,992.0,821.0,464.0,740.0,586.0,740.0);
  cs.addCurve(464.0,740.0,342.0,740.0,6.0,498.0,5.999995,903.0);
  steps.add(cs);
  
  cs = new dcurve();
  cs.addCurve(1.0,551.0,5.000138,-50.0,544.0,16.0,19.0,19.00001);
  cs.addCurve(544.0,16.0,1069.0,12.99999,987.0,548.0,984.0,34.00006);
  cs.addCurve(987.0,548.0,990.0,1062.0,464.0,740.0,586.0,740.0);
  cs.addCurve(464.0,740.0,342.0,740.0,1.0,551.0,-3.0001378,1152.0);
  steps.add(cs);
}

void draw()
{
  background(255);
  if(state>1)
  {
    state=0.0;
    step++;
    if(step > steps.size()-1)
    {
      step=0;
    }
  }
  int next=step+1;
  if(next > steps.size()-1) 
  {
    next=0;
  }
  dcurve act  = interpolate(steps.get(step),steps.get(next),state);
  //act.test();
  act.show();
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
}
