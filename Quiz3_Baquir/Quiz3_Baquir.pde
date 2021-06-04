void setup()
{
  size(1020, 720, P3D);
  camera(0,0,-(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  //Gaussian function
  float Gaussian = randomGaussian();
  println(Gaussian);// prints if the gaussian function still works
  
  //Applying Gaussian for X coordinate
  float xStandardDeviation = 100;
  float xMean = 0;
  float x = xStandardDeviation * Gaussian + xMean;
  
  //Random for Y coordinate
  int rngY = int(random(-300, 300)); // values are based on the height initialized in size function
  
  //Applying Gaussian for Scale/Thickness
  float scaleStandardDeviation = 5;
  float scaleMean = 30;
  float scale = scaleStandardDeviation * Gaussian + scaleMean;
  
  
  //Creating the circle
  noStroke();
  changeColor();
  circle(x, rngY, scale); 
  
  //Clears screen
  if (frameCount == 300)
  {
    clear();
    background(255);
  }
}

void changeColor()
{
  int red = int(random(256)), green = int(random(256)), blue = int(random(256)), alpha = int(random(10,101));
  fill(red, green, blue, alpha);
}
