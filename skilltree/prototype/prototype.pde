import controlP5.*;

float cx = 0;    // position of the circle
float cy = 0;
float r =  30;   // circle's radius

PVector[] bg = new PVector[6];
PVector[] vertices = new PVector[6];  // array of PVectors, one for each vertex in the polygon
int[] exp = new int[6];               // experience points each maxed in 100
ControlP5 cp5; //control set
perk[] p = new perk[1000]; //character perks
int nperk = 0;
rules ruleset = new rules(); 

void setup() {
  size(1000,800);
  initPerks();
  initRules();
  cp5 = new ControlP5(this);

  // set position of the vertices (here a trapezoid
   vertices=hexagon(0, 0, height*0.8);
   for(int i=0; i<6; i++)
   {
     exp[i]=5;
   }
   bg=hexagon(0, 0, height*0.8);
   cp5.addSlider("power").setPosition(10,10).setNumberOfTickMarks(21).setSize(140,20).setRange(0,100).setValue(exp[0]).setId(1).getCaptionLabel().align(CENTER,CENTER);
   cp5.addSlider("speed").setPosition(10,40).setNumberOfTickMarks(21).setSize(140,20).setRange(0,100).setValue(exp[1]).setId(2).getCaptionLabel().align(CENTER,CENTER);
   cp5.addSlider("dexterity").setPosition(10,70).setNumberOfTickMarks(21).setSize(140,20).setRange(0,100).setValue(exp[2]).setId(3).getCaptionLabel().align(CENTER,CENTER);
   cp5.addSlider("personality").setPosition(10,100).setNumberOfTickMarks(21).setSize(140,20).setRange(0,100).setValue(exp[3]).setId(4).getCaptionLabel().align(CENTER,CENTER);
   cp5.addSlider("intelligence").setPosition(10,130).setNumberOfTickMarks(21).setSize(140,20).setRange(0,100).setValue(exp[4]).setId(5).getCaptionLabel().align(CENTER,CENTER);
   cp5.addSlider("endurance").setPosition(10,160).setNumberOfTickMarks(21).setSize(140,20).setRange(0,100).setValue(exp[5]).setId(6).getCaptionLabel().align(CENTER,CENTER);
}

PVector[] hexagon(float x, float y, float tall) 
{
  PVector[] vert = new PVector[6];
  vert[0]=new PVector(x - 3.0/10.0 * tall, y - 1.0/2.0 * tall);
  vert[1]=new PVector(x + 3.0/10.0 * tall, y - 1.0/2.0 * tall);
  vert[2]=new PVector(x + 3.0/5.0 * tall, y);
  vert[3]=new PVector(x + 3.0/10.0 * tall, y + 1.0/2.0 * tall);
  vert[4]=new PVector(x - 3.0/10.0 * tall, y + 1.0/2.0 * tall);
  vert[5]=new PVector(x - 3.0/5.0 * tall, y);
  return(vert);
}

void drawHexagon(PVector[] hex,color f)
{
  noStroke();
  fill(f);
  beginShape();
  for (PVector v : hex) 
  {
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
}


void draw() {
  background(255);
  ruleset.emptyRules();
  // update circle to mouse coordinates
  cx = mouseX-(width/2);
  cy = mouseY-(height/2);

  // check for collision
  // if hit, change fill color
  boolean hit = polyCircle(vertices, cx,cy,r);
  
  pushMatrix();
  translate(width/2,height/2);
    drawHexagon(bg,color(0,0,0,50));
    for(int i =0; i<nperk; i++)
    {
      p[i].isIn();
    }
   
   vertices=hexagon(0, 0, height*0.8);
   for(int i = 0; i<6; i++)
   {
     vertices[i].x=vertices[i].x*(exp[i]/100.0);
     vertices[i].y=vertices[i].y*(exp[i]/100.0);
   }

   drawHexagon(vertices,color(255,140,0));
 
    for(int i =0; i<nperk; i++)
    {
      p[i].show();
    }
    
  popMatrix();
  ruleset.printRules();
}


// POLYGON/CIRCLE
boolean polyCircle(PVector[] vertices, float cx, float cy, float r) {

  // go through each of the vertices, plus
  // the next vertex in the list
  int next = 0;
  for (int current=0; current<vertices.length; current++) {

    // get next vertex in list
    // if we've hit the end, wrap around to 0
    next = current+1;
    if (next == vertices.length) next = 0;

    // get the PVectors at our current position
    // this makes our if statement a little cleaner
    PVector vc = vertices[current];    // c for "current"
    PVector vn = vertices[next];       // n for "next"

    // check for collision between the circle and
    // a line formed between the two vertices
    boolean collision = lineCircle(vc.x,vc.y, vn.x,vn.y, cx,cy,r);
    if (collision) return true;
  }

  // the above algorithm only checks if the circle
  // is touching the edges of the polygon – in most
  // cases this is enough, but you can un-comment the
  // following code to also test if the center of the
  // circle is inside the polygon

  boolean centerInside = polygonPoint(vertices, cx,cy);
  if (centerInside) return true;

  // otherwise, after all that, return false
  return false;
}


// LINE/CIRCLE
boolean lineCircle(float x1, float y1, float x2, float y2, float cx, float cy, float r) {

  // is either end INSIDE the circle?
  // if so, return true immediately
  boolean inside1 = pointCircle(x1,y1, cx,cy,r);
  boolean inside2 = pointCircle(x2,y2, cx,cy,r);
  if (inside1 || inside2) return true;

  // get length of the line
  float distX = x1 - x2;
  float distY = y1 - y2;
  float len = sqrt( (distX*distX) + (distY*distY) );

  // get dot product of the line and circle
  float dot = ( ((cx-x1)*(x2-x1)) + ((cy-y1)*(y2-y1)) ) / pow(len,2);

  // find the closest point on the line
  float closestX = x1 + (dot * (x2-x1));
  float closestY = y1 + (dot * (y2-y1));

  // is this point actually on the line segment?
  // if so keep going, but if not, return false
  boolean onSegment = linePoint(x1,y1,x2,y2, closestX,closestY);
  if (!onSegment) return false;

  // optionally, draw a circle at the closest point
  // on the line
  fill(255,0,0);
  noStroke();
  //ellipse(closestX, closestY, 20, 20);

  // get distance to closest point
  distX = closestX - cx;
  distY = closestY - cy;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // is the circle on the line?
  if (distance <= r) {
    return true;
  }
  return false;
}


// LINE/POINT
boolean linePoint(float x1, float y1, float x2, float y2, float px, float py) {

  // get distance from the point to the two ends of the line
  float d1 = dist(px,py, x1,y1);
  float d2 = dist(px,py, x2,y2);

  // get the length of the line
  float lineLen = dist(x1,y1, x2,y2);

  // since floats are so minutely accurate, add
  // a little buffer zone that will give collision
  float buffer = 0.1;    // higher # = less accurate

  // if the two distances are equal to the line's
  // length, the point is on the line!
  // note we use the buffer here to give a range, rather
  // than one #
  if (d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer) {
    return true;
  }
  return false;
}


// POINT/CIRCLE
boolean pointCircle(float px, float py, float cx, float cy, float r) {
  
  // get distance between the point and circle's center
  // using the Pythagorean Theorem
  float distX = px - cx;
  float distY = py - cy;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the circle's 
  // radius the point is inside!
  if (distance <= r) {
    return true;
  }
  return false;
}


// POLYGON/POINT
// only needed if you're going to check if the circle
// is INSIDE the polygon
boolean polygonPoint(PVector[] vertices, float px, float py) {
  boolean collision = false;

  // go through each of the vertices, plus the next
  // vertex in the list
  int next = 0;
  for (int current=0; current<vertices.length; current++) {

    // get next vertex in list
    // if we've hit the end, wrap around to 0
    next = current+1;
    if (next == vertices.length) next = 0;

    // get the PVectors at our current position
    // this makes our if statement a little cleaner
    PVector vc = vertices[current];    // c for "current"
    PVector vn = vertices[next];       // n for "next"

    // compare position, flip 'collision' variable
    // back and forth
    if (((vc.y > py && vn.y < py) || (vc.y < py && vn.y > py)) &&
         (px < (vn.x-vc.x)*(py-vc.y) / (vn.y-vc.y)+vc.x)) {
            collision = !collision;
    }
  }
  return collision;
}

void mousePressed() 
{
  boolean found = false;
  for(int i =0; i<nperk; i++)
  {
    found = p[i].clicked();
    if(found) i=nperk;
  }  
}

void mouseReleased()
{
  for(int i =0; i<nperk; i++)
  {
    p[i].moved = false;
  }  
}

void mouseDragged()
{
  for(int i =0; i<nperk; i++)
  {
    p[i].move();
  }  
}

public void controlEvent(ControlEvent theEvent) 
{
  int name = theEvent.getController().getId();
  switch(name)
  {
    case 1 : exp[0] = floor(cp5.getController("power").getValue()); break;
    case 2 : exp[1] = floor(cp5.getController("speed").getValue()); break;
    case 3 : exp[2] = floor(cp5.getController("dexterity").getValue()); break;
    case 4 : exp[3] = floor(cp5.getController("personality").getValue()); break;
    case 5 : exp[4] = floor(cp5.getController("intelligence").getValue()); break;
    case 6 : exp[5] = floor(cp5.getController("endurance").getValue()); break;
  }  
}  

void initRules()
{
  ruleset.addRule("enemy_power_modifier",0);
  ruleset.addRule("enemy_defence_modifier",0);
  ruleset.addRule("enemy_damage_modifier",0);
  ruleset.addRule("enemy_accuracy_modifier",0);
  ruleset.addRule("enemy_dodge_modifier",0);
  ruleset.addRule("own_power_modifier",0);
  ruleset.addRule("own_defence_modifier",0);
  ruleset.addRule("own_accuracy_modifier",0);
  ruleset.addRule("own_damage_modifier",0);
  ruleset.addRule("own_dodge_modifier",0);
  ruleset.addRule("enemy_stun_chance_modifier",0);
  ruleset.addRule("enemy_stun_cooldown_modifier",0);
  ruleset.addRule("own_stun_chance_modifier",0);
  ruleset.addRule("own_stun_cooldown_modifier",0);
  ruleset.addRule("enemy_turned",0);
  ruleset.addRule("enemy_stunned_damage_modifier",0);
  ruleset.addRule("spell_fire",0);
  ruleset.addRule("spell_water",0);
  ruleset.addRule("spell_earth",0);
  ruleset.addRule("spell_air",0);
  ruleset.addRule("spell_fire_water",0);
  ruleset.addRule("spell_earth_air",0);
  ruleset.addRule("hp_modifier",0);
  ruleset.addRule("hp_rate",0);
  ruleset.addRule("hp_on_hit",0);
  ruleset.addRule("acess_weapon_class_1",0);
  ruleset.addRule("acess_weapon_class_2",0);
  ruleset.addRule("acess_weapon_class_3",0);
  ruleset.addRule("acess_armor_class_1",0);
  ruleset.addRule("acess_armor_class_2",0);
  ruleset.addRule("acess_armor_class_3",0);
  ruleset.addRule("hit_num",0);
  ruleset.addRule("hit_angle",0);
}

public void initPerks()
{
   nperk = 0;
   p[nperk] = new perk("Charm",300,300,30).addRule("enemy_power_modifier",-20); nperk++;
   p[nperk] = new perk("Flirt",200,300,30).addRule("own_defence_modifier",20); nperk++;
   p[nperk] = new perk("Beauty",200,300,30).addRule("enemy_stun_chance_modifier",20); nperk++;
   p[nperk] = new perk("Seduction",200,300,30).addRule("enemy_turned",10); nperk++;
   p[nperk] = new perk("Surrender",200,300,30).addRule("enemy_stunned_damage_modifier",30); nperk++;
   
   
}
