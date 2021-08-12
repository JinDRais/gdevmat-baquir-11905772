public class Walker
{
    public PVector position = new PVector();
    public PVector velocity = new PVector();
    public PVector acceleration = new PVector();
    
    public float velocityLimit = 10;
    public float scale;
    
    public Walker()
    {
    }
    
    public void update()
    {
      this.velocity.add(this.acceleration);
      this.velocity.limit(velocityLimit);
      this.position.add(this.velocity);
    }
    
    public void render()
    {
      circle(position.x, position.y, scale);
    }
    
    public void checkEdges()
    {
      if(this.position.x > Window.right)
      {
        this.position.x = Window.right;
        this.velocity.x *= -1;
      }
      
      else if(this.position.x < Window.left)
      {
        this.position.x = Window.left;
        this.velocity.x *= 1;
      }
      
      if(this.position.y > Window.top)
      {
        this.position.y = Window.top;
        this.velocity.y *= 1;
        
      }
      
      else if(this.position.y < Window.bottom)
      {
        this.position.y = Window.bottom;
        this.velocity.y *= -1;
      }
    }  
}
