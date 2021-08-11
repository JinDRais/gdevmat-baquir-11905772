public class Walker 
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float r, g, b;
  
  public float velocityLimit = 10;
  public float scale;
  
  public float mass;
  
  public Walker()
  {
    
  }
  
  // Newton's second law of motion
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulation
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration); //velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // resets acceleration every frame
  }
  
  public void render()
  {
    fill(r,g,b);
    circle(position.x, position.y, scale);
  }
}
