//Walkers
Walker blackHole = new Walker();
Walker[] matterList = new Walker[100];

//Checkers
boolean bHSpawned = false;
boolean oMSpawned = false;

//For mouse
PVector mPosition = new PVector();

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1280, 720, P3D);
  frameRate(500);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void draw()
{  
  
  //Creates the object but do not renders them yet  
  spawnOtherMatter();
  spawnBlackHole();
  
  //follow mouse
  followMouse();
  
  //for otherMatter
  simulation();
  
  //Clear screen after 100 frames
  refresh();
}

void spawnBlackHole()
{
  if (!bHSpawned)
  {
    //Random spawn on screen
    blackHole.position.x = int(random(Window.left, Window.right));
    blackHole.position.y = int(random(Window.bottom, Window.top));
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
    if (!oMSpawned)
    {
      for (int i = 0; i < matterList.length; i++ )
      {
        //Create a walker inside the list
        matterList[i] = new Walker();
        
        //randomizes color
        int red = int(random(256)), green = int(random(256)), blue = int(random(256)), alpha = int(random(100,150));
        
        //Gaussian function
        float xGaussian = randomGaussian();
        float yGaussian = randomGaussian();
    
        //Using Gaussian method to spawn on screen;
        float xStandardDeviation = Window.windowWidth / 2, xMean = 0;
        float yStandardDeviation = Window.windowHeight / 2, yMean = 0;
          
        //Assign necessary variables
        matterList[i].position.x = xStandardDeviation * xGaussian + xMean;
        matterList[i].position.y = yStandardDeviation * yGaussian + yMean;
        matterList[i].scale = int(random(50));
        matterList[i].r = red;
        matterList[i].g = green;
        matterList[i].b = blue;
        matterList[i].a = alpha;
       
      }
      oMSpawned = true;
    }
}

void simulation()
{
      background(0);
      for(int i = 0; i < matterList.length; i++)
      {
        PVector direction = PVector.sub(blackHole.position, matterList[i].position);
        matterList[i].position.add(direction.normalize()); 
        matterList[i].render();
        blackHole.render();
      }  
}

void refresh()
{
  if (frameCount == 1000)
  {
    clear();
    background(0);
    frameCount = 0;
    bHSpawned = false;
    oMSpawned = false;
  }
}

void followMouse()
{
  PVector mouse = mousePos();
  PVector mouseDirection = PVector.sub(mouse, blackHole.position);
  blackHole.position.add(mouseDirection.normalize());
}
