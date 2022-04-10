PShape head;
void setup()
{
  size(1000,1000);
  head=loadShape("head.svg");
}

void draw()
{
  background(255);
  for (int i = 0; i < head.getVertexCount(); i++) {
    PVector v = head.getVertex(i);
    v.x += random(-1, 1);
    v.y += random(-1, 1);
    head.setVertex(i, v);
  }
  shape(head);
}
