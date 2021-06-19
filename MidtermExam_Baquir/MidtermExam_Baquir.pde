Walker blackHole = new Walker();
Walker[] otherMatter = new Walker[100];
boolean bHSpawned = false;
boolean oMSpawned = false;

void setup()
{
  //For background
  background(0);
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight/2);
  return new PVector(x, y);
}

void draw()
{  
  //for blackhole
  spawnBlackHole();
  
  //for otherMatter
  goToTarget();
  
  //Clear screen after 100 frames
  clearScreen();
}

void spawnBlackHole()
{
  if (!bHSpawned)
  {
    //Random spawn on screen
    blackHole.position.x = int(random(Window.left, Window.right));
    blackHole.position.y = int(random(Window.bottom, Window.top));
    blackHole.scale = 50;
    fill(255);
    blackHole.render();
    bHSpawned = true;
  } 
}

void spawnOtherMatter()
{
    for (int i = otherMatter.length, )
    {
      
    }
  
      //Gaussian function
    float xGaussian = randomGaussian();
    float yGaussian = randomGaussian();
    
    //Using Gaussian method to spawn on screen;
    float xStandardDeviation = Window.right / 2, xMean = 0;
    float yStandardDeviation = Window.top / 2, yMean = 0;
    
    otherMatter.position.x = xStandardDeviation * xGaussian + xMean;
    otherMatter.position.y = yStandardDeviation * yGaussian + yMean;
    otherMatter.scale = int(random(100));
    int red = int(random(256)), green = int(random(256)), blue = int(random(256)), alpha = int(random(101));
    fill(red, green, blue, alpha);
    otherMatter.render();
    println(otherMatter.position);
  
}

void goToTarget()
{


  
}

void clearScreen()
{
  if (frameCount == 100)
  {
    clear();
    background(0);
    frameCount = 0;
    bHSpawned = false;
  }
  //println(frameCount);  
}
