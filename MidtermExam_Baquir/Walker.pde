public class Walker
{
  public PVector position = new PVector();
  public float scale;
  
  /*
  //Black Hole
  public PVector bHPosition = new PVector(300, 300);
  public float bHScale = 50;
 
  //Matter
  public PVector speed = new PVector(10, 10);
  public PVector mPosition = new PVector();
  public float mScale = 25;
  */
  
  public void render()
  {
    noStroke();
    circle(position.x, position.y, scale); 
  }
  
  
  /*
  void renderM()
  {
    noStroke();
    fill(255, 0, 0);
    circle(mPosition.x, mPosition.y, mScale);  
  }
  */
  
  /*
  void moveToTarget()
  {
    background(0);
  
    PVector direction = PVector.sub(bHPosition, mPosition);  
    mPosition.add(direction.normalize());
    println(mPosition);
    renderBH();
    renderM();
  }
  */
}
