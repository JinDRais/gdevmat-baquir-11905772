//BlackHole Walker
Walker blackHole = new Walker();

//ArrayList of walkers for matters
ArrayList<Walker> matters = new ArrayList<Walker>();

//Checkers to avoid iterating a function beyond the desired iteration
boolean bHSpawned = false, oMSpawned = false;

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);
  frameRate(500);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth, y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void draw()
{  
  //Create(s) the object(s) but does not render them yet  
  spawnOtherMatter();
  spawnBlackHole();
  
  //makes the black hole follow the position of the mouse
  followMouse();
  
  //All vector logic and renders are executed in this function
  simulation();
  
  //Prints the size of the array list, between 100-150
  println(matters.size());
  
  //Clear screen after 1000 frames
  refresh();
}

void spawnBlackHole()
{
  if (!bHSpawned)
  {
    //Random spawn on screen
    blackHole.position.x = int(random(Window.left, Window.right));
    blackHole.position.y = int(random(Window.bottom, Window.top));
    
    //Preset values for the blackhole in accordance to instructions
    blackHole.scale = 50;
    blackHole.r = 255;
    blackHole.g = 255;
    blackHole.b = 255;
    blackHole.a = 255;
    bHSpawned = true;
  } 
}

void spawnOtherMatter()
{
    //checks if the list is spawned already
    if (!oMSpawned)
    {
      for (int i = 0; i < int(random(100, 150)); i++ )
      {
        //Create a walker inside the list
        matters.add(new Walker());
        
        //Randomizes color
        int red = int(random(256)), green = int(random(256)), blue = int(random(256)), alpha = int(random(100,150));
        
        //Using Gaussian method to spawn on screen
        float xGaussian = randomGaussian(), yGaussian = randomGaussian(), xStandardDeviation = Window.windowWidth / 2, xMean = 0, yStandardDeviation = Window.windowHeight / 2, yMean = 0;
 
        //Assign necessary variables for each iteration of the walker inside the array 
        matters.get(i).position.x = xStandardDeviation * xGaussian + xMean;
        matters.get(i).position.y = yStandardDeviation * yGaussian + yMean;
        matters.get(i).scale = int(random(1,50));
        matters.get(i).r = red;
        matters.get(i).g = green;
        matters.get(i).b = blue;
        matters.get(i).a = alpha;
      }
      oMSpawned = true;
    }
}

void simulation()
{
   background(0);
   for(int i = 0; i < matters.size(); i++)
   {  
     matters.get(i).render();
     blackHole.render();
     PVector direction = PVector.sub(blackHole.position, matters.get(i).position);
     matters.get(i).position.add(direction.normalize()); 
   }  
}

void refresh()
{
  //Turns all necessary variables back to 0 to loop the whole program
  if (frameCount == 1000)
  {
    matters.clear();
    clear();
    background(0);
    frameCount = 0;
    bHSpawned = false;
    oMSpawned = false;
  }
}

void followMouse()
{
  PVector mouse = mousePos(), mouseDirection = PVector.sub(mouse, blackHole.position);;
  blackHole.position.add(mouseDirection.normalize());
}
