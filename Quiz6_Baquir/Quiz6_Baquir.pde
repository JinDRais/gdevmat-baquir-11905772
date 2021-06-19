void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight/2);
  return new PVector(x,y);
}

void draw()
{
  background(130); 
  strokeWeight(5);
  stroke(255, 0, 0);

  PVector mouse = mousePos();
  
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  strokeWeight(5);
  stroke(0,0,0);
  line(-mouse.x / 8, -mouse.y / 8, mouse.x / 8, mouse.y / 8);
  
  println(mouse.mag());
}
