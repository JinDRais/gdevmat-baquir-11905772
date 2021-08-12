Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 
  
  //Initializes the walkers inside with random position, colors, mass and scale.
  initialize();
}

void draw()
{
  background(255);
  
  //Simulates graviational forces acting on each walker initalized
  simulate();
}

void initialize()
{
  for(int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].r = int(random(1,255));
    walkers[i].g = int(random(1,255));
    walkers[i].b = int(random(1,255));
    walkers[i].a = int(random(150,255));
    walkers[i].mass = int(random(5,25));
    walkers[i].scale = walkers[i].mass * 10;
    walkers[i].position.x = int(random(Window.left, Window.right));
    walkers[i].position.y = int(random(Window.bottom, Window.top));
  }
}

void simulate()
{
  //Iterates each walker inside the array to render and update
  for (Walker w : walkers)
  {
    w.render();
    w.update();
    
    //Another loop to iterate walkers in the walkers array for the checker
    for (Walker j : walkers)
    {
      /*
      if the current iteration in the main loop is not equal to the iteration of the inner loop, 
      applies force on the current interation of the main loop, in which the current iteration of the inner loop calculates its 
      attraction to the current iteration of the main loop
      */
      if (w != j)
      {
        w.applyForce(j.calculateAttraction(w));
      }
    }
  }
}

//Uncomment if want to reset everything by left mouse button click

/*
void mouseClicked()
{
  setup();
}
*/
