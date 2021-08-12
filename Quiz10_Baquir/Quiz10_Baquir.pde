Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.1, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  float posX = 0;
  
  //Initalizes the walkers with the posX as their position
  initialize(posX); //<>//
}

void draw()
{
  background(255);
  
  //Renders ocean
  ocean.render();
  
  //Simulates gravity, and dragforce on walkers
  simulate();
  
  //Click left mousebutton to call setup(), which resets everything. Function is commented by default.

}

void initialize(float posX)
{
 for (int i = 0; i < walkers.length; i++)
  {
    posX = 1.8 * (Window.windowWidth/walkers.length) * (i-(walkers.length/2));
    walkers[i] = new Walker();
    walkers[i].position = new PVector(posX, 300);
    walkers[i].mass = int(random(1,10));
    walkers[i].scale = walkers[i].mass * 10;
    walkers[i].r = int(random(1,255));
    walkers[i].g = int(random(1,255));
    walkers[i].b = int(random(1,255));
    walkers[i].a = int(random(150,255));
  } 
}

void simulate()
{
   for(Walker w: walkers)
   {
     w.render();
     w.update();
     w.checkEdges();
     PVector gravity = new PVector(0, -0.15f * w.mass);
     w.applyForce(wind); // applying wind for each walkers called of walkers[]
     w.applyForce(gravity); // applying gravity for each walkers called of walkers[]
  
     //computation for friction
     float c = 0.1f;
     float normal = 1;
     float frictionMagnitude = c * normal;
     PVector friction = w.velocity.copy();
     w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); // applying friction for each walkers called of walkers[]
       
     //If a walker collides in the ocean, applies drag force
     if (ocean.isCollidingWith(w))
     {
       PVector dragForce = ocean.calculateDragForce(w);
       w.applyForce(dragForce);
     }
   } 
}

//Uncomment if want to reset everything by left button mouse click

/*
void mouseClicked()
{
  setup(); 
}
*/
