public class Walker
{
  public PVector position = new PVector();
  public float scale;
  public float r, g, b, a;

  public void render()
  {
    fill(r,g,b,a);
    noStroke();
    circle(position.x, position.y, scale); 
  }
 
}
