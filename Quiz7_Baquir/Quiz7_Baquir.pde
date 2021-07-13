//ArrayList of walkers 
ArrayList<Walker> walkers = new ArrayList<Walker>();

//For executing loop once, needs an if statement
boolean spawned = false;  

//100 walkers
int walkerAmount = 100;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth, y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

/* Vector Motion 101
  1. Add velocity to position
  2. Draw the object at position
*/

void draw()
{
  //Initialize Walkers
  initalizeWalkers();

  //Accelerate
  accelerate();
 
}

void initalizeWalkers()
{
  if (!spawned)
  {
    for (int i = 0; i < walkerAmount; i++)
    {
      //Create walker inside the list
      walkers.add(new Walker());
      
      //Assign random 2D vector to walker position
      walkers.get(i).position.x = int(random(Window.left, Window.right));
      walkers.get(i).position.y = int(random(Window.bottom, Window.top));
      
      //Assign random scale
      walkers.get(i).scale = int(random(1, 25));
    }
    spawned = true;
  } 
}

void accelerate()
{
  background(80);
  
  for (int i = 0; i < walkers.size(); i++)
  {
    //Gets the normalized mouse direction
    PVector normalizedMouseDirection = PVector.sub(mousePos(), walkers.get(i).position).normalize();
    
    //Assigns normalized mouse direction to acceleration and multiplies acceleration by 0.2
    walkers.get(i).acceleration = normalizedMouseDirection;
    walkers.get(i).acceleration.mult(0.2);
    
    //update
    walkers.get(i).update();
    //render
    walkers.get(i).render();
  }
}
