sentence example;
PFont font;
float a = 0;


void setup()
{
  size(1000,1000);
  example = new sentence("I_made_my_homework"); 
  example.add("I","You_Peter_Nobody_The devil_Whoever");
  example.add("made","stole_get_hide_nailed");
  example.add("my","your_his_hated_loved_long_awaited");
  example.add("homework","piece_case_instance_bag_victim_sacrifice");
  font = createFont("Volkhov-Regular.ttf",64);
  textFont(font);
}

void draw()
{
  background(255);
  String res = example.make();
  fill(0);
  textSize(64);
  scale(1+sin(radians(a)),1.0);
  a = a+1;
  println(a);
  text(res,100, 100,width-200,height);
  //delay(1000);
}
