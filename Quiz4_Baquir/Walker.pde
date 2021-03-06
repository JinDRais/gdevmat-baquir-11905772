public class Walker 
{
  //perlinWalk() values
  public float x;
  public float y;
  public float tx = 0, ty = 10000; 
  public float rt = 255;
  public float gt = 150;
  public float bt = 100;
  public float red;
  public float green;
  public float blue;
  
  //render() values
  public float scale;
  public float st = 0;
   
  void render()
  {
    scale = map(noise(st), 0, 1, 5, 150);
    circle(x, y, scale); 
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
   
   x = map(noise(tx), 0, 1, -640, 640);
   y = map(noise(ty), 0, 1, -360, 360);
    
   tx += 0.01f;
   ty += 0.01f;
   
  }
}
