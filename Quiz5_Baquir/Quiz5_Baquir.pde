void setup()
{
  size(1280, 720, P3D);
  camera(0,0,Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker perlinWalker = new Walker();
Walker bounceWalker = new Walker();

void draw()
{
  //uncomment only one, either perlinWalker or bounceWalker to check if everything works
  
  /*
  //For perlin walker function
  perlinWalker.perlinWalk();
  perlinWalker.render();
  */
  
  //for move and bound function
  bounceWalker.moveAndBounce();
}
