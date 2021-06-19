public class Walker 
{
  //perlinWalk() values
  PVector wPosition = new PVector();
  PVector wTime = new PVector(0, 10000);
  public float rt = 255, gt = 150, bt = 100, red, green, blue;
  
  //render() values
  public float scale;
  public float st = 0;
   
  //moveAndBounce() values
  PVector bPosition = new PVector();
  PVector bSpeed = new PVector(5, 8);
   
  void render()
  {
    noStroke();
    scale = map(noise(st), 0, 1, 5, 150);
    circle(wPosition.x, wPosition.y, scale); 
    st += 0.01f;
  }

  void perlinWalk()
  {
  
   red = map(noise(rt + 5), 0, 1, 0, 255);
   green = map(noise(gt + 10), 0, 1, 0, 255);
   blue = map(noise(bt + 15), 0, 1, 0, 255);  
   
   fill(red, green, blue);
   
   print(rt);
   
   rt +=0.01f;
   gt +=0.01f;
   bt +=0.01f; 
   
   wPosition.x = map(noise(wTime.x), 0, 1, -640, 640);
   wPosition.y = map(noise(wTime.y), 0, 1, -360, 360);
    
   wTime.x += 0.01f; 
   wTime.y += 0.01f;
   
  }
  
  void moveAndBounce()
  {
    
    background(255);
    
    // add speed to the current position
    bPosition.add(bSpeed);
    
    // conditions for bouncing
    if((bPosition.x > Window.right) || (bPosition.x < Window.left))
    {
      bSpeed.x *= -1;
    }
    
    if((bPosition.y > Window.top) || (bPosition.y < Window.bottom))
    {
      bSpeed.y *= -1;
    }
    
    // render the circle
    fill(182, 52, 100);
    circle(bPosition.x, bPosition.y, 50);
  
  }
  
}
