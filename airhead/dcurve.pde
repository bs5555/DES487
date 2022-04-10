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
   fill(0);
   noStroke();
   beginShape();  
   for(int i = 0; i<c; i++)
   {
     vertex(curves[i].get(0),curves[i].get(1));
     bezierVertex(
       curves[i].get(2),
       curves[i].get(3),
       curves[i].get(4),
       curves[i].get(5),
       curves[i].get(6),
       curves[i].get(7)
     );     
   }
   endShape();   
 }
 
 void test()
 {
   for(int i = 0; i<c; i++)
   {
     noFill();
     stroke(color(0,0,100,110));
     strokeWeight(2);
     bezier(
       curves[i].get(0),
       curves[i].get(1),
       curves[i].get(2),
       curves[i].get(3),
       curves[i].get(4),
       curves[i].get(5),
       curves[i].get(6),
       curves[i].get(7)
     );
     noStroke();
     fill(color(0,0,100,110));
     ellipse(curves[i].get(0),curves[i].get(1),12,12);
     ellipse(curves[i].get(6),curves[i].get(7),12,12);
     fill(color(100,0,0,110));
     ellipse(curves[i].get(2),curves[i].get(3),12,12);
     ellipse(curves[i].get(4),curves[i].get(5),12,12);
     stroke(color(100,0,0));
     strokeWeight(1);
     line(curves[i].get(0),curves[i].get(1),curves[i].get(2),curves[i].get(3));
     line(curves[i].get(4),curves[i].get(5),curves[i].get(6),curves[i].get(7));
   }
 }
 
 
}
