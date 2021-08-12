Walker[] walkers = new Walker[8];

PVector wind = new PVector(0.15, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  float posY = 0;
  initialize(posY);
}

void draw()
{
  //Draw a line for the breaks
  background(255); 
  noStroke();
  
  //Simulates force working on walkers and braking
  simulate();
  
  //Draws a line in the middle
  drawMiddleLine();

  //Click left mousebutton to call setup(), which resets everything

}

void initialize(float posY)
{
 for (int i = 0; i < walkers.length; i++)
  {
    //Positions
    posY = 2 * (Window.windowHeight / walkers.length) * (i - (walkers.length / 2));

    //Initializes a walker in the array
    walkers[i] = new Walker(); 

    //Places all walkers to this position
    walkers[i].position = new PVector(-500, posY);

    //Initializes the values of the walkers
    walkers[i].mass = 10 - i;
    walkers[i].scale = walkers[i].mass * 10;
    walkers[i].r = int((random(255)));
    walkers[i].g = int((random(255)));
    walkers[i].b = int((random(255)));
    walkers[i].a = int((random(150, 255)));
  } 
}

void simulate()
{
  for (Walker w : walkers)
  {
    //Friction = -1 * mew * N * v
    float mew = 0.01f; // coefficient of friction
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy(); // copy copies the current velocity of our walker
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);

    PVector acceleration = new PVector(0.2, 0);
    //w.acceleration.mult(w.mass); // bonus answer, uncomment to check if working.
    w.update();
    w.render();
    w.applyForce(acceleration);

    // if a walker goes into the middle, mew is translate to 0.4 and recalculated
    if (w.position.x >= 0)
    {
      mew = 0.4f; 
      frictionMagnitude = mew * normal;
      friction = w.velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(frictionMagnitude);
      w.applyForce(friction);
    }
  } 
}

void drawMiddleLine()
{
  strokeWeight(4);
  stroke(0, 0, 0);
  line(0, Window.bottom, 0, Window.top); 
}

void mouseClicked()
{
  setup(); 
}
