//Walker heavyWalker = new Walker();
Walker walker = new Walker();
Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector (0, -0.4);

void setup()
{
  int increment = 0;
  size(1280, 720, P3D);
  camera(0,0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < 10; i++)
  {
    //Initializes a walker in the array
    walkers[i] = new Walker(); 
    
    //Places all walkers to this position
    walkers[i].position.x = -500;
    walkers[i].position.y = 200;
    
    //Initializes the values of the walkers
    walkers[i].mass = 1 + increment;
    walkers[i].scale = walkers[i].mass * 20;
    walkers[i].r = int((random(255)));
    walkers[i].g = int((random(255)));
    walkers[i].b = int((random(255)));
        
    //prints mass of the walker iterated in the console
    print("Mass of walker " + increment + " is: " + walkers[i].mass + " ");
    
    //Adds increment for scale
    increment++;
  }
}

void draw()
{
  background(255); 
  
  for (int i = 0; i < walkers.length; i++)
  { 
    walkers[i].render();
    walkers[i].update();
    walkers[i].applyForce(wind);
    walkers[i].applyForce(gravity);
    
    if (walkers[i].position.x >= Window.right)
    {
      walkers[i].velocity.x *= -1; 
    }
    else if (walkers[i].position.y <= Window.left)
    {
      walkers[i].velocity.x *= 1; 
    }
    
    if (walkers[i].position.y <= Window.bottom)
    {
      walkers[i].velocity.y *= -1; // Newton's third law of motion
    }
    else if (walkers[i].position.y >= Window.top)
    {
      walkers[i].velocity.y *= 1; 
    }
  }
}
