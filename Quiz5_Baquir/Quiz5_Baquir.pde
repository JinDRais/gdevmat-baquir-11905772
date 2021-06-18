void setup()
{
  size(1280, 720, P3D);
  camera(0,0,Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

//PVector position = new PVector();
//PVector speed = new PVector(5, 8);

Walker perlinWalker = new Walker();
Walker bounceWalker = new Walker();

void draw()
{
  //uncomment either perlinWalker or bounceWalker to check if everything works
  
  
  
  //For perlin walker function
  perlinWalker.perlinWalk();
  perlinWalker.render();
  
  
  
  //for move and bound function
  bounceWalker.moveAndBounce();
  
}
