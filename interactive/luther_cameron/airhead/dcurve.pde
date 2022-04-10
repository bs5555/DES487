class dcurve
{
 FloatList[] curves = new FloatList[100];
 int c = 0;
 

 void addCurve(float x1,float y1,float cx1,float cy1,float x2,float y2,float cx2,float cy2)
 {   
   curves[c]=new FloatList();
   curves[c].append(x1);
   curves[c].append(y1);
   curves[c].append(cx1);
   curves[c].append(cy1);
   curves[c].append(cx2);
   curves[c].append(cy2);
   curves[c].append(x2);
   curves[c].append(y2);   
   c++;
 }
 
 
 void show()
 {
   pg.fill(0);
   pg.noStroke();
   pg.beginShape();  
   for(int i = 0; i<c; i++)
   {
     pg.vertex(curves[i].get(0),curves[i].get(1));
     pg.bezierVertex(
       curves[i].get(2),
       curves[i].get(3),
       curves[i].get(4),
       curves[i].get(5),
       curves[i].get(6),
       curves[i].get(7)
     );     
   }
   pg.endShape();   
 }
 
 void test()
 {
   for(int i = 0; i<c; i++)
   {
     pg.noFill();
     pg.stroke(color(0,0,100,110));
     pg.strokeWeight(2);
     pg.bezier(
       curves[i].get(0),
       curves[i].get(1),
       curves[i].get(2),
       curves[i].get(3),
       curves[i].get(4),
       curves[i].get(5),
       curves[i].get(6),
       curves[i].get(7)
     );
     pg.noStroke();
     pg.fill(color(0,0,100,110));
     pg.ellipse(curves[i].get(0),curves[i].get(1),12,12);
     pg.ellipse(curves[i].get(6),curves[i].get(7),12,12);
     pg.fill(color(100,0,0,110));
     pg.ellipse(curves[i].get(2),curves[i].get(3),12,12);
     pg.ellipse(curves[i].get(4),curves[i].get(5),12,12);
     pg.stroke(color(100,0,0));
     pg.strokeWeight(1);
     pg.line(curves[i].get(0),curves[i].get(1),curves[i].get(2),curves[i].get(3));
     pg.line(curves[i].get(4),curves[i].get(5),curves[i].get(6),curves[i].get(7));
   }
 }
 
 
}
