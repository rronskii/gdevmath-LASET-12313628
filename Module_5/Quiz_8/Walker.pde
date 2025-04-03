public class Walker 
{
  public PVector position;
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float velocityLimit = 10;
  public float scale;
  public float mass;
  public color walkerColor;

  public Walker(float mass)
  {
    this.mass = mass;
    this.scale = mass * 15;
    this.position = new PVector(-500, 200);
    this.walkerColor = color(random(255), random(255), random(255), 100);
  }

  // Newton's Second Law of Motion
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // Force accumulation
  }

  public void update()
  {  
    this.velocity.add(this.acceleration); // Velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // Reset acceleration
  }

  public void render()
  {
    noStroke();
    fill(walkerColor);
    circle(position.x, position.y, scale);
  }

  public void checkEdges()
  {
    if (this.position.x > Window.right || this.position.x < Window.left)
    {
      this.velocity.x *= -1; // Bounce on x-axis
      this.position.x = Window.right; 
    }

    if (this.position.y > Window.top || this.position.y < Window.bottom)
    {
      this.velocity.y *= -1; // Bounce on y-axis
      this.position.y = Window.bottom; 
    }
  }
}
