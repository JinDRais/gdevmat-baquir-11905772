void setup()
{
    size(1020, 720, P3D);
    camera(0, 0, -(height/2.0) / tan(PI*30.0/180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker(); // creates an instance of our walker class here in sketch
Walker biasedWalker = new Walker();

void draw()
{
  //Renders walker with randomWalk function
  myWalker.randomWalk();
  myWalker.render();
  changeColor();

  //Renders walk with randomWalkBiased function
  biasedWalker.randomWalkBiased();
  biasedWalker.render();
  changeColor();
}

void changeColor()
{
  int red = int(random(256)), green = int(random(256)), blue = int(random(256)), alpha = int(random(50,101));
  fill(red, green, blue, alpha);
}
