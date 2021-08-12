Walker[] walkers = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector (0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0,0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //Initalizes a number of walkers, based on the size of the walkers array, inside it
  initialize();
}

void draw()
{
  //White is drawn to the background each frame
  background(255); 
  
  //Simulates the walkers bouncing with wind and gravity being applied to each iteration
  simulate();
  
  //Click left mousebutton to call setup(), which resets everything. Function is commented by default.
}
void simulate()
{
 for (int i = 0; i < walkers.length; i++)
  {
    //updates each walker
    walkers[i].update();
    //renders each walker
    walkers[i].render();
    //check for a walker if an edge is near
    walkers[i].checkEdges();
    //applies wind to the walker
    walkers[i].applyForce(wind);
    //applies gravity to the walker
    walkers[i].applyForce(gravity); 
  } 
}

void initialize()
{
  for (int i = 0; i < walkers.length; i++)
  {
    //Initializes a walker in the array
    walkers[i] = new Walker(); 
    
    //Places all walkers to this position
    walkers[i].position = new PVector(-500, 200);
    
    //Initializes the values of the walkers
    walkers[i].mass = 10 - i;
    walkers[i].scale = walkers[i].mass * 20;
    walkers[i].r = int((random(255)));
    walkers[i].g = int((random(255)));
    walkers[i].b = int((random(255)));
    walkers[i].a = int((random(150,255)));
  }
}

//Uncomment if want to reset everything by left button mouse click

/*
void mouseClicked()
{
  setup(); 
}
*/
